part of 'navigation.dart';

Route<dynamic>? routeGenerator(RouteSettings settings) {
  final route = Routes.fromPath(settings.name ?? '/');

  Widget? page;
  
  switch (route) {
    case Routes.home:
      page = const HomePage();
      break;
    case Routes.about:
      page = const AboutPage();
      break;
    case Routes.experience:
      page = const ExperiencePage();
      break;
    case Routes.projects:
      page = const ProjectPage();
      break;
    case Routes.skills:
      page = const SkillPage();
      break;
    case Routes.contact:
      page = const ContactPage();
      break;
    case Routes.chat:
      page = const ChatPage();
      break;
    case Routes.contributions:
      Utils.safelyLaunchUrl(Links.contributions.url, AppNavigator.context);
      break;
    case Routes.resume:
      Utils.safelyLaunchUrl(Links.resume.url, AppNavigator.context);
      break;
    case Routes.blog:
      Utils.safelyLaunchUrl(Links.medium.url, AppNavigator.context);
      break;
    case Routes.talks:
      Utils.safelyLaunchUrl(Links.talks.url, AppNavigator.context);
      break;
    default:
      page = HomePage();
  }

  if (page == null) return null;

  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, __, ___) => page!,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}
