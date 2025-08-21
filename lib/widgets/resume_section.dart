import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  final String resumeUrl = "https://yourdomain.com/resume.pdf";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAF9F6),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 800;

          // Dynamic font sizes
          double headingFontSize = isMobile ? 28 : 64;
          double subHeadingFontSize = isMobile ? 22 : 48;
          double bodyFontSize = isMobile ? 14 : 16;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Wrap in Row only if not mobile
              if (!isMobile)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column
                    Expanded(
                      child: _buildLeftColumn(
                          headingFontSize, bodyFontSize, context),
                    ),
                    const SizedBox(width: 40),
                    // Right Column
                    Expanded(
                      child:
                          _buildRightColumn(subHeadingFontSize, bodyFontSize),
                    ),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLeftColumn(headingFontSize, bodyFontSize, context),
                    const SizedBox(height: 40),
                    _buildRightColumn(subHeadingFontSize, bodyFontSize),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLeftColumn(
      double headingFontSize, double bodyFontSize, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let’s Work Together.",
          style: TextStyle(
            fontSize: headingFontSize,
            color: Colors.black87,
            fontFamily: 'Aeonik',
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Here are some quotes and thoughts that inspire my work, "
          "along with my experiences that shape my journey.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey[700],
                fontSize: bodyFontSize,
              ),
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            QuoteCard(text: "Creativity is intelligence having fun."),
            SizedBox(height: 12),
            QuoteCard(text: "Design is thinking made visual."),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {
            // TODO: Open resume link
          },
          icon: const Icon(Icons.download, color: Colors.white),
          label: const Text(
            "Download Resume",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildRightColumn(double subHeadingFontSize, double bodyFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Certifications and Contributions",
          style: TextStyle(
            fontSize: subHeadingFontSize,
            fontFamily: 'Aeonik',
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '''• Flutter Essential Training - LinkedIn Learning
• Oracle Cloud Infrastructure 2025 Certified AI Foundations Associate
• Artificial Intelligence Fundamentals - IBM
• Oracle Cloud Infrastructure 2025 Certified Generative AI Professional
• AWS Academy Graduate - AWS Academy Cloud Architecting
• AWS Academy Graduate - AWS Academy Cloud Foundations''',
          style: TextStyle(
            fontSize: bodyFontSize,
            height: 1.6,
            fontFamily: 'Aeonik',
          ),
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
        const SizedBox(height: 30),
        Align(
          alignment: Alignment.centerLeft,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              // 👉 Navigate to achievements
            },
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
            label: const Text(
              "Next: Achievements",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

class QuoteCard extends StatelessWidget {
  final String text;
  const QuoteCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(FontAwesomeIcons.quoteLeft,
            size: 18, color: Color(0XFF17CF73)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
