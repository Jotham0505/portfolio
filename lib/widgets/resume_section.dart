import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResumeSection extends StatefulWidget {
  const ResumeSection({super.key});

  @override
  State<ResumeSection> createState() => _ResumeSectionState();
}

class _ResumeSectionState extends State<ResumeSection> {
  final String resumeUrl = "https://yourdomain.com/resume.pdf";
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Function to launch URL
  /*void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      // Could not launch the URL
      // You can show a snackbar or dialog here to inform the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAF9F6),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 800;

          double headingFontSize = isMobile ? 32 : 64;
          double subHeadingFontSize = isMobile ? 24 : 48;
          double bodyFontSize = isMobile ? 14 : 16;

          // Define the content for each slide
          final List<Widget> slides = [
            _buildCertificationsSlide(subHeadingFontSize, bodyFontSize),
            _buildLeetCodeSlide(subHeadingFontSize, bodyFontSize),
            _buildAchievementsSlide(subHeadingFontSize, bodyFontSize),
          ];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isMobile)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildLeftColumn(
                          headingFontSize, bodyFontSize, context),
                    ),
                    const SizedBox(width: 40), // make changes to the spacing
                    Expanded(
                      child: _buildRightColumn(slides),
                    ),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLeftColumn(headingFontSize, bodyFontSize, context),
                    const SizedBox(height: 40),
                    _buildRightColumn(slides),
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
      crossAxisAlignment: CrossAxisAlignment.start, // init command
      children: [
        Text(
          "Let’s Work Together.",
          style: TextStyle(
            fontSize: headingFontSize,
            color: Colors.black87,
            fontFamily: 'Aeonik',
            //fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Here are some quotes and thoughts that inspire my work, "
          "along with my experiences that shape my journey.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey[700],
                fontSize: bodyFontSize,
                height: 1.5,
                fontFamily: 'Aeonik',
              ),
        ),
        const SizedBox(height: 20),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuoteCard(text: "Creativity is intelligence having fun."),
            SizedBox(height: 12),
            QuoteCard(text: "Design is thinking made visual."),
          ],
        ),
        const SizedBox(height: 30),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 28),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {}, //_launchURL(resumeUrl),
          icon: const Icon(Icons.download, color: Colors.white),
          label: const Text(
            "Download Resume",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildRightColumn(List<Widget> slides) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          // setting a fixed height for the PageView to avoid layout errors
          height: 275,
          child: PageView(
            controller: _pageController,
            children: slides,
          ),
        ),
        Divider(color: Colors.black12, thickness: 0.5),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Previous Button
            Opacity(
              opacity: _currentPage == 0 ? 0.5 : 1.0,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _currentPage == 0
                    ? null
                    : () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                label: const Text(
                  "Previous",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            // Next Button
            Opacity(
              opacity: _currentPage == slides.length - 1 ? 0.5 : 1.0,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _currentPage == slides.length - 1
                    ? null
                    : () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                label: const Text(
                  "Next",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                icon: const Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Slide 1: Certifications
  Widget _buildCertificationsSlide(
      double subHeadingFontSize, double bodyFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Certifications",
          style: TextStyle(
            fontSize: subHeadingFontSize,
            fontFamily: 'Aeonik',
            //  fontWeight: FontWeight.bold,
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
      ],
    );
  }

  // Slide 2: LeetCode Achievements
  Widget _buildLeetCodeSlide(double subHeadingFontSize, double bodyFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "LeetCode Achievements",
          style: TextStyle(
            fontSize: subHeadingFontSize,
            fontFamily: 'Aeonik',
            //fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '''• Solved 500+ problems across various difficulty levels.
• Consistently ranked in the top 10% in weekly contests.
• Earned the "Guardian" badge for solving daily challenges.
• Proficient in algorithms, data structures, and dynamic programming.''',
          style: TextStyle(
            fontSize: bodyFontSize,
            height: 1.6,
            fontFamily: 'Aeonik',
          ),
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
      ],
    );
  }

  // Slide 3: Other Achievements
  Widget _buildAchievementsSlide(
      double subHeadingFontSize, double bodyFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Other Achievements",
          style: TextStyle(
            fontSize: subHeadingFontSize,
            fontFamily: 'Aeonik',
            //fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '''• Winner of the 2024 University Hackathon for "Best Mobile App".
• Published a technical article on Medium with 10k+ views.
• Contributed to 3 open-source Flutter projects on GitHub.
• Speaker at the local Flutter developer meetup.''',
          style: TextStyle(
            fontSize: bodyFontSize,
            height: 1.6,
            fontFamily: 'Aeonik',
          ),
          softWrap: true,
          overflow: TextOverflow.visible,
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
        const Icon(
          FontAwesomeIcons.quoteLeft,
          size: 20,
          color: Colors.black26,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
