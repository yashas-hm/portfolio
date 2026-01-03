import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/data/skills.dart';
import 'package:portfolio/model/project.dart';

class Projects {
  Projects._();

  static final angioNet = Project(
    name: 'AngioNET',
    imageUrl: 'https://yashashm.sirv.com/portfolio/angionet.png',
    description:
        'One-click, reproducible U‑Net pipeline for retinal vessel segmentation, achieving Dice ~0.86, accuracy ~98%, sensitivity ~91%, and specificity ~99% on clinical angiographic images.',
    tag: ProjectTag.aiMl,
    skills: [Skills.git, Skills.python],
    links: [
      (
        url: 'https://github.com/yashas-hm/AngioNet',
        urlText: 'Code',
        icon: FontAwesomeIcons.code,
      ),
    ],
    endDate: DateTime(2025, 11),
  );

  static final askYashas = Project(
    name: 'AskYashas',
    imageUrl: 'https://yashashm.sirv.com/portfolio/askyashas.png',
    description:
        'A serverless RAG chatbot using FastAPI, LangChain, and vector search to deliver intelligent, context‑aware answers from custom data.',
    tag: ProjectTag.aiMl,
    skills: [
      Skills.python,
      Skills.langchain,
      Skills.llms,
      Skills.githubActions,
    ],
    links: [
      (
        url: 'https://github.com/yashas-hm/AskYashas',
        urlText: 'Code',
        icon: FontAwesomeIcons.code,
      ),
      (
        url: 'https://yashashm.dev/chat',
        urlText: 'Demo',
        icon: FontAwesomeIcons.upRightFromSquare,
      ),
    ],
    endDate: DateTime(2025, 4),
  );

  static final glowBottomAppBar = Project(
    name: 'Glow Bottom App Bar',
    imageUrl: 'https://yashashm.sirv.com/portfolio/glowAppBar.gif',
    description:
        'A customizable Flutter bottom navigation bar with a smooth glowing transition effect and customizable appearance for modern UI navigation.',
    tag: ProjectTag.package,
    skills: [Skills.flutter],
    links: [
      (
        url: 'https://github.com/yashas-hm/glow_bottom_app_bar',
        urlText: 'Code',
        icon: FontAwesomeIcons.code,
      ),
      (
        url: 'https://pub.dev/packages/glow_bottom_app_bar',
        urlText: 'Pub.dev',
        icon: FontAwesomeIcons.cube,
      ),
    ],
    endDate: DateTime(2024, 11),
  );

  static final countryCallingCodeKit = Project(
    name: 'Country Calling Code Kit',
    imageUrl: 'https://yashashm.sirv.com/portfolio/countrycallkit.png',
    description:
        'A sleek, cross‑platform Flutter package for picking country flags, names, and international dialing codes with a customizable UI and smart default detection.',
    tag: ProjectTag.package,
    skills: [Skills.flutter],
    links: [
      (
        url: 'https://github.com/yashas-hm/country-calling-code-kit',
        urlText: 'Code',
        icon: FontAwesomeIcons.code,
      ),
      (
        url: 'https://pub.dev/packages/country_calling_code_kit',
        urlText: 'Pub.dev',
        icon: FontAwesomeIcons.cube,
      ),
    ],
    endDate: DateTime(2025, 6),
  );

  static final dayNightSwitcher = Project(
    name: 'Day Night Switcher',
    imageUrl: 'https://yashashm.sirv.com/portfolio/dayNightSwitcher.gif',
    description:
        'A responsive Flutter theme switcher widget with fluid day/night animations, adaptive color syncing, and easy integration across apps.',
    tag: ProjectTag.package,
    skills: [Skills.flutter],
    links: [
      (
        url: 'https://github.com/yashas-hm/day-night-themed-switcher',
        urlText: 'Code',
        icon: FontAwesomeIcons.code,
      ),
      (
        url: 'https://pub.dev/packages/day_night_themed_switcher',
        urlText: 'Pub.dev',
        icon: FontAwesomeIcons.cube,
      ),
    ],
    endDate: DateTime(2025, 5),
  );

  static final lavaLampEffect = Project(
    name: 'Lava Lamp Effect',
    imageUrl: 'https://yashashm.sirv.com/portfolio/lava_lamp_effect.gif',
    description:
        'A visually engaging Flutter animation package delivering fluid, customizable lava‑lamp motion effects for modern UIs.',
    tag: ProjectTag.package,
    skills: [Skills.flutter],
    links: [
      (
        url: 'https://github.com/yashas-hm/lava-lamp-effect',
        urlText: 'Code',
        icon: FontAwesomeIcons.code,
      ),
      (
        url: 'https://pub.dev/packages/lava_lamp_effect',
        urlText: 'Pub.dev',
        icon: FontAwesomeIcons.cube,
      ),
    ],
    endDate: DateTime(2025, 5),
  );

