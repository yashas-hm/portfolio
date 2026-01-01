import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/constants.dart' show KnownColors;
import 'package:portfolio/model/narrative.dart';

class Narratives {
  Narratives._();

  static final List<Narrative> all = [frontend, backend, devops, leadership];

  static final frontend = Narrative(
    icon: FontAwesomeIcons.mobileButton,
    baseIcon: FontAwesomeIcons.windowRestore,
    color: KnownColors.cyan500,
    headline: 'User-Centric Engineering',
    description:
        'I build applications that feel as good as they look. Using **Flutter** and **Dart**, '
        'I combine architectural discipline with a focus on micro-interactions and '
        'accessibility, ensuring that complex functionality never compromises the user experience.',
  );

  static final backend = Narrative(
    icon: FontAwesomeIcons.brain,
    baseIcon: FontAwesomeIcons.microchip,
    color: KnownColors.purple500,
    headline: 'Intelligent Architecture',
    description:
        'My backend philosophy is simple: use the best tool for the job. '
        'I architect high-concurrency services using **Node.js**, while leveraging '
        '**Python** and **FastAPI** to power complex AI pipelines. I build systems that '
        'are not just fast, but intelligent.',
  );

  static final devops = Narrative(
    icon: FontAwesomeIcons.database,
    baseIcon: FontAwesomeIcons.hexagonNodes,
    color: KnownColors.green500,
    headline: 'Scalable Infrastructure',
    description:
        'Great software needs a solid foundation. From vector search in **ChromaDB** to '
        'relational structures in **PostgreSQL**, I design data ecosystems that scale. '
        'I use **Docker** and **GitHub Actions** to ensure that deployment is boring, predictable, and fast.',
  );

  static final leadership = Narrative(
    icon: FontAwesomeIcons.solidUser,
    baseIcon: FontAwesomeIcons.fingerprint,
    color: KnownColors.amber500,
    headline: 'Leadership & Synergy',
    description:
        'Engineering is an art form. My background in music and stage performance '
        'shapes how I build software with structure, rhythm, and the audience in mind. '
        'It fuels my ability to perform under pressure and communicate complex '
        'technical ideas with clarity and confidence.',
  );
}
