enum AppRouteEnum { intro, welcome, signin, signup }

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
      default:
        return "/";
    }
  }
}
