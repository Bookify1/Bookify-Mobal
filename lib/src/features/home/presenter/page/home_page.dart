import 'package:bookify/src/core/components/text_app.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_font_size.dart';
import 'package:bookify/src/features/home/presenter/components/build_bottom_navigatorbar_item.dart';
import 'package:bookify/src/features/home/presenter/components/popular_books_widget.dart';
import 'package:bookify/src/features/home/presenter/components/recommended_book_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        toolbarHeight: 60,
        leadingWidth: double.maxFinite,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/logo.jpeg'),
                      fit: BoxFit.cover),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
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
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 28,
                  right: 28,
                  top: 100,
                  bottom: 120,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextApp(
                      label: 'Livros Recomendados',
                      color: AppColors.black,
                      fontSize: AppFontSize.xxxLarge,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          RecommendedBookWidget(
                            title: 'Fashionopolis',
                            author: 'Dana Thomas',
                            imageUrl: 'assets/images/mock.jpg',
                          ),
                          SizedBox(width: 24),
                          RecommendedBookWidget(
                            title: 'Chanel',
                            author: 'Patrick Mauriès',
                            imageUrl: 'assets/images/mock.jpg',
                          ),
                          SizedBox(width: 24),
                          RecommendedBookWidget(
                            title: 'Calligraphy',
                            author: 'June & Lucy',
                            imageUrl: 'assets/images/mock.jpg',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),
                    // Popular Books
                    const TextApp(
                      label: 'Livros Populares',
                      color: AppColors.black,
                      fontSize: AppFontSize.xxxLarge,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 32),
                    const PopularBookWidget(
                      title: 'Yves Saint Laurent',
                      author: 'Suzy Menkes',
                      rating: 4,
                      imageUrl: 'assets/images/mock.jpg',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 28,
          right: 28,
          bottom: 32,
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
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
      ),
    );
  }
}
