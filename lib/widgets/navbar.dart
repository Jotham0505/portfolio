import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Keeps alignment stable across devices with notches/status bars
      child: Container(
        color: AppColors.white,
        width: double.infinity, // Ensures full width
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 100, // Fixed height prevents scaling issues
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 20),
                _item("About Me"),
                _item("Portfolio"),
                _item("Services"),
                _item("Blog"),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      foregroundColor: AppColors.primary,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Book a Call",
                          style: const TextStyle(
                            fontFamily: 'Aeonik',
                            decoration: TextDecoration.underline,
                            decorationThickness: 0.5,
                            color: AppColors.secondary,
                          ),
                        ),
                        const Icon(
                          Icons.north_east,
                          size: 18,
                          color: AppColors.secondary,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment:
                    CrossAxisAlignment.start, //  Prevents shifting
                children: [
                  /*Column(
                    mainAxisSize: MainAxisSize
                        .min, //  Prevents stretching on tall screens
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          "Product designer",
                          style: AppText.small.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondary,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 1,
                        height: 300,
                        color: AppColors.secondary.withOpacity(0.6),
                      ),
                      const SizedBox(height: 20),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          "2025",
                          style: AppText.small.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondary,
                            letterSpacing: 1,
                          ),
                        ),
                      ),

                    ],
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(String label) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Text(
          label,
          style: AppText.small.copyWith(color: AppColors.secondary),
        ),
      );
}
