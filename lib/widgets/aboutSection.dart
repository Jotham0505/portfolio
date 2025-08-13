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

        return SizedBox(
          width: double.infinity,
          height: isMobile ? 900 : 600,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background text content
              Positioned.fill(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Vertical "APP DEVELOPER" label
                      RotatedBox(
                        quarterTurns: 3,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "2025",
                              style: AppText.small.copyWith(
                                fontWeight: FontWeight.w500,
                                letterSpacing: 2,
                                color: AppColors.secondary.withOpacity(0.3),
                              ),
                            ),
                            const SizedBox(width: 10),
                            // The line
                            Container(
                              width: 360, // length of the line
                              height: 1.2,
                              color: AppColors.secondary.withOpacity(0.4),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "App Developer",
                              style: AppText.small.copyWith(
                                fontWeight: FontWeight.w500,
                                letterSpacing: 2,
                                color: AppColors.secondary.withOpacity(0.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30), // Gap between label and text
                      Expanded(child: _buildTextContent(screenWidth, isMobile)),
                    ],
                  ),
                ),
              ),

              // Foreground image
              Align(
                alignment:
                    isMobile ? Alignment.topCenter : Alignment.centerRight,
                child: _buildImage(screenWidth, isMobile),
              ),

              // Scroll down arrow
              /*Positioned(
                bottom: 20,
                left: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Scroll down",
                      style: AppText.small.copyWith(
                        color: AppColors.secondary.withOpacity(0.7),
                        letterSpacing: 1.5,
                      ),
                    ),
                    const Icon(Icons.arrow_downward_outlined,
                        color: AppColors.secondary, size: 15),
                  ],
                ),
              ),*/
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextContent(double screenWidth, bool isMobile) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello",
          style: TextStyle(
            fontFamily: 'fonnts.com-Aeonik-Bold.ttf',
            fontSize: isMobile ? 60 : screenWidth * 0.15,
            fontWeight: FontWeight.normal,
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
              fontSize: isMobile ? 16 : 18,
              height: 1.5,
              color: AppColors.secondary.withOpacity(0.85),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Scroll down",
              style: AppText.small.copyWith(
                color: AppColors.secondary.withOpacity(0.7),
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(
              Icons.arrow_downward_outlined,
              color: AppColors.secondary,
              size: 15,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImage(double screenWidth, bool isMobile) {
    return Image.asset(
      'assets/images/profile2.png',
      height: isMobile ? 400 : screenWidth * 0.6,
      fit: BoxFit.contain,
    );
  }
}
