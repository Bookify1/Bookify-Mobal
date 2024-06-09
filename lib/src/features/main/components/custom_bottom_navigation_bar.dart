import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/features/main/components/build_bottom_navigatorbar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int index;
  final Function(int) onTap;
  const CustomBottomNavigationBar(
      {super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 28,
        right: 28,
        bottom: 32,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.boxShadow.withOpacity(0.1),
              offset: const Offset(0, 4),
              blurRadius: 32,
              spreadRadius: 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(22)),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: index,
              onTap: onTap,
              fixedColor: AppColors.white,
              backgroundColor: AppColors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              enableFeedback: false,
              type: BottomNavigationBarType.fixed,
              items: [
                buildBottomNavigationBarItem(Icons.home_outlined, 'Home', 28),
                buildBottomNavigationBarItem(
                    Icons.bookmark_outline_rounded, 'Bookmarks', 28),
                buildBottomNavigationBarItem(Icons.calendar_today_outlined,
                    'Calendar', AppFontSize.xxxLarge),
                buildBottomNavigationBarItem(
                    Icons.shopping_cart_outlined, 'Cart', AppFontSize.xxxLarge),
                buildBottomNavigationBarItem(
                    Icons.settings_outlined, 'Settings', AppFontSize.xxxLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
