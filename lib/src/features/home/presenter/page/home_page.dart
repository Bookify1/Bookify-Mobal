import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookify/src/features/home/presenter/components/recommended_books_section.dart';
import 'package:bookify/src/features/home/presenter/components/popular_books_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 1.sh,
          minWidth: 1.sw,
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
    );
  }
}
