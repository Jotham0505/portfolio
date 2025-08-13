import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 800;

          return Container(
            color: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top row with logo + hamburger menu
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            height: 70,
                            fit: BoxFit.contain,
                          ),
                          IconButton(
                            icon: const Icon(Icons.menu,
                                color: AppColors.secondary),
                            onPressed: () {
                              // TODO: Implement mobile menu
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Nav items stacked vertically
                      Wrap(
                        spacing: 20,
                        runSpacing: 10,
                        children: [
                          _item("About Me"),
                          _item("Portfolio"),
                          _item("Services"),
                          _item("Blog"),
                          _bookCallButton(),
                        ],
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 20),
                      _item("About Me"),
                      _item("Portfolio"),
                      _item("Services"),
                      _item("Blog"),
                      const Spacer(),
                      _bookCallButton(),
                    ],
                  ),
          );
        },
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
      );
}
