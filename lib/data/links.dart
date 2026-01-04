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
    url: 'https://yashashm.medium.com',
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

  static const resume = (
    url:
        'https://drive.google.com/file/d/1cpK9Edd920Gr-qjD_BAAX5oO1CY_VDXQ/view?usp=sharing',
    urlText: 'Resume',
    icon: FontAwesomeIcons.arrowUpRightFromSquare,
  );

  static const contributions = (
    url: 'https://github.com/yashas-hm/yashas-hm/blob/main/contributions.md',
    urlText: 'Contributions',
    icon: FontAwesomeIcons.codeFork,
  );

  static const talks = (
    url: 'https://github.com/yashas-hm/talks',
    urlText: 'Tech Talks',
    icon: FontAwesomeIcons.microphoneLines,
  );
}
