part of 'navigation.dart';

Route<dynamic>? routeGenerator(RouteSettings settings) {
  final route = Routes.fromPath(settings.name ?? '/');

  Widget page;
  switch (route) {
    case Routes.home:
      page = const Placeholder(); 
    case Routes.about:
      page = const Placeholder(); 
    case Routes.experience:
      page = const Placeholder(); 
    case Routes.projects:
      page = const Placeholder(); 
    case Routes.skills:
      page = const Placeholder(); 
    case Routes.contact:
      page = const Placeholder(); 
    case Routes.chat:
      page = const Placeholder(); 
    case Routes.contributions:
      page = const Placeholder(); 
    case Routes.talks:
      page = const Placeholder(); 
    case null:
      page = const Placeholder(); 
    default:
      page = const Placeholder(); 
  }

  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}
