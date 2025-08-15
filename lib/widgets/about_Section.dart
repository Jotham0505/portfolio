import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/tech_grid.dart';
import 'package:portfolio/widgets/what_i_do_widget.dart';

class Aboutsection extends StatelessWidget {
  const Aboutsection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      color: const Color(0xFFFAFAFA), // soft off-white
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildIntro(),
                const SizedBox(height: 40),
                //_buildStats(),
                WhatIDoSection(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: _buildIntro()),
                //Expanded(flex: 3, child: _buildStats(),),
                Expanded(flex: 2, child: WhatIDoSection()),
              ],
            ),
    );
  }

  Widget _buildIntro() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About Me",
          style: GoogleFonts.playfairDisplay(
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "I’m Jotham Emmanuel Cheeran — a student developer from Vellore Institute of Technology, "
          "crafting fast, accessible mobile apps with Flutter and powering them with intelligence through Python and applied ML. "
          "I design end-to-end experiences — from clean, elegant UI to measurable outcomes — often bridging Flutter with "
          "FastAPI or Flask backends to deliver full-stack solutions. I thrive in collaborative, team-driven environments "
          "where creativity meets precision. Recent work includes semantic search powered by embeddings and "
          "iterative shipping with Git/GitHub workflows. Open to internships where impact, craft, and teamwork truly matter.",
          style: GoogleFonts.playfairDisplay(fontSize: 16, height: 1.5),
        ),
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
                style: GoogleFonts.playfairDisplay(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward, size: 18),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStats() {
    final stats = [
      {"value": "10+", "label": "Full-stack projects built"},
      {"value": "95%", "label": "Client satisfaction rating"},
      {"value": "500+", "label": "Hours in collaborative dev work"},
      {"value": "3+", "label": "Hackathons participated in"},
    ];

    return Wrap(
      spacing: 40,
      runSpacing: 40,
      children: stats
          .map((stat) => SizedBox(
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stat["value"]!,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      stat["label"]!,
                      style: GoogleFonts.openSans(
                          fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