  static final directMessage = Project(
    name: 'Direct Message',
    imageUrl: 'https://yashashm.sirv.com/portfolio/directMessage.png',
    description:
        'A Flutter utility app that cuts out contact saving and enables one‑tap WhatsApp messaging, boosting messaging efficiency with a sleek minimalist design.',
    tag: ProjectTag.production,
    skills: [Skills.flutter],
    links: [
      (
        url: 'https://github.com/yashas-hm/direct-message',
        urlText: 'Code',
        icon: FontAwesomeIcons.code,
      ),
      (
        url: 'https://directmessage.yashashm.dev',
        urlText: 'Demo',
        icon: FontAwesomeIcons.upRightFromSquare,
      ),
    ],
    endDate: DateTime(2024, 3),
  );

  static final henchman = Project(
    name: 'Henchman',
    imageUrl: 'https://yashashm.sirv.com/portfolio/henchman.png',
    description:
        'CLI developer tool automating project scaffolding, Git tasks, and environment management to boost productivity.',
    tag: ProjectTag.production,
    skills: [Skills.javascript, Skills.bash],
    links: [
      (
        url: 'https://github.com/yashas-hm/henchman',
        urlText: 'Code',
        icon: FontAwesomeIcons.code,
      ),
      (
        url: 'https://www.npmjs.com/package/henchman-cli',
        urlText: 'NPM',
        icon: FontAwesomeIcons.cube,
      ),
    ],
    endDate: DateTime(2024, 8),
  );

  static final echoFrame = Project(
    name: 'Echo Frame',
    imageUrl: 'https://yashashm.sirv.com/portfolio/echoframe.png',
    description:
        'Offline photo organizer with editing capabilities, improving personal media management efficiency by 70%.',
    tag: ProjectTag.inProgress,
    skills: [Skills.flutter, Skills.tensorflow, Skills.opencv],
    links: [
      (
        url: 'https://github.com/yashas-hm/echo-frame',
        urlText: 'Code',
        icon: FontAwesomeIcons.code
      ),
    ],
    endDate: null,
  );

  static final arduinoMidiDrums = Project(
    name: 'Arduino MIDI Drums',
    imageUrl: 'https://yashashm.sirv.com/portfolio/drums.png',
    description:
        'Electronic drum kit with Arduino and MIDI, achieving sub-10ms response latency for real-time performance.',
    tag: ProjectTag.project,
    skills: [Skills.arduino, Skills.cpp],
    links: [
      (
        url: 'https://github.com/yashas-hm/Arduino-MIDI-Drums',
        urlText: 'Code',
        icon: FontAwesomeIcons.code
      ),
    ],
    endDate: DateTime(2018, 6),
  );

  static final pratvi = Project(
    name: 'PRATVI',
    imageUrl: 'https://yashashm.sirv.com/portfolio/pratvi.png',
    description:
        'A Flutter app for wedding logistics management, streamlining planning and guest coordination for 100+ users.',
    tag: ProjectTag.production,
    skills: [Skills.flutter, Skills.firebase, Skills.gcp],
    links: [
      (
        url: 'https://github.com/yashas-hm/PRATVI',
        urlText: 'Code',
        icon: FontAwesomeIcons.code,
      ),
    ],
    endDate: DateTime(2024, 1),
  );

  static final aslGestureSensing = Project(
    name: 'ASL Gesture Sensing',
    imageUrl: 'https://yashashm.sirv.com/portfolio/asl.gif',
    description:
        'ML model to translate ASL hand gestures to text with 90% accuracy using real-time video feed.',
    tag: ProjectTag.aiMl,
    skills: [Skills.python, Skills.mediapipe, Skills.opencv],
    links: [
      (
        url: 'https://github.com/yashas-hm/ASL-Gesture-Sensing',
        urlText: 'Code',
        icon: FontAwesomeIcons.code,
      ),
    ],
    endDate: DateTime(2023, 8),
  );

  static final smartGlass = Project(
    name: 'Smart Glass',
    imageUrl: 'https://yashashm.sirv.com/portfolio/smartglass.jpg',
    description:
        'Affordable smart glass device with IoT capabilities, supporting remote notifications for accessibility.',
    tag: ProjectTag.project,
    skills: [Skills.cpp, Skills.arduino, Skills.ar],
    links: [
      (
        url: 'https://github.com/yashas-hm/Smart-Glass',
        urlText: 'Code',
        icon: FontAwesomeIcons.code
      ),
    ],
    endDate: DateTime(2022, 3),
  );

