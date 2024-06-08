import 'package:flutter/material.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/features/home/presenter/components/build_bottom_navigatorbar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

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
              fixedColor: AppColors.white,
              backgroundColor: AppColors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              enableFeedback: false,
              items: [
                buildBottomNavigationBarItem(Icons.home, 'Home'),
                buildBottomNavigationBarItem(Icons.bookmark, 'Bookmarks'),
                buildBottomNavigationBarItem(Icons.shopping_cart, 'Cart'),
                buildBottomNavigationBarItem(Icons.settings, 'Settings'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
