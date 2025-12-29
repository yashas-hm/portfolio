import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/model/project.dart' show Link;

class Links {
  Links._();

  static const Link linkedin = (
    url: 'https://linkedin.com/in/yashashm',
    urlText: 'LinkedIn',
    icon: FontAwesomeIcons.squareLinkedin,
  );

  static const github = (
    url: 'https://github.com/yashas-hm',
    urlText: 'GitHub',
    icon: FontAwesomeIcons.squareGithub,
  );

  static const medium = (
    url: 'https://medium.com/@yashashm',
    urlText: 'Medium',
    icon: FontAwesomeIcons.medium,
  );

  static const email = (
    url: 'mailto:yashashm.dev@gmail.com',
    urlText: 'Email\nyashashm.dev@gmail.com',
    icon: FontAwesomeIcons.at,
  );

  static const location = (
    url: '',
    urlText: 'Base\nUnited States',
    icon: FontAwesomeIcons.locationDot,
  );
}
