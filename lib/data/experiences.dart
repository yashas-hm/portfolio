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
            'Spearheaded the architectural migration of a legacy application to a modern Flutter codebase while simultaneously engineering scalable endpoints in .NET, ensuring seamless cross-platform performance.',
        icon: null,
      ),
      (
        description:
            'Directed the technical evaluation and integration of critical 3rd-party SDKs; conducted trade-off analysis to select optimal tools, reducing integration overhead by 20% and enhancing app stability.',
        icon: null,
      ),
      (
        description:
            'Diagnosed and resolved complex race conditions across the stack (Flutter & .NET), slashing application crash rates by 40% and significantly improving data consistency.',
        icon: null,
      ),
      (
        description:
            'Designed and deployed custom UI components and backend logic for new product features, directly contributing to a 20% increase in user engagement through data-driven UX improvements.',
        icon: null,
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
      Skills.gitlabSkill,
    ],
  );

  static final uncE = Experience(
    role: 'Software Engineer',
    company: 'UNC Eshleman School of Pharmacy',
    startDate: DateTime(2024, DateTime.october),
    endDate: DateTime(2024, DateTime.january),
    type: ExperienceType.partTime,
    descriptions: [
      (
        description:
            'Engineered and launched a custom educational game using Flutter, designed to enhance diagnostic skills in doctors; resulted in a measurable increase of knowledge retention among participants by 40%.',
        icon: null,
      ),
      (
        description:
            'Introduced analytics to track user performance, boosting training effectiveness by 25% and aiding educators with actionable insights.',
        icon: null,
      ),
    ],
    skills: [
      Skills.flutter,
      Skills.gcp,
    ],
  );

  static final pb = Experience(
    role: 'Senior Software Developer',
    company: 'PracticeBuzz',
    startDate: DateTime(2023, DateTime.june),
    endDate: DateTime(2024, DateTime.july),
    type: ExperienceType.fullTime,
    descriptions: [
      (
        description:
            'Developed cross-platform mobile applications using Flutter, increasing client base by 30% in six months.',
        icon: null,
      ),
      (
        description:
            'Engineered an AI-powered dental analysis framework using computer vision to scan human mouths, detect teeth, and identify issues such as decay and cavities, enabling automated diagnostics.',
        icon: null,
      ),
      (
        description:
            'Designed and implemented backend APIs and SQL databases with Node.js and Express.js, improving processing efficiency by 40% and maintaining 99.8% uptime',
        icon: null
      ),
      (
        description:
            'Built a CMS and integrated payment interfaces, reducing update time by 50% and increasing online sales by 15%.',
        icon: null,
      ),
      (
        description:
            'Demonstrated technical leadership and measurable impact, achieving promotion within 8 months.',
        icon: null,
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
            'Oversaw and delivered Flutter applications for seven companies, achieving over 10K+ downloads and maintaining an average rating of 4.3 stars, ensuring 95% client satisfaction.',
        icon: null,
      ),
      (
        description:
            'Integrated Firebase and other Cloud Services, speeding up data retrieval by 40% and boosting engagement by 30%.',
        icon: null,
      ),
      (
        description:
            'Implemented and deployed scalable ML models and Games, increasing user retention by 25% and improving app ratings by 20%.',
        icon: null,
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
  );

  static final cy = Experience(
    role: 'Software Engineer',
    company: 'Camp Yellow',
    startDate: DateTime(2023, DateTime.april),
    endDate: DateTime(2023, DateTime.may),
    type: ExperienceType.internship,
    descriptions: [
      (
        description:
            'Engineered a parallel downloading method and file compression technique, reducing download time by 50% for 1000+ monthly active users.',
        icon: null,
      ),
      (
        description:
            'Implemented a dynamic system to update gameplay storyboards from Excel sheets, streamlining content management and reducing update time by 50%.',
        icon: null,
      ),
      (
        description:
            'Collaborated with UI/UX designers to integrate innovative designs and animations, increasing user engagement by 30%.',
        icon: null,
      ),
      (
        description:
            'Implemented secure APIs for authentication and data transfer, prioritizing data security and user privacy for a substantial user base.',
        icon: null,
      ),
      (
        description:
            'Implemented audio interface for seamless background music during gameplay, enhancing user experience.',
        icon: null,
      ),
    ],
    skills: [
      Skills.flutter,
      Skills.dart,
      Skills.firebase,
      Skills.gcp,
      Skills.git,
    ],
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
            'Spearheaded the development of a visually stunning Flutter Flame games, boosting user engagement by 20% and enhancing interactivity with immersive visuals and gameplay experiences.',
        icon: null,
      ),
      (
        description:
            'Engineered secure authentication and data APIs, ensuring user privacy and achieving an impressive error rate of less than 3%. Prioritized data security to establish trust and reliability for users.',
        icon: null,
      ),
      (
        description:
            'Optimized code efficiency, reducing loading times by 30% and delivering a smoother gameplay experience. Implemented reusable and reliable code to enhance performance and user satisfaction.',
        icon: null,
      ),
      (
        description:
            'Crafted and engineered three dynamic Flutter games, each contributing to a significant 20% reduction in user churn rate.',
        icon: null,
      ),
    ],
    skills: [
      Skills.flutter,
      Skills.dart,
      Skills.firebase,
      Skills.git,
    ],
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
            'Developed a B2C mobile app integrated with Firebase, resulting in a remarkable 40% increase in user engagement and dynamic content delivery.',
        icon: null,
      ),
      (
        description:
            'Leveraged the Provider & RiverPod library for streamlined state management, yielding a significant 20% reduction in development time and enhancing app responsiveness.',
        icon: null,
      ),
      (
        description:
            'Implemented caching using the Hive library, leading to a substantial 30% improvement in app performance and a 50% reduction in server requests.',
        icon: null,
      ),
    ],
    skills: [
      Skills.flutter,
      Skills.dart,
      Skills.firebase,
      Skills.git,
    ],
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
        icon: null,
      ),
      (
        description:
            'Developed and implemented RESTful search and create API, reducing development time by 30%.',
        icon: null,
      ),
    ],
    skills: [
      Skills.android,
      Skills.java,
    ],
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
        icon: null,
      ),
      (
        description:
            'Optimized performance and reduced battery consumption by 30% through Android native services integration.',
        icon: null,
      ),
    ],
    skills: [Skills.android],
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
        icon: null,
      ),
      (
        description:
            'Conducted thorough unit tests using JUnit, achieving a test coverage of 95%.',
        icon: null,
      ),
    ],
    skills: [Skills.android],
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
        icon: null,
      ),
      (
        description:
            'Optimized performance with threading techniques, reducing loading time by 50%.',
        icon: null,
      ),
    ],
    skills: [Skills.android],
  );

  static final List<Experience> all = [
    albi,
    uncE,
    pb,
    freelance,
    cy,
    grahnumb,
    ecsol,
    raahi,
    surjal,
    yellow,
    ngo,
  ];
}
