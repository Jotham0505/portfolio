/*import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    const double designWidth = 1280;
    final screenWidth = MediaQuery.of(context).size.width;
    final scale = screenWidth / designWidth;

    return SafeArea(
      child: Center(
        child: SizedBox(
          width: screenWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: screenWidth < 900 ? 50 : 100, // smaller on mobile
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 20),

                // Hide nav items on mobile
                if (screenWidth >= 900) ...[
                  _item("About Me"),
                  _item("Portfolio"),
                  _item("Services"),
                  _item("Blog"),
                  const Spacer(),
                  _bookCallButton(),
                ] else
                  const Spacer(),

                // Mobile Menu Icon
                if (screenWidth < 900)
                  IconButton(
                    icon: const Icon(Icons.menu, color: AppColors.secondary),
                    onPressed: () {},
                  ),
              ],
            ),
          ),
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

  Widget _bookCallButton() => TextButton(
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
            const Text(
              "Book a Call",
              style: TextStyle(
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
      );
}*/

import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 900;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 32, vertical: isMobile ? 8 : 14),
      child: Row(
        children: [
          Image.asset('assets/images/logo.png',
              height: isMobile ? 32 : 80, fit: BoxFit.contain),
          const SizedBox(width: 16),
          if (!isMobile) ...[
            _item("About Me"),
            _item("Portfolio"),
            _item("Services"),
            _item("Blog"),
            const Spacer(),
            _bookCallButton(),
          ] else ...[
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.menu, color: AppColors.secondary),
              onPressed: () {},
            ),
          ],
        ],
      ),
    );
  }

  Widget _item(String label) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(label,
            style: AppText.small.copyWith(color: AppColors.secondary)),
      );

  Widget _bookCallButton() => TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          foregroundColor: AppColors.primary,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "Book a Call",
              style: TextStyle(
                fontFamily: 'Aeonik',
                decoration: TextDecoration.underline,
                decorationThickness: 0.5,
                color: AppColors.secondary,
              ),
            ),
            SizedBox(width: 6),
            Icon(Icons.north_east, size: 16, color: AppColors.secondary),
          ],
        ),
      );
}