  static final illnessLab = Project(
    name: 'Illness Lab',
    imageUrl: 'https://yashashm.sirv.com/portfolio/illnessLab.png',
    description:
        'A virtual escape room for medical residents, improving diagnostic reasoning and engagement through scenario-driven challenges.',
    tag: ProjectTag.production,
    skills: [Skills.flutter],
    links: [
      (
        url: 'https://yashas-hm-unc.github.io/illness-lab-website/',
        urlText: 'Demo',
        icon: FontAwesomeIcons.upRightFromSquare,
      ),
    ],
    endDate: DateTime(2025, 2),
  );

  static final medTourismCo = Project(
    name: 'MedTourism Co.',
    imageUrl: 'https://yashashm.sirv.com/portfolio/mtc.png',
    description:
        'A full-stack medical tourism platform with clinic discovery, community forums, health tracking, and live chat to improve user engagement and decision-making.',
    tag: ProjectTag.production,
    skills: [
      Skills.flutter,
      Skills.typescript,
      Skills.python,
      Skills.docker,
      Skills.mysql,
      Skills.nodeJs,
      Skills.expressJs,
    ],
    links: [
      (
        url:
            'https://github.com/yashas-hm/just-documentation/blob/main/MedTourismCo/MedTourismCo.md',
        urlText: 'Documentation',
        icon: FontAwesomeIcons.fileLines,
      ),
    ],
    endDate: DateTime(2024, 6),
  );

  static final dentaVacation = Project(
    name: 'DentaVacation',
    imageUrl: 'https://yashashm.sirv.com/portfolio/dentavacation.png',
    description:
        'A Flutter dental-care app, increasing engagement by 40%, retention by 30%, and customer satisfaction by 20% via quizzes, habit tracking, and real-time chat.',
    tag: ProjectTag.production,
    skills: [
      Skills.flutter,
      Skills.gcp,
      Skills.typescript,
      Skills.docker,
      Skills.mysql,
      Skills.nodeJs,
      Skills.expressJs,
    ],
    links: [
      (
        url:
            'https://github.com/yashas-hm/just-documentation/blob/main/DentaVacation/DentaVacation.md',
        urlText: 'Documentation',
        icon: FontAwesomeIcons.fileLines,
      ),
      (
        url: 'https://www.app.dentavacation.com',
        urlText: 'Demo',
        icon: FontAwesomeIcons.upRightFromSquare,
      )
    ],
    endDate: DateTime(2023, 12),
  );

  static final spotter = Project(
    name: 'Geospatial Social Platform',
    imageUrl: 'https://yashashm.sirv.com/portfolio/spotter.png',
    description:
        'A location-based discovery app using Flutter and Firebase, boosting engagement by 40%, reducing storage usage by 50%, and improving data retrieval speed by 25%.',
    tag: ProjectTag.production,
    skills: [
      Skills.flutter,
      Skills.firebase,
      Skills.gcp,
      Skills.python,
    ],
    links: [
      (
        url: 'https://github.com/spotter-find-your-spot/spotter',
        urlText: 'Documentation',
        icon: FontAwesomeIcons.fileLines,
      ),
    ],
    endDate: DateTime(2022, 12),
  );

  static final dummy = Project(
    name: '',
    imageUrl: '',
    description: '',
    tag: ProjectTag.aiMl,
    skills: [],
    links: [],
    endDate: DateTime(2025, 4),
  );

  /// All projects (unsorted)
  static final List<Project> _all = [
    echoFrame,
    countryCallingCodeKit,
    dayNightSwitcher,
    lavaLampEffect,
    angioNet,
    illnessLab,
    askYashas,
    glowBottomAppBar,
    henchman,
    medTourismCo,
    pratvi,
    directMessage,
    dentaVacation,
    aslGestureSensing,
    spotter,
    smartGlass,
    arduinoMidiDrums,
  ];

  static List<Project> get all => sorted(_all);

  /// Sorts projects:
  /// 1. Groups by tag (all packages together, all AI/ML together, etc.)
  /// 2. Within each tag group, sorts by endDate (newest first, null for in-progress)
  /// 3. Tag groups ordered by tag.order (In Progress → AI/ML → Production → Project → Package)
  static List<Project> sorted(List<Project> projects) {
    final list = List<Project>.from(projects);
    list.sort((a, b) {
      final tagCompare = a.tag.order.compareTo(b.tag.order);
      if (tagCompare != 0) return tagCompare;

      if (a.endDate == null && b.endDate == null) return 0;
      if (a.endDate == null) return -1;
      if (b.endDate == null) return 1;
      return b.endDate!.compareTo(a.endDate!);
    });
    return list;
  }

  static List<Project> byTag(ProjectTag tag) {
    List<Project> list = _all;

    if (tag.order != -1) {
      list = _all.where((p) => p.tag == tag).toList();
    }

    return sorted(list);
  }

