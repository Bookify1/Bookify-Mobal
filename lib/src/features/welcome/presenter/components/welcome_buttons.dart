import 'package:bookify/src/core/router/app_rout_enum.dart';
import 'package:bookify/src/core/styles/app_colors.dart';
import 'package:bookify/src/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomeButtons extends StatelessWidget {
  const WelcomeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            AppRouteEnum currentPath = AppRouteEnum.signin;
            String routePath = currentPath.name;
            context.push(routePath);
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColors.yellow,
            minimumSize: Size(.9.sw, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            "Entrar",
            style: AppTextStyle.largeWhite.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            AppRouteEnum currentPath = AppRouteEnum.signup;
            String routePath = currentPath.name;
            context.push(routePath);
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColors.transparent,
            minimumSize: Size(.9.sw, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(
                color: AppColors.black,
                width: 2,
              ),
            ),
          ),
          child: Text(
            "Criar Conta",
            style: AppTextStyle.largeBlack.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
