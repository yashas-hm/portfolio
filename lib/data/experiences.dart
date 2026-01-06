import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/data/skills.dart';
import 'package:portfolio/model/experience.dart';

class Experiences {
  Experiences._();

  static final albi = Experience(
    role: 'Software Engineer',
    company: 'Albiware LLC',
    startDate: DateTime(2025, DateTime.may),
    endDate: null,
    type: ExperienceType.partTime,
    descriptions: [
      (
        description:
            'Migrated legacy app to Flutter & restructured .NET APIs, improving cross-platform stability.',
        icon: FontAwesomeIcons.code
      ),
      (
        description:
            'Reduced crash rate from ~3% to <2% by fixing async UI state race conditions.',
        icon: FontAwesomeIcons.bug
      ),
      (
        description:
            'Shipped frontend & backend features, boosting weekly active engagement by 22%.',
        icon: FontAwesomeIcons.penRuler
      ),
      (
        description:
            'Integrated 3rd-party SDKs via trade-off analysis, reducing rework by 29%.',
        icon: FontAwesomeIcons.screwdriverWrench
      ),
    ],
    skills: [
      Skills.flutter,
      Skills.dotNet,
      Skills.dart,
      Skills.cSharp,
      Skills.mysql,
      Skills.python,
      Skills.git,
      Skills.gitlab,
    ],
    icon: FontAwesomeIcons.laptopCode,
  );

  static final uncE = Experience(
    role: 'Software Engineer',
    company: 'UNC Eshleman School of Pharmacy',
    startDate: DateTime(2024, DateTime.october),
    endDate: DateTime(2025, DateTime.january),
    type: ExperienceType.partTime,
    descriptions: [
      (
        description:
            'Built an educational Flutter game, increasing diagnostic knowledge retention by 40%.',
        icon: FontAwesomeIcons.gamepad
      ),
      (
        description:
            'Added analytics to track performance, boosting training effectiveness by 25%.',
        icon: FontAwesomeIcons.chartPie
      ),
      (
        description:
            'Improved engagement by 30% and learning retention by 25% using gameplay metrics from 1,000+ students across UNC, UIC, and Monash.',
        icon: FontAwesomeIcons.arrowUpRightDots,
      ),
    ],
    skills: [
      Skills.flutter,
      Skills.gcp,
    ],
    icon: FontAwesomeIcons.graduationCap,
  );

  static final pb = Experience(
    role: 'Software Engineer',
    company: 'PracticeBuzz',
    startDate: DateTime(2023, DateTime.june),
    endDate: DateTime(2024, DateTime.july),
    type: ExperienceType.fullTime,
    descriptions: [
      (
        description:
            'Built Flutter apps, boosting active client usage by ~30% over six months.',
        icon: FontAwesomeIcons.mobileScreenButton
      ),
      (
        description:
            'Integrated CV models for automated dental feature detection, optimizing inference.',
        icon: FontAwesomeIcons.brain
      ),
      (
        description:
            'Designed Node.js/Express/PostgreSQL APIs, improving response time by ~40% with 99.8% uptime.',
        icon: FontAwesomeIcons.server
      ),
      (
        description:
            'Built CMS tools & payment integrations, cutting update time by ~50% and boosting transactions by ~15%.',
        icon: FontAwesomeIcons.moneyBill
      ),
      (
        description:
            'Promoted within 8 months for consistent delivery across mobile and backend.',
        icon: FontAwesomeIcons.trophy
      ),
    ],
    skills: [
      Skills.flutter,
      Skills.dart,
      Skills.nodeJs,
      Skills.expressJs,
      Skills.git,
      Skills.docker,
      Skills.kubernetes,
      Skills.bash,
      Skills.python,
      Skills.githubActions,
    ],
    icon: FontAwesomeIcons.briefcase,
  );

  static final freelance = Experience(
    role: 'Software Engineer',
    company: 'Individual Contributor',
    startDate: DateTime(2019, DateTime.august),
    endDate: DateTime(2023, DateTime.may),
    type: ExperienceType.freelance,
    descriptions: [
      (
        description:
            'Delivered Flutter apps for 7 companies, achieving 10K+ downloads and 95% client satisfaction.',
        icon: FontAwesomeIcons.users
      ),
      (
        description:
            'Integrated Firebase & Cloud services, speeding up data retrieval by 40% and boosting engagement by 30%.',
        icon: FontAwesomeIcons.cloud
      ),
      (
        description:
            'Deployed ML models and games, increasing retention by 25% and improving app ratings by 20%.',
        icon: FontAwesomeIcons.robot
      ),
    ],
    skills: [
      Skills.langchain,
      Skills.git,
      Skills.docker,
      Skills.aws,
      Skills.python,
      Skills.opencv,
      Skills.nodeJs,
    ],
    icon: FontAwesomeIcons.userGear,
  );

  static final campYellow = Experience(
    role: 'Software Engineer',
    company: 'Camp Yellow',
    startDate: DateTime(2023, DateTime.april),
    endDate: DateTime(2023, DateTime.april),
    type: ExperienceType.internship,
    descriptions: [
      (
        description:
            'Engineered parallel download & compression, cutting download time by 50%.',
        icon: FontAwesomeIcons.download
      ),
      (
        description:
            'Updated gameplay storyboards from Excel sheets, reducing update time by 50%.',
        icon: FontAwesomeIcons.fileExcel
      ),
      (
        description:
            'Collaborated with UI/UX designers, increasing engagement by 30%.',
        icon: FontAwesomeIcons.paintbrush
      ),
      (
        description:
            'Implemented secure APIs for authentication and data transfer.',
        icon: FontAwesomeIcons.lock
      ),
      (
        description:
            'Added audio interface for seamless background music during gameplay.',
        icon: FontAwesomeIcons.music
      ),
    ],
    skills: [
      Skills.flutter,
      Skills.dart,
      Skills.firebase,
      Skills.gcp,
      Skills.git,
    ],
    icon: FontAwesomeIcons.gamepad,
  );

