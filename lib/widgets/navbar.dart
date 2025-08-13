import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 40,
      ),
      color: AppColors.white,
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),
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
                  Container(
                    width: 1,
                    height: 250,
                    color: AppColors.secondary,
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
              ),
              _item("About Me"),
              _item("Portfolio"),
              _item("Services"),
              _item("Blog"),
            ],
          ),

          // Right side "Book a Call" button
          TextButton(
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
        ],
      ),
    );
  }

  Widget _item(String label) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Text(
          label,
          style: AppText.small.copyWith(color: AppColors.primary),
        ),
      );
}
