import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndicatorWidget extends StatelessWidget {
  final int activeIndex;
  final List<String> urlImages;
  final CarouselController controller;
  final BuildContext context;

  const IndicatorWidget({
    super.key,
    required this.activeIndex,
    required this.urlImages,
    required this.controller,
    required this.context,
  });

  void animateToSlide(int index) => controller.animateToPage(index);

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      onDotClicked: animateToSlide,
      effect: const ExpandingDotsEffect(
        dotWidth: 15,
        dotHeight: 2,
        activeDotColor: AppColors.yellow,
      ),
      activeIndex: activeIndex,
      count: urlImages.length,
    );
  }
}
