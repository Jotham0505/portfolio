import 'package:flutter/material.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Every project tells a unique story,\n"
                "thoughtfully designed to blend seamlessly with its surroundings.\n"
                "Are you ready to craft some magic?",
                style: TextStyle(
                  fontSize: isMobile ? 18 : 48,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Aeonik',
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 1,
                color: Colors.black,
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Text(
                    "GET IN TOUCH",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Aeonik',
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_rounded,
                          color: Colors.black))
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Container(
          width: double.infinity,
          color: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  debugPrint("Contact button pressed");
                },
                icon: const Icon(Icons.arrow_forward, color: Colors.black),
                label: const Text(
                  "GET IN TOUCH",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Aeonik',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // Footer
              Column(
                children: [
                  Text(
                    "hello@Noiré.com",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontFamily: 'Aeonik',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 20,
                    alignment: WrapAlignment.center,
                    children: const [
                      _SocialLink(label: "Twitter"),
                      _SocialLink(label: "Instagram"),
                      _SocialLink(label: "Dribbble"),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "© 2025 Noiré Portfolio",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[400],
                      fontFamily: 'Aeonik',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _SocialLink extends StatelessWidget {
  final String label;
  const _SocialLink({required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint("$label tapped");
      },
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'Aeonik',
          color: Colors.white,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