  static final grahnumb = Experience(
    role: 'Flutter Game Developer',
    company: 'Grahnumb',
    startDate: DateTime(2023, DateTime.february),
    endDate: DateTime(2023, DateTime.march),
    type: ExperienceType.internship,
    descriptions: [
      (
        description:
            'Built Flutter Flame games, increasing engagement by 20% with immersive visuals and gameplay.',
        icon: FontAwesomeIcons.gamepad
      ),
      (
        description:
            'Implemented secure auth and data APIs, maintaining <3% error rate and strong user trust.',
        icon: FontAwesomeIcons.lock
      ),
      (
        description:
            'Optimized performance, reducing load times by 30% for smoother gameplay.',
        icon: FontAwesomeIcons.rocket
      ),
      (
        description:
            'Developed three Flutter games, reducing user churn by 20%.',
        icon: FontAwesomeIcons.thumbsUp
      ),
    ],
    skills: [
      Skills.flutter,
      Skills.dart,
      Skills.firebase,
      Skills.git,
    ],
    icon: FontAwesomeIcons.gamepad,
  );

  static final ecsol = Experience(
    role: 'Flutter Engineer',
    company: 'EcoConsumers Solutions Pvt. Ltd.',
    startDate: DateTime(2022, DateTime.june),
    endDate: DateTime(2022, DateTime.september),
    type: ExperienceType.internship,
    descriptions: [
      (
        description:
            'Built a Firebase-backed B2C app, increasing user engagement by 40%.',
        icon: FontAwesomeIcons.mobileScreenButton
      ),
      (
        description:
            'Applied Provider & Riverpod for state management, cutting dev time by 20%.',
        icon: FontAwesomeIcons.diagramProject
      ),
      (
        description:
            'Implemented Hive caching, boosting performance by 30% and reducing server calls by 50%.',
        icon: FontAwesomeIcons.database
      ),
    ],
    skills: [
      Skills.flutter,
      Skills.dart,
      Skills.firebase,
      Skills.git,
    ],
    icon: FontAwesomeIcons.mobileScreenButton,
  );

  static final raahi = Experience(
    role: 'Software Developer Intern',
    company: 'Raahi Mobi Pvt. Ltd.',
    startDate: DateTime(2021, DateTime.may),
    endDate: DateTime(2021, DateTime.june),
    type: ExperienceType.internship,
    descriptions: [
      (
        description:
            'Integrated caching mechanism, reducing asset loading time by 20% for enhanced performance.',
        icon: FontAwesomeIcons.boxesStacked
      ),
      (
        description:
            'Developed and implemented RESTful search and create API, reducing development time by 30%.',
        icon: FontAwesomeIcons.server
      ),
    ],
    skills: [
      Skills.android,
      Skills.java,
    ],
    icon: FontAwesomeIcons.server,
  );

  static final surjal = Experience(
    role: 'Mobile Developer',
    company: 'Surjal Services Pvt. Ltd.',
    startDate: DateTime(2021, DateTime.january),
    endDate: DateTime(2021, DateTime.february),
    type: ExperienceType.internship,
    descriptions: [
      (
        description:
            'Developed a WhatsApp auto-responder app with a 95% response rate, boosting user engagement.',
        icon: FontAwesomeIcons.whatsapp
      ),
      (
        description:
            'Optimized performance and reduced battery consumption by 30% through Android native services integration.',
        icon: FontAwesomeIcons.bolt
      ),
    ],
    skills: [Skills.android],
    icon: FontAwesomeIcons.mobileScreenButton,
  );

  static final yellow = Experience(
    role: 'Android Developer',
    company: '99 Yellow',
    startDate: DateTime(2020, DateTime.august),
    endDate: DateTime(2020, DateTime.december),
    type: ExperienceType.internship,
    descriptions: [
      (
        description:
            'Implemented local storage with Room Database, reducing data retrieval time by 30%.',
        icon: FontAwesomeIcons.database
      ),
      (
        description:
            'Conducted thorough unit tests using JUnit, achieving a test coverage of 95%.',
        icon: FontAwesomeIcons.vial
      ),
    ],
    skills: [Skills.android],
    icon: FontAwesomeIcons.android,
  );

  static final ngo = Experience(
    role: 'Android Developer Intern',
    company: 'Shree Mahesh Heritage',
    startDate: DateTime(2020, DateTime.june),
    endDate: DateTime(2020, DateTime.july),
    type: ExperienceType.internship,
    descriptions: [
      (
        description:
            'Integrated offline storage, enabling browsing history access without internet, enhancing user convenience.',
        icon: FontAwesomeIcons.boxArchive
      ),
      (
        description:
            'Optimized performance with threading techniques, reducing loading time by 50%.',
        icon: FontAwesomeIcons.gaugeHigh
      ),
    ],
    skills: [Skills.android],
    icon: FontAwesomeIcons.solidHeart,
  );

  static final List<Experience> all = [
    albi,
    uncE,
    pb,
    freelance,
    campYellow,
    grahnumb,
    ecsol,
    raahi,
    surjal,
    yellow,
    ngo,
  ];

  static List<Experience> get sortedExperiences {
    final experiences = [...all];
    experiences.sort((a, b) {
      final aEnd = a.endDate ?? DateTime(9999);
      final bEnd = b.endDate ?? DateTime(9999);

      final endCompare = bEnd.compareTo(aEnd);
      if (endCompare != 0) return endCompare;

      return b.startDate.compareTo(a.startDate);
    });
    return experiences;
  }
}
