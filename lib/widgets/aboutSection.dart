import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 900;
        final screenWidth = MediaQuery.of(context).size.width;

        return Stack(
          children: [
            // Main Row for content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Vertical Text (2025 | line | App Developer)
                  RotatedBox(
                    quarterTurns: 3,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "2025",
                          style: AppText.small.copyWith(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 6,
                            color: AppColors.secondary.withOpacity(0.4),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 200,
                          height: 1.2,
                          color: AppColors.secondary.withOpacity(0.4),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "App Developer",
                          style: AppText.small.copyWith(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 6,
                            color: AppColors.secondary.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),

                  // Text Section
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello",
                          style: TextStyle(
                            fontFamily: 'Aeonik',
                            fontSize: isMobile ? 40 : screenWidth * 0.15,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: isMobile ? double.infinity : screenWidth * 0.5,
                          child: Text(
                            "I’m Jotham Emmanuel Cheeran—a student developer building fast, accessible mobile apps "
                            "with Flutter and adding intelligence with Python and applied ML. I love turning ideas "
                            "into polished features end-to-end, from clean UI to measurable outcomes. Recent work "
                            "includes semantic search powered by embeddings and iterative shipping with Git/GitHub "
                            "workflows. Open to internships where impact and craft both matter.",
                            style: AppText.body.copyWith(
                              fontSize:
                                  isMobile ? 14 : 18, // smaller font on mobile
                              height: 1.5,
                              color: AppColors.secondary.withOpacity(0.85),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Scroll down section
                        Row(
                          children: [
                            Text(
                              "Scroll down",
                              style: AppText.small.copyWith(
                                color: AppColors.secondary.withOpacity(0.7),
                                letterSpacing: 1.5,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.arrow_downward_outlined,
                              color: AppColors.secondary,
                              size: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Profile Image — responsive
            Align(
              alignment:
                  isMobile ? Alignment.centerRight : Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: isMobile ? 20 : 0),
                child: _buildImage(screenWidth, isMobile),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildImage(double screenWidth, bool isMobile) {
    return Image.asset(
      'assets/images/profile2.png',
      height: isMobile ? 250 : screenWidth * 0.6, // reduced size on mobile
      fit: BoxFit.contain,
    );
  }
}
