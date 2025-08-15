import 'package:flutter/material.dart';
import 'package:portfolio/widgets/aboutSection.dart';
import 'package:portfolio/widgets/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _navController;
  late AnimationController _aboutController;

  late Animation<Offset> _navSlide;
  late Animation<Offset> _aboutSlide;

  @override
  void initState() {
    super.initState();

    // Navbar Animation
    _navController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _navSlide = Tween<Offset>(
      begin: const Offset(0, -0.3), // slightly up
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _navController,
      curve: Curves.easeOut,
    ));

    // About Section Animation
    _aboutController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _aboutSlide = Tween<Offset>(
      begin: const Offset(0, 0.2), // slightly down
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _aboutController,
      curve: Curves.easeOut,
    ));

    // Start animations with delay
    _navController.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 200), () {
        _aboutController.forward();
      });
    });
  }

  @override
  void dispose() {
    _navController.dispose();
    _aboutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _navController,
              child: SlideTransition(
                position: _navSlide,
                child: const Navbar(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _aboutController,
              child: SlideTransition(
                position: _aboutSlide,
                child: const AboutSection(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
