import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/features/main/presenter/components/custom_app_bar.dart';
import 'package:bookify/src/features/bottombar/presenter/view/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const MainPage({
    super.key,
    required this.navigationShell,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  void _goBranch(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.white,
      appBar: widget.navigationShell.currentIndex == 4
          ? null
          : const CustomAppBar(),
      body: Stack(
        children: [
          Positioned(
            height: 1.sh,
            width: 1.sw,
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          widget.navigationShell,
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        index: selectedIndex,
        onTap: (int index) {
          _goBranch(index);
        },
      ),
    );
  }
}
