import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/features/home/presenter/components/custom_app_bar.dart';
import 'package:bookify/src/features/home/presenter/components/recommended_books_section.dart';
import 'package:bookify/src/features/home/presenter/components/popular_books_section.dart';
import 'package:bookify/src/features/home/presenter/components/custom_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 1.sh,
              ),
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 28,
                  right: 28,
                  top: 100,
                  bottom: 120,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RecommendedBooksSection(),
                    SizedBox(height: 36),
                    PopularBooksSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