  static final List<Project> highlights = [
    askYashas,
    illnessLab,
    medTourismCo,
    henchman,
  ];
}

// static final chequeScanner = Project(
//   name: 'Cheque Scanner',
//   imageUrl: '',
//   description:
//   'Android app for cheque text extraction using camera and ML, achieving 92% OCR accuracy on real-world tests.',
//   tag: ProjectTag.project,
//   skills: [
//     Skills.android,
//     Skills.gcp,
//     Skills.opencv,
//   ],
//   urls: [
//     (
//     url: 'https://github.com/yashas-hm/Cheque-Scanner',
//     urlText: 'Code',
//     icon: FontAwesomeIcons.code
//     ),
//   ],
//   endDate: DateTime(2023, 4),
// );
// static final examSupervisionAssigner = Project(
//   name: 'Exam Supervision Assigner',
//   imageUrl: '',
//   description:
//       'GUI tool automating faculty allocation for exams, reducing manual planning time by 75%.',
//   tag: ProjectTag.project,
//   skills: [Skills.python],
//   urls: [
//     (
//       url: 'https://github.com/yashas-hm/Exam_Supervision_Assigner',
//       urlText: 'Code',
//       icon: FontAwesomeIcons.code
//     ),
//   ],
//   endDate: DateTime(2022, 1),
// );
// static final attendanceSorter = Project(
//   name: 'Attendance Sorter',
//   imageUrl: '',
//   description:
//       'Developed GUI tool to sort and visualize student attendance efficiently, reducing reporting errors by 80%.',
//   tag: ProjectTag.project,
//   skills: [Skills.python],
//   urls: [
//     (
//       url: 'https://github.com/yashas-hm/Attendance-Sorter',
//       urlText: 'Code',
//       icon: FontAwesomeIcons.code
//     ),
//   ],
//   endDate: DateTime(2022, 1),
// );
// static final copterWar = Project(
//   name: 'copter-war',
//   imageUrl: '',
//   description:
//       '2D helicopter shooter game using JS Canvas, improving game design and coding skills; reached 500+ plays online.',
//   tag: ProjectTag.project,
//   skills: [Skills.javascript, Skills.html],
//   urls: [
//     (
//       url: 'https://github.com/yashas-hm/copter-war',
//       urlText: 'Code',
//       icon: FontAwesomeIcons.code
//     ),
//   ],
//   endDate: DateTime(2023, 3),
// );
// static final autoWhatsapp = Project(
//   name: 'AutoWhatsapp',
//   imageUrl: '',
//   description:
//       'Automated WhatsApp replies on Android, reducing manual messaging time by 60% for users.',
//   tag: ProjectTag.project,
//   skills: [Skills.android],
//   urls: [
//     (
//       url: 'https://github.com/yashas-hm/AutoWhatsapp',
//       urlText: 'Code',
//       icon: FontAwesomeIcons.code
//     ),
//   ],
//   endDate: DateTime(2022, 8),
// );
// static final spaceInvaders = Project(
//   name: 'Space Invaders',
//   imageUrl: '',
//   description:
//       'Recreated classic Space Invaders using JavaFX, enhancing game development and object-oriented programming skills.',
//   tag: ProjectTag.project,
//   skills: [Skills.java],
//   urls: [
//     (
//       url: 'https://github.com/yashas-hm/Space_Invaders_JavaFX',
//       urlText: 'Code',
//       icon: FontAwesomeIcons.code
//     ),
//   ],
//   endDate: DateTime(2023, 10),
// );
// static final recipeScraperApi = Project(
//   name: 'Recipe Scraper API',
//   imageUrl: 'https://yashashm.sirv.com/portfolio/recipefetch.png',
//   description:
//       'A Python API to scrape recipes from web URLs, processing 200+ recipes per minute for data aggregation.',
//   tag: ProjectTag.project,
//   skills: [Skills.python],
//   urls: [
//     (
//       url: 'https://github.com/yashas-hm/Recipe-Scraper-API',
//       urlText: 'Code',
//       icon: FontAwesomeIcons.code,
//     ),
//   ],
//   endDate: DateTime(2020, 11),
// );
// static final foodie = Project(
//   name: 'Foodie',
//   imageUrl: '',
//   description: 'Built a dummy food-ordering Android app to prototype UI/UX flows and improve Kotlin Android development skills.',
//   tag: ProjectTag.production,
//   skills: [Skills.android],
//   urls: [
//     (url: 'https://github.com/yashas-hm/Foodie', urlText: 'Code', icon: FontAwesomeIcons.code),
//   ],
//   endDate: DateTime(2024, 2),
// );
