part of 'navigation.dart';

enum Routes {
  home('Home', '/'),
  about('About', '/about'),
  experience('Experience', '/experience'),
  projects('Projects', '/projects'),
  skills('Skills', '/skills'),
  contact('Contact', '/contact'),
  chat(
    'AskYashas',
    '/chat',
    icon: FontAwesomeIcons.robot,
  ),
  resume(
    'Resume',
    '/resume',
    icon: FontAwesomeIcons.arrowUpRightFromSquare,
  ),
  contributions(
    'Contributions',
    '/contributions',
    icon: FontAwesomeIcons.codeFork,
  ),
  talks(
    'Tech Talks',
    '/talks',
    icon: FontAwesomeIcons.microphoneLines,
  ),
  blog(
    'Tech Blog',
    '/blog',
    icon: FontAwesomeIcons.medium,
  );

  final String name;
  final String route;
  final IconData? icon;

  const Routes(this.name, this.route, {this.icon});

  static Routes? fromPath(String path) {
    for (final route in Routes.values) {
      if (route.route == path) return route;
    }
    return null;
  }

  static Routes? fromName(String name) {
    for (final route in Routes.values) {
      if (route.name.toLowerCase() == name.toLowerCase()) return route;
    }
    return null;
  }

  static List<Routes> get mainRoutes => [
        Routes.home,
        Routes.about,
        Routes.experience,
        Routes.projects,
        Routes.skills,
        Routes.contact,
      ];

  static List<Routes> get secondaryRoutes => [
        Routes.chat,
        Routes.resume,
        Routes.contributions,
        Routes.talks,
        Routes.blog,
      ];

  bool get isExternal =>
      this == Routes.resume ||
      this == Routes.blog ||
      this == Routes.talks ||
      this == Routes.contributions;
}
