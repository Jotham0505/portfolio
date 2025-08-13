import 'package:flutter/material.dart';
import 'package:portfolio/widgets/aboutSection.dart';
import 'package:portfolio/widgets/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Navbar(),
          ),
          SliverToBoxAdapter(
            child: AboutSection(), // ✅ About text + profile image
          ),
        ],
      ),
    );
  }
}
