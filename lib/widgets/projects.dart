import 'package:flutter/material.dart';

class ProjectAccordion extends StatefulWidget {
  const ProjectAccordion({super.key});

  @override
  State<ProjectAccordion> createState() => _ProjectAccordionState();
}

class _ProjectAccordionState extends State<ProjectAccordion> {
  int? expandedIndex;

  final projects = [
    {
      "title": " Tea Factory Outlet Inventory App",
      "details": "Details about branding projects here.",
      "image": "assets/images/logo.png"
    },
    {
      "title": "Perplex- Flutter RAG App with FastAPI & Google Gemini",
      "details": "Details about web design projects here.",
      "image": "assets/images/logo.png"
    },
    {
      "title": "Insigno- Inclusive Learning App",
      "details":
          """Developed a learning application for Gujarati, Mathematics, and Science with integrated Indian Sign Language interpretation for accessibility.

Implemented text-to-sign, speech-to-sign, and sign-to-text/speech conversion tools, enabling seamless communication.

Designed interactive exercises, quizzes, and progress tracking dashboards for students, teachers, and parents.

Created and structured 10+ curriculum-aligned learning modules with visual aids and sign-based explanations.

Focused on inclusive education by combining AI-driven sign language translation with engaging e-learning methods.""",
      "image": "assets/images/logo.png"
    },
    {
      "title": "FinBase",
      "details": "Details about creative direction projects here.",
      "image": "assets/images/logo.png"
    },
    {
      "title": "MEME 3D DESIGN",
      "details": "Details about meme 3D design projects here.",
      "image": "assets/images/logo.png"
    },
    {
      "title": "DIGITAL DEVELOPMENT",
      "details": "Details about digital development projects here.",
      "image": "assets/images/logo.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // background
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "Take Complete charge of your Projects",
              style: TextStyle(
                fontSize: 64,
                color: Colors.white,
                fontFamily: 'Aeonik',
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Column(
            children: List.generate(projects.length, (index) {
              final project = projects[index];
              final isExpanded = expandedIndex == index;

              return Column(
                children: [
                  ListTile(
                    title: Text(
                      project["title"]!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    trailing: AnimatedRotation(
                      duration: const Duration(milliseconds: 300),
                      turns: isExpanded ? 0.25 : 0,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.white70,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        expandedIndex = isExpanded ? null : index;
                      });
                    },
                  ),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 300),
                    crossFadeState: isExpanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project["details"]!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              project["image"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    secondChild: const SizedBox.shrink(),
                  ),
                  const Divider(color: Colors.white24, thickness: 0.5),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
