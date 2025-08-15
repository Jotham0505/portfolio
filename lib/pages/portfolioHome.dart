import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/aboutSection.dart';
import 'package:portfolio/widgets/about_Section.dart';

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _lineController;
  late Animation<double> _lineHeight;
  String _hoveredNav = "";

  @override
  void initState() {
    super.initState();

    _rotationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 8))
          ..repeat();

    _lineController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _lineHeight = Tween<double>(begin: 18, end: 30).animate(
      CurvedAnimation(parent: _lineController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _lineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    //final isMobile = MediaQuery.of(context).size.width < 600;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFAF9F6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Navigation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Animated logo + name
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          RotationTransition(
                            turns: _rotationController,
                            child: CustomPaint(
                              size: const Size(48, 48),
                              painter: CircularTextPainter(
                                text: "JOTHAM • EMMANUEL • CHEERAN •",
                                textStyle: GoogleFonts.playfairDisplay(
                                  fontSize: 8,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 14,
                            backgroundImage:
                                const AssetImage("assets/images/logo.png"),
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),

                      // Name & Role
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jotham Cheeran",
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Flutter Developer",
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(width: 10),
                    ],
                  ),
                  if (!isMobile)
                    Row(
                      children: [
                        _navItem("Home"),
                        _navItem("About me"),
                        _navItem("Skills"),
                        _navItem("Project"),
                        _navItem("Resume"),
                      ],
                    )
                  else
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  // Profile image with animated glow + fade
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 800),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, 20 * (1 - value)),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Glow ring
                              Container(
                                width: 260,
                                height: 260,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: RadialGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.05),
                                      Colors.transparent,
                                    ],
                                    stops: const [0.6, 1.0],
                                  ),
                                ),
                              ),
                              const CircleAvatar(
                                radius: 120,
                                backgroundImage:
                                    AssetImage('assets/images/profile2.png'),
                                backgroundColor: Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 30),

                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 900),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, 20 * (1 - value)),
                          child: Column(
                            children: [
                              Text(
                                "Pixels. Code. Impact.",
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: isMobile ? 28 : 40,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "AI • Flutter • Creativity",
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: isMobile ? 16 : 28,
                                  color: Colors.grey[700],
                                  letterSpacing: 2,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // Intro text
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 1000),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, 20 * (1 - value)),
                          child: SizedBox(
                            width: isMobile ? screenWidth * 0.85 : 650,
                            child: Text(
                              "I’m an AI & Flutter developer passionate about building\n"
                              "intelligent, high-performance, and visually stunning applications.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                fontSize: isMobile ? 14 : 16,
                                color: Colors.grey[700],
                                height: 1.6,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Aboutsection(),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String title) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredNav = title),
      onExit: (_) => setState(() => _hoveredNav = ""),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _hoveredNav == title ? Colors.black : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
            color: _hoveredNav == title ? Colors.black : Colors.grey[800],
          ),
        ),
      ),
    );
  }
}

class CircularTextPainter extends CustomPainter {
  final String text;
  final TextStyle textStyle;

  CircularTextPainter({required this.text, required this.textStyle});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2.4;
    final totalAngle = 2 * math.pi;
    final perCharAngle = totalAngle / text.length;

    for (int i = 0; i < text.length; i++) {
      final char = text[i];
      final angle = i * perCharAngle - math.pi / 2;

      final textPainter = TextPainter(
        text: TextSpan(text: char, style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();

      final offset = Offset(
        size.width / 2 + radius * math.cos(angle) - textPainter.width / 2,
        size.height / 2 + radius * math.sin(angle) - textPainter.height / 2,
      );

      canvas.save();
      canvas.translate(offset.dx + textPainter.width / 2,
          offset.dy + textPainter.height / 2);
      canvas.rotate(angle + math.pi / 2);
      canvas.translate(-textPainter.width / 2, -textPainter.height / 2);
      textPainter.paint(canvas, Offset.zero);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(CircularTextPainter oldDelegate) => false;
}
