import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.6.sh,
      color: AppColors.yellow,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: SvgPicture.asset(
          'assets/svgs/launching.svg',
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          semanticsLabel: 'Launching app',
        ),
      ),
    );
  }
}
