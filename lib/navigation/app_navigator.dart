part of 'navigation.dart';

class AppNavigator {
  AppNavigator._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState? get _navigator => navigatorKey.currentState;

  static BuildContext? get context => navigatorKey.currentContext;

  static Routes? get currentRoute {
    String? currentPath;
    _navigator?.popUntil((route) {
      currentPath = route.settings.name;
      return true;
    });
    return currentPath != null ? Routes.fromPath(currentPath!) : null;
  }

  static void push(Routes route) => _navigator?.pushNamed(route.route);

  static void pushReplacement(Routes route) =>
      _navigator?.pushReplacementNamed(route.route);

  static void pushAndClearAll(Routes route) =>
      _navigator?.pushNamedAndRemoveUntil(route.route, (_) => false);

  static void pop() {
    if (canPop) _navigator?.pop();
  }

  static void popUntil(Routes route) =>
      _navigator?.popUntil((r) => r.settings.name == route.route);

  static void popToFirst() => _navigator?.popUntil((route) => route.isFirst);

  static bool get canPop => _navigator?.canPop() ?? false;

  static void goHome() => pushAndClearAll(Routes.home);
}