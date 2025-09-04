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
          padding: const EdgeInsets.symmetric(
            horizontal: 48.0,
          ),
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
              const SizedBox(height: 40),
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
                  SizedBox(width: 8),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black, // background color
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_rounded,
                          color: Colors.white),
                    ),
                  )
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
              const SizedBox(height: 50),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "+91 9663466229",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontFamily: 'Aeonik',
                          ),
                        ),
                        Text(
                          "jothamemmanuelcheeran@gmail.com",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Aeonik',
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.copyright,
                                size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              "2025 Jotham's Portfolio",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontFamily: 'Aeonik',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 160),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "LinkedIn",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 48,
                              color: Colors.white,
                              fontFamily: 'Aeonik',
                              decorationColor: Colors.white,
                            ),
                          ),
                          Icon(Icons.north_east, size: 32, color: Colors.white)
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Instagram",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 48,
                              color: Colors.white,
                              fontFamily: 'Aeonik',
                              decorationColor: Colors.white,
                            ),
                          ),
                          Icon(Icons.north_east, size: 32, color: Colors.white)
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Github",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 48,
                              color: Colors.white,
                              fontFamily: 'Aeonik',
                              decorationColor: Colors.white,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white, // background color
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.north_east,
                                color: Colors.black,
                                size: 32,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                  const SizedBox(width: 320),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontFamily: 'Aeonik',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Banagalore, India",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[400],
                              fontFamily: 'Aeonik',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Interests",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontFamily: 'Aeonik',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "AI · App Dev · API",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[400],
                              fontFamily: 'Aeonik',
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Divider(
                color: Colors.grey[800],
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Built with Flutter · Bangalore, India",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 12,
                      fontFamily: 'Aeonik',
                    ),
                  ),
                  Text(
                    "Always learning, always building",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 12,
                      fontFamily: 'Aeonik',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
