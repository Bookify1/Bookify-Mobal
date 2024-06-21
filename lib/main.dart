import 'package:bookify/src/core/router/router.dart';
import 'package:bookify/src/core/styles/theme/theme.dart';
import 'package:bookify/src/features/auth/data/auth_repository.dart';
import 'package:bookify/src/features/auth/signup/presenter/state/auth_signup_state.dart';
import 'package:bookify/src/features/auth/signin/presenter/state/auth_sigin_state.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthSignupState(AuthRepository(FirebaseAuth.instance)),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthSiginState(AuthRepository(FirebaseAuth.instance)),
        ),
      ],
      child: DevicePreview(
        builder: (context) {
          return const MyApp();
        },
        enabled: false,
      ),
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
      child: MaterialApp.router(
        title: 'Bookify',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: AppNavigation.router,
      ),
    );
  }
}
