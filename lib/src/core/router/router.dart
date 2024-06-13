import 'package:bookify/src/features/bookLoans/presenter/pages/book_loans_page.dart';
import 'package:bookify/src/features/favorites/presenter/page/favorites_page.dart';
import 'package:bookify/src/features/home/presenter/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bookify/src/features/intro/presenter/pages/intro_page.dart';
import 'package:bookify/src/features/main/presenter/pages/main_wrapper_page.dart';
import 'package:bookify/src/features/signin/presenter/pages/signin_page.dart';
import 'package:bookify/src/features/signup/presenter/pages/signup_page.dart';
import 'package:bookify/src/features/welcome/presenter/pages/welcome_page.dart';

class AppNavigation {
  AppNavigation._();

  static String initial = "/intro";

  // Private navigator
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  // Private navigator home Page
  static final _rootNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  // Private favorites Page
  static final _rootNavigatorFavorite =
      GlobalKey<NavigatorState>(debugLabel: 'shellFavorites');
  static final _rootNavigatorBookLoans =
      GlobalKey<NavigatorState>(debugLabel: 'shellBookLoans');

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      /// Intro Page
      GoRoute(
        path: "/intro",
        name: "Intro",
        builder: (BuildContext context, GoRouterState state) =>
            const IntroPage(),
      ),

      /// Welcome Page
      GoRoute(
        path: "/welcome",
        name: "Welcome",
        builder: (BuildContext context, GoRouterState state) =>
            const WelcomePage(),
      ),

      /// Signin Page
      GoRoute(
        path: "/signin",
        name: "Signin",
        builder: (BuildContext context, GoRouterState state) =>
            const SignInPage(),
      ),

      /// Signup Page
      GoRoute(
        path: "/signup",
        name: "Signup",
        builder: (BuildContext context, GoRouterState state) =>
            const SignUpPage(),
      ),

      /// Main Page (with bottom navigation)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainPage(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _rootNavigatorHome,
            routes: [
              GoRoute(
                path: "/home",
                name: "Home",
                builder: (BuildContext context, GoRouterState state) =>
                    const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorFavorite,
            routes: [
              GoRoute(
                path: "/favorites",
                name: "Favorites",
                builder: (BuildContext context, GoRouterState state) =>
                    const FavoritesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorBookLoans,
            routes: [
              GoRoute(
                path: "/bookloans",
                name: "BookLoans",
                builder: (BuildContext context, GoRouterState state) =>
                    const BookLoansPage(),
              ),
            ],
          )
        ],
      ),

      /// Catch-all route for undefined paths
      GoRoute(
        path: "/not-found",
        builder: (BuildContext context, GoRouterState state) => Scaffold(
          body: Center(
            child: Text('No route defined for ${state.path}'),
          ),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text('Page not found: ${state.path}'),
        ),
      ),
    ),
  );
}
