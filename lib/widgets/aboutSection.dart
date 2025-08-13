import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 👈 Align left
              children: [
                Text(
                  "Hello",
                  style: TextStyle(
                    fontFamily: 'Aeonik',
                    fontSize: 150,
                  ),
                ),
                Text(
                  "I’m Jotham Emmanuel Cheeran—a student developer building fast, accessible mobile apps with Flutter and adding intelligence with Python and applied ML. I love turning ideas into polished features end‑to‑end, from clean UI to measurable outcomes. Recent work includes semantic search powered by embeddings and iterative shipping with Git/GitHub workflows. Open to internships where impact and craft both matter.",
                  style: AppText.body.copyWith(
                    color: AppColors.secondary.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 40),

          // Right: Profile Image with Stack
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/profile2.png',
                height: 800,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
