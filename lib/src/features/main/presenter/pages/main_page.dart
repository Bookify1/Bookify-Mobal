import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/features/favorites/presenter/page/favorites_page.dart';
import 'package:bookify/src/features/home/presenter/page/home_page.dart';
import 'package:bookify/src/features/main/presenter/components/custom_app_bar.dart';
import 'package:bookify/src/features/main/presenter/components/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final screens = [
    const HomePage(),
    const FavoritesPage(),
    const Center(child: Text('Search2')),
    const Center(child: Text('Search3')),
    const Center(child: Text('Search3')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(),
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
          screens[index],
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        index: index,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
        },
      ),
    );
  }
}
