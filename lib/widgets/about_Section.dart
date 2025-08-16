import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/widgets/what_i_do_widget.dart';

class Aboutsection extends StatelessWidget {
  const Aboutsection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      color: Colors.black, // soft off-white
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        children: [
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildIntro()
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 200.ms)
                        .slideY(begin: 0.2, curve: Curves.easeOut),
                    WhatIDoSection()
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 400.ms)
                        .slideY(begin: 0.2, curve: Curves.easeOut),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildIntro()
                          .animate()
                          .fadeIn(duration: 600.ms, delay: 200.ms)
                          .slideX(begin: -0.2, curve: Curves.easeOut),
                    ),
                    Expanded(
                      flex: 2,
                      child: WhatIDoSection()
                          .animate()
                          .fadeIn(duration: 600.ms, delay: 400.ms)
                          .slideX(begin: 0.2, curve: Curves.easeOut),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildIntro() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("About Me",
            style: TextStyle(
                fontSize: 64, fontFamily: 'Aeonik', color: Colors.white)),
        const SizedBox(height: 16),
        Text(
            "I’m Jotham Emmanuel Cheeran — a student developer from Vellore Institute of Technology, "
            "crafting fast, accessible mobile apps with Flutter and powering them with intelligence through Python and applied ML. "
            "I design end-to-end experiences — from clean, elegant UI to measurable outcomes — often bridging Flutter with "
            "FastAPI or Flask backends to deliver full-stack solutions. I thrive in collaborative, team-driven environments "
            "where creativity meets precision. Recent work includes semantic search powered by embeddings and "
            "iterative shipping with Git/GitHub workflows. Open to internships where impact, craft, and teamwork truly matter.",
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              fontFamily: 'Aeonik',
              color: Colors.white,
            )),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {
            // contact link
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Contact Me",
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward_rounded,
                  size: 18, color: Colors.grey[800]),
            ],
          ),
        ),
      ],
    );
  }
}
