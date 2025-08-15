import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TechStackShowcase extends StatelessWidget {
  final List<Map<String, String>> techStack = [
    {"name": "Flutter", "icon": "assets/images/flutter.png"},
    {"name": "FastAPI", "icon": "assets/images/fastapi.png"},
    {"name": "Flask", "icon": "assets/images/flask.png"},
    {"name": "Python", "icon": "assets/images/python.png"},
    {"name": "Firebase", "icon": "assets/images/firebase.png"},
    {"name": "Supabase", "icon": "assets/images/supabase.png"},
    {"name": "GitHub", "icon": "assets/images/git.png"},
    {"name": "TensorFlow Lite", "icon": "assets/images/tensorflow.png"},
    {"name": "Java", "icon": "assets/images/java.png"},
    {"name": "Dart", "icon": "assets/images/dart.png"},
    {"name": "MongoDB", "icon": "assets/images/mongo.png"},
    {"name": "AWS", "icon": "assets/images/aws.png"},
  ];

  TechStackShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 3 : 5,
              mainAxisSpacing: 25,
              crossAxisSpacing: 25,
              childAspectRatio: isMobile ? 0.9 : 1.0,
            ),
            itemCount: techStack.length,
            itemBuilder: (context, index) {
              final tech = techStack[index];
              return _TechCard(name: tech["name"]!, iconPath: tech["icon"]!);
            },
          ),
        ],
      ),
    );
  }
}

class _TechCard extends StatefulWidget {
  final String name;
  final String iconPath;

  const _TechCard({required this.name, required this.iconPath});

  @override
  State<_TechCard> createState() => _TechCardState();
}

class _TechCardState extends State<_TechCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.07 : 1.0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          transform: _isHovered
              ? Matrix4.translationValues(0, -4, 0) // Smooth lift on hover
              : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.15),
                Colors.white.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: _isHovered
                  ? Colors.blueAccent.withOpacity(0.6)
                  : Colors.white.withOpacity(0.15),
              width: 1.3,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? Colors.blueAccent.withOpacity(0.3)
                    : Colors.black.withOpacity(0.1),
                blurRadius: _isHovered ? 18 : 8,
                spreadRadius: _isHovered ? 1 : 0,
                offset: const Offset(0, 6),
              ),
            ],
            backgroundBlendMode: BlendMode.overlay,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      opacity: _isHovered ? 1.0 : 0.85,
                      child: Image.asset(
                        widget.iconPath,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.name.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.robotoMono(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.9),
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
