import 'package:bookify/src/core/router/router.dart';
import 'package:bookify/src/core/styles/theme/theme.dart';
import 'package:bookify/src/features/intro/presenter/pages/intro_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      builder: (context) {
        return const MyApp();
      },
      enabled: false,
    ),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Bookify',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
