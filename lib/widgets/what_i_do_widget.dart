import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhatIDoSection extends StatelessWidget {
  final List<Map<String, String>> services = [
    {
      "title": "Mobile App Development",
      "icon": "assets/images/flutter.png",
      "description":
          "Crafting smooth, cross-platform apps with Flutter and pixel-perfect UI/UX."
    },
    {
      "title": "AI & Machine Learning",
      "icon": "assets/images/brain.png",
      "description":
          "Building intelligent systems with Python, TensorFlow Lite, and edge AI."
    },
    {
      "title": "Backend Development",
      "icon": "assets/images/api.png",
      "description":
          "Fast, secure APIs using FastAPI, Flask, and cloud integration."
    },
    {
      "title": "Full-Stack",
      "icon": "assets/images/cloud.png",
      "description":
          "From idea to deployment — mobile, backend, AI, and hosting."
    },
  ];

  WhatIDoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              mainAxisSpacing: 25,
              crossAxisSpacing: 25,
              childAspectRatio: isMobile ? 1.5 : 1.5,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return _FlipCard(
                title: service["title"]!,
                iconPath: service["icon"]!,
                description: service["description"]!,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FlipCard extends StatefulWidget {
  final String title;
  final String iconPath;
  final String description;

  const _FlipCard({
    required this.title,
    required this.iconPath,
    required this.description,
  });

  @override
  State<_FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<_FlipCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  bool _isFlipped = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) {
        setState(() {
          _isHovered = false;
          _isFlipped = false;
        });
      },
      child: GestureDetector(
        onTap: () => setState(() => _isFlipped = !_isFlipped),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: _isHovered
              ? (Matrix4.identity()..scale(1.05))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.10),
                Colors.white.withOpacity(0.04),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: Colors.white.withOpacity(0.15),
              width: 1.2,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.25), // soft white glow
                      blurRadius: 25,
                      offset: const Offset(0, 4),
                    ),
                    BoxShadow(
                      color: const Color(0xFFB3E5FC)
                          .withOpacity(0.15), // soft pastel cyan tint
                      blurRadius: 35,
                      offset: const Offset(0, 12),
                    ),
                  ]
                : [],
            backgroundBlendMode: BlendMode.overlay,
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, anim) {
              final rotate = Tween(begin: pi, end: 0.0).animate(anim);
              return AnimatedBuilder(
                animation: rotate,
                builder: (context, childWidget) {
                  final isUnder = (ValueKey(_isFlipped) != childWidget!.key);
                  var tilt = ((anim.value - 0.5).abs() - 0.5) * 0.003;
                  tilt *= isUnder ? -1.0 : 1.0;
                  final value =
                      isUnder ? min(rotate.value, pi / 2) : rotate.value;
                  return Transform(
                    transform: (Matrix4.rotationY(value)..setEntry(3, 0, tilt)),
                    child: childWidget,
                    alignment: Alignment.center,
                  );
                },
                child: child,
              );
            },
            child: _isFlipped
                ? _BackCard(
                    description: widget.description,
                    key: ValueKey(true),
                  )
                : _FrontCard(
                    title: widget.title,
                    iconPath: widget.iconPath,
                    key: ValueKey(false),
                  ),
          ),
        ),
      ),
    );
  }
}

class _FrontCard extends StatelessWidget {
  final String title;
  final String iconPath;

  const _FrontCard({required this.title, required this.iconPath, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 55),
          const SizedBox(height: 18),
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 1,
                fontFamily: 'Aeonik',
              )),
        ],
      ),
    );
  }
}

class _BackCard extends StatelessWidget {
  final String description;

  const _BackCard({required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Center(
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: GoogleFonts.playfairDisplay(
            fontSize: 14,
            color: Colors.white,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
