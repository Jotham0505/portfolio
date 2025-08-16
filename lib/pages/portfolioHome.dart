import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/aboutSection.dart';
import 'package:portfolio/widgets/about_Section.dart';
import 'package:portfolio/widgets/projects.dart';
import 'package:portfolio/widgets/tech_grid.dart';

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _pulseController;
  late AnimationController _staggerController;
  String _hoveredNav = "";

  @override
  void initState() {
    super.initState();

    _rotationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 14))
          ..repeat();

    _pulseController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat(reverse: true);

    // Single stagger controller for fade/slide sequence
    _staggerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..forward();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    _staggerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ✅ Top Navigation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Rotating circular logo
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
                          Text("Jotham Cheeran",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Aeonik',
                              )),
                          Text(
                            "Flutter Developer",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[700],
                              fontFamily: 'Aeonik',
                            ),
                          ),
                        ],
                      ),
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

            // ✅ Hero Section
            AnimatedBuilder(
              animation: _staggerController,
              builder: (context, child) {
                final value = _staggerController.value;
                return Column(
                  children: [
                    // Profile Image with pulse glow
                    Transform.scale(
                      scale: Curves.easeOutBack.transform(
                          value.clamp(0.0, 0.4) / 0.4), // scale-in first
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Glow Ring
                          ScaleTransition(
                            scale: Tween(begin: 0.9, end: 1.1).animate(
                                CurvedAnimation(
                                    parent: _pulseController,
                                    curve: Curves.easeInOut)),
                            child: Container(
                              width: 260,
                              height: 260,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.08),
                                    Colors.transparent,
                                  ],
                                  stops: const [0.6, 1.0],
                                ),
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
                    const SizedBox(height: 30),

                    // Headline
                    Opacity(
                      opacity: Curves.easeIn
                          .transform(((value - 0.3).clamp(0.0, 0.3)) / 0.3),
                      child: Column(
                        children: [
                          Text(
                            "Pixels. Code. Impact.",
                            style: TextStyle(
                              fontSize: isMobile ? 28 : 40,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              fontFamily: 'Aeonik',
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "AI • Flutter • Creativity",
                            style: TextStyle(
                              fontSize: isMobile ? 16 : 28,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 1.2,
                              fontFamily: 'Aeonik',
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Intro text
                    Opacity(
                      opacity: Curves.easeIn
                          .transform(((value - 0.55).clamp(0.0, 0.45)) / 0.45),
                      child: SizedBox(
                        width: isMobile ? screenWidth * 0.85 : 650,
                        child: Text(
                          "I’m an AI & Flutter developer passionate about building "
                          "intelligent, high-performance, and visually stunning applications.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 16,
                            color: Colors.grey[700],
                            height: 1.6,
                            fontFamily: 'Aeonik',
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 50),

            // ✅ Scroll-triggered sections
            const Aboutsection(),
            const SizedBox(height: 50),

            TechStackShowcase(),
            const SizedBox(height: 50),
            ProjectAccordion(),
          ],
        ),
      ),
    );
  }

  // ✅ Smooth nav hover
  Widget _navItem(String title) {
    final isHovered = _hoveredNav == title;
    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredNav = title),
      onExit: (_) => setState(() => _hoveredNav = ""),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isHovered ? Colors.black : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: GoogleFonts.playfairDisplay(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
            color: isHovered ? Colors.black : Colors.grey[800],
          ),
          child: Text(title),
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
