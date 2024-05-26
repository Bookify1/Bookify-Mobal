import 'package:bookify/src/core/styles/theme/custom/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    //appBarTheme: LAppBarTheme.lightAppBarTheme,
    //colorScheme: LColorSchemeTheme.lightColorScheme,
    textTheme: AppTextTheme.whiteTheme,
    // inputDecorationTheme: LTextFieldTheme.lightTextFieldTheme,
    // elevatedButtonTheme: LElevatedButtonTheme.lightElevatedButtonTheme,
    // outlinedButtonTheme: LOutlinedTheme.lightOutlinedButtonTheme,
    // dividerTheme: LDividerTheme.lightDivider,
    // bottomSheetTheme: LBottomSheetTheme.lightBottomSheetTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    // appBarTheme: LAppBarTheme.darkAppBarTheme,
    // colorScheme: LColorSchemeTheme.darkColorScheme,
    textTheme: AppTextTheme.blackTheme,
    // inputDecorationTheme: LTextFieldTheme.darkTextFieldTheme,
    // elevatedButtonTheme: LElevatedButtonTheme.darkElevatedButtonTheme,
    // outlinedButtonTheme: LOutlinedTheme.darkOutlinedButtonTheme,
    // dividerTheme: LDividerTheme.darkDivider,
    // bottomSheetTheme: LBottomSheetTheme.darkBottomSheetTheme,
  );
}
