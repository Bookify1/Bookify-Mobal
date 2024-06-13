enum AppRouteEnum { intro, welcome, signin, signup, home, favorites, bookLoans }

extension AppRouteExtension on AppRouteEnum {
  String get name {
    switch (this) {
      case AppRouteEnum.intro:
        return "/intro";
      case AppRouteEnum.welcome:
        return "/welcome";
      case AppRouteEnum.signin:
        return "/signin";
      case AppRouteEnum.signup:
        return "/signup";
      case AppRouteEnum.home:
        return "/home";
      case AppRouteEnum.favorites:
        return "/favorites";
      case AppRouteEnum.bookLoans:
        return "/bookloans";
      default:
        return "/";
    }
  }
}
