import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/portfolioHome.dart';
import 'package:portfolio/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jotham — Product Designer",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      home: const PortfolioHome(),
    );
  }
}
