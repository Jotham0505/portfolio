import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        "image": "assets/images/profile.png",
        "title": "MythosMark",
        "date": "Jan 2023 - Present",
      },
      {
        "image": "assets/images/profile.png",
        "title": "[ROCKART]",
        "date": "Jan 2023 - Present",
      },
      {
        "image": "assets/images/profile.png",
        "title": "EchoMotion",
        "date": "Jan 2023 - Present",
      },
      {
        "image": "assets/images/profile.png",
        "title": "Project X",
        "date": "Jan 2023 - Present",
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          Text(
            "Drive your project toward excellence with clarity.",
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 40),

          // First Row (2 projects)
          Row(
            children: [
              Expanded(
                child: _buildProjectCard(
                  image: projects[0]["image"]!,
                  title: projects[0]["title"]!,
                  date: projects[0]["date"]!,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildProjectCard(
                  image: projects[1]["image"]!,
                  title: projects[1]["title"]!,
                  date: projects[1]["date"]!,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Second Row (2 projects)
          Row(
            children: [
              Expanded(
                child: _buildProjectCard(
                  image: projects[2]["image"]!,
                  title: projects[2]["title"]!,
                  date: projects[2]["date"]!,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildProjectCard(
                  image: projects[3]["image"]!,
                  title: projects[3]["title"]!,
                  date: projects[3]["date"]!,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard({
    required String image,
    required String title,
    required String date,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[100],
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: 180, // fixed height so cards are equal
              width: double.infinity,
            ),
          ),
          // Title & Date
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
