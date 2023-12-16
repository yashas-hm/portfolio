import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/data/model.dart';

class Data {
  static const String about =
      '''🚀 Meet the Maestro of Code at Practice Buzz! 🌐 As a Software Sorcerer, I craft enchanting cross-platform apps that dance seamlessly between devices using Flutter and Dart. I don't just build apps; I craft experiences that users won't forget.

🎨 Frontend arts are not lost on me. HTML, CSS, and React are my brushes, turning screens into canvases that tell compelling tales.

💻 In the backend battlegrounds, I wield the mighty Node and Express, sculpting APIs that are more robust than a fortress, backed by the formidable powers of PostgreSQL or the nimble MongoDB. With the wisdom of cloud giants, I effortlessly navigate the realms of AWS, Firebase, and Google Cloud, crafting digital ecosystems that transcend ordinary boundaries.

🐳 Docker is my magic potion, encapsulating my innovations into digital time capsules. When chaos reigns, I summon the Kubernetes forces, orchestrating containers like a symphony conductor.

🏗️ DevOps is my realm; CICD is my anthem. Git workflows, Jenkins, and the rhythmic beats of version control with Git and the automated enchantments of Ansible as my trusty steeds, ensuring each line of code dances flawlessly from creation to deployment.

🌐 Stepping into the collaborative cosmos, I am fluent in the languages of collaboration platforms—Jira, Trello, and Slack. I orchestrate seamless teamwork, ensuring that communication flows like a well-rehearsed melody.

🎓 Armed with a Bachelor's in Computer Science Engineering from Indus University Ahmedabad, I don't just study code; I sculpt it into winning solutions, conquering hackathons and competitions with flair.

💻 From the elegance of Java to the versatility of Python, the dynamism of JavaScript to the power of C++, every coding language, including the rhythmic Bash, is a note in my symphony. GitHub and GitLab are my arenas, where repositories thrive like digital ecosystems.

💡 I don't just write code; I build innovative solutions that push the boundaries of what's possible. Join me on this journey, where every line of code is a stroke of genius! ⚡️''';

  static List<String> navItems = [
    'Home',
    'About Me',
    'Experience',
    'Projects',
    // 'Certifications',
  ];

  static List<Map<String, String>> logoSkill = [
    {
      'Flutter': AppConstants.flutter,
      'Dart': AppConstants.dart,
      'Python': AppConstants.python,
      'JAVA': AppConstants.java,
      'JavaScript': AppConstants.js,
      'Git': AppConstants.git,
      'Kotlin': AppConstants.kotlin,
      'Bash': AppConstants.bash,
      'C++': AppConstants.c,
    },
    {
      'PostgreSQL': AppConstants.psql,
      'AWS': AppConstants.aws,
      'Firebase': AppConstants.firebase,
      'GCP': AppConstants.gcp,
      'Docker': AppConstants.docker,
      'Heroku': AppConstants.heroku,
      'SpringBoot': AppConstants.spring,
    },
    {
      'NumPy': AppConstants.np,
      'OpenCV': AppConstants.opencv,
      'TensorFlow': AppConstants.tf,
      'Pandas': AppConstants.pd,
      'Android Studio': AppConstants.as,
      'IntelliJ IDEA': AppConstants.intellij,
      'Jira': AppConstants.jira,
      'CSS': AppConstants.css,
      'React': AppConstants.react,
      'HTML': AppConstants.html,
      'Node.js': AppConstants.node,
    },
  ];

  static List<Model> highlights = [
    experience[0],
    techAchievements,
    culAchievements,
  ];

  static List<Model> experience = [
    Model(
      id: '8',
      name: 'Practice Buzz',
      role: 'Software Developer Engineer',
      location: 'Sector 48D, Chandigarh',
      from: DateTime(2023, DateTime.june),
      to: DateTime(2300, DateTime.june),
      description: [
        'Developed and launched a user-friendly cross platform app showcasing the company\'s dental clinic collaborations, resulting in a 30% increase in patient appointments.',
        'Implemented a highly accurate cost calculator feature within the app, enabling users to approximate treatment costs with 95% accuracy, leading to improved transparency and customer satisfaction.',
        'Designed and integrated a habit tracker feature with notification system into the app, resulting in a 20% increase in user engagement and adherence to healthy dental habits.',
        'Utilized Firebase and WordPress for backend development, optimizing data storage efficiency by 30% and reducing loading time by an average of 2 seconds per user.',
        'Employed BLoC Architecture in conjunction with the Agile methodology to craft the application.'
      ],
      link: '',
      skills: [
        'Flutter',
        'MVC',
        'BLoC',
        'UI/UX',
        'Git',
        'GetX',
      ],
      linkName: 'Certificate',
    ),
    Model(
      id: '7',
      name: 'Camp Yellow',
      role: 'Software Developer Intern',
      location: 'Bengaluru, Karnataka',
      from: DateTime(2023, DateTime.april),
      to: DateTime(2023, DateTime.may),
      description: [
        'Implemented a parallel downloading method and file compression technique, resulting in a 50% decrease in download time for application users.',
        'Collaborated with UI/UX designers to integrate innovative designs and animations into the application, leading to a 30% increase in user engagement.',
        'Instrumented secure APIs for authentication and data transfer, ensuring a seamless and protected user experience for 1000+ daily active users.',
      ],
      link:
          'https://drive.google.com/file/d/1RFNNyXiYk-s_6IiD4LcPcwW0X52y2gPj/view?usp=sharing',
      skills: [
        'Flutter',
        'API',
        'UI/UX',
        'Git',
      ],
      linkName: 'Certificate',
    ),
    Model(
      id: '6',
      name: 'Grahnumb',
      role: 'Flutter Developer Intern',
      location: 'Banglore, Karnataka',
      from: DateTime(2023, DateTime.february),
      to: DateTime(2022, DateTime.march),
      description: [
        'Developed a highly interactive and visually stunning game using the Flutter Flame engine, resulting in a 20% increase in user engagement.',
        'Implemented secure authentication and data APIs, ensuring user privacy and protecting sensitive information with an error rate of less than 3%.',
        'Wrote efficient, reusable, and reliable code that reduced loading times by 30%, resulting in a smoother gameplay experience for users.',
      ],
      link: '',
      skills: ['Flutter', 'Flame', 'Firebase', 'Git'],
      linkName: 'Certificate',
    ),
    Model(
      id: '5',
      name: 'EcoConsumers Solutions Pvt. Ltd.',
      role: 'Flutter Developer Intern',
      location: 'Banglore, Karnataka',
      from: DateTime(2022, DateTime.june),
      to: DateTime(2022, DateTime.september),
      description: [
        'Utilized the GetX library for state management, resulting in improved app responsiveness and reduced development time by 20%.',
        'Developed a B2C mobile app from scratch, integrating it with Firebase to enable real-time data synchronization and increase user engagement by 40%',
        'Implemented caching using Hive library, resulting in a 30% improvement in app performance and reduced server requests by 50%.',
      ],
      link:
          'https://drive.google.com/file/d/1dXnwJE0P1YSvXxWSZTD4lxW7vhi5uT_a/view?usp=sharing',
      skills: [
        'Flutter',
        'GetX',
        'Firebase',
        'Hive',
        'Git',
      ],
      linkName: 'Certificate',
    ),
    Model(
      id: '4',
      name: 'Raahi Mobi Pvt. Ltd.',
      role: 'Android Developer Intern',
      location: 'Banglore, Karnataka',
      from: DateTime(2021, DateTime.may),
      to: DateTime(2021, DateTime.june),
      description: [
        'Transformed wireframe UI designs into fully functional code, resulting in a seamless user experience and increased user engagement by 15%.',
        'Enhanced performance by integrating a caching mechanism, resulting in a 20% decrease in loading time for game assets.',
        'Developed and implemented a search and create API using REST-full services, improving the efficiency of game development and reducing development time by 30%.',
      ],
      link:
          'https://drive.google.com/file/d/1J3EJwXQuUSfXE0fDU3I-9rGOWG_vgjBq/view?usp=sharing',
      skills: [
        'Android',
        'REST',
        'Firebase',
        'MVVM',
      ],
      linkName: 'Certificate',
    ),
    Model(
      id: '3',
      name: 'Surjal Services Pvt. Ltd.',
      role: 'Android Developer Intern',
      location: 'Raipur, Chattisgarh',
      from: DateTime(2021, DateTime.january),
      to: DateTime(2021, DateTime.february),
      description: [
        'Developed a highly efficient WhatsApp auto responder app that achieved a 95% response rate, resulting in increased user engagement and satisfaction.',
        'Integrated Firebase into the app, enabling seamless and real-time data retrieval, leading to a 50% reduction in response time for retrieving user data.',
        'Successfully integrated Android native services into the app, optimizing performance and reducing battery consumption by 30%, resulting in improved user experience.',
      ],
      link:
          'https://drive.google.com/file/d/1Hfnk4zyjt7dTzV7uBlwInk2hcegx8DZn/view?usp=sharing',
      skills: [
        'Android',
        'REST',
        'Firebase',
      ],
      linkName: 'Certificate',
    ),
    Model(
      id: '2',
      name: '99 Yellow',
      role: 'Android Developer Intern',
      location: 'Faridabad, Haryana',
      from: DateTime(2020, DateTime.august),
      to: DateTime(2020, DateTime.december),
      description: [
        'Implemented local storage functionality using Room Database, resulting in a significant reduction in data retrieval time by 30%.',
        'Executed thorough unit tests using the JUnit framework, ensuring the reliability and stability of the application with a test coverage of 95%.',
      ],
      link:
          'https://drive.google.com/file/d/1SS-dw_wDisPR9Ul9vU1FOoiFv8za_pOP/view?usp=sharing',
      skills: [
        'Android',
        'XML',
        'Room',
      ],
      linkName: 'Certificate',
    ),
    Model(
      id: '1',
      name: 'Shree Mahesh Heritage',
      role: 'Android Developer Intern',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2020, DateTime.june),
      to: DateTime(2020, DateTime.july),
      description: [
        'Developed and implemented a web browser app using Java, resulting in over 100,000 downloads and a 4-star rating on Google Play Store.',
        'Integrated offline storage capabilities into the app, allowing users to access their browsing history even without an internet connection.',
        'Optimized performance by implementing threading techniques, resulting in a 50% decrease in app loading time.',
      ],
      link:
          'https://drive.google.com/file/d/1clY8oQyuHSyzHJ3BuA8Tgc0d4AP2Kxe9/view?usp=sharing',
      skills: [
        'Android',
        'XML',
        'Room',
      ],
      linkName: 'Certificate',
    ),
  ];

  static List<Model> projects = [
    Model(
      id: '10',
      name: 'Spotter',
      role: 'Flutter',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2022, DateTime.november),
      to: DateTime(2023, DateTime.february),
      description: [
        'Led development of Spotter, a sophisticated mobile app that utilizes advanced algorithms to offer personalized location suggestions based on user preferences and location data.',
        'Spearheaded community engagement by connecting local artists, promoting their work, and facilitating the sharing of favorite spots among users, fostering a sense of belonging and connection.',
        'Implemented the BLoC (Business Logic Component) architecture to establish a robust and modular structure for Spotter app, enhancing code organization, re-usability, and maintainability.',
        'Integrated Firebase for streamlined data management, harnessed the Google Maps API for precise geolocation services, and harnessed Google Cloud\'s capabilities to ensure efficient backend support in the development of the Spotter app.',
      ],
      link: 'https://github.com/spotter-find-your-spot/spotter',
      skills: [
        'Flutter',
        'Firebase',
        'Google Cloud',
        'Google Maps SDK',
      ],
      linkName: AppConstants.flutter,
    ),
    Model(
      id: '9',
      name: 'PraTvi',
      role: 'Flutter',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2022, DateTime.november),
      to: DateTime(2022, DateTime.december),
      description: [
        'Developed a feature-rich wedding logistics app with a Firebase backend, offering real-time functionalities such as check-in, bus status updates, room allocation, and personalized itineraries, showcasing expertise in mobile app development and cloud integration.',
        'Ensured seamless user experience by incorporating driver contact details, demonstrating a user-centered approach and problem-solving skills in creating a comprehensive solution that enhances event coordination.',
      ],
      link: 'https://github.com/yashas-hm/PRATVI',
      skills: [
        'Flutter',
        'Firebase',
      ],
      linkName: AppConstants.flutter,
    ),
    Model(
      id: '7',
      name: 'Cheque Scanner',
      role: 'Android',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2021, DateTime.march),
      to: DateTime(2021, DateTime.april),
      description: [
        'Pioneered the integration of Optical Character Recognition (OCR) technology to facilitate seamless text detection and automatic data population for cheque details. Expertly harnessed OCR capabilities to optimize user input, reducing errors and enhancing efficiency in financial transactions.',
        'Employed Firebase ML Kit to implement sophisticated machine learning functionalities into the application. Leveraged its powerful features to enable accurate text recognition and efficient data extraction. Demonstrated adeptness in harnessing cutting-edge tools for enhancing user experiences.',
      ],
      link: 'https://github.com/yashas-hm/Cheque-Scanner',
      skills: ['Android', 'AI/ML', 'Firebase ML Kit'],
      linkName: AppConstants.android,
    ),
    Model(
      id: '6',
      name: 'ASL Gesture\nSensing',
      role: 'AI/ML',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2021, DateTime.june),
      to: DateTime(2021, DateTime.july),
      description: [
        'Developed an advanced Machine Learning model capable of accurately recognizing and interpreting American Sign Language (ASL) gestures.',
        'Engineered a holistic approach to gesture recognition, considering complete ASL gestures within the model\'s predictions, reflecting a comprehensive understanding of gesture dynamics and enhancing communication accessibility.'
      ],
      link: 'https://github.com/yashas-hm/ASL-Gesture-Sensing',
      skills: [
        'Python',
        'AI/ML',
        'Mediapipe',
      ],
      linkName: AppConstants.python,
    ),
    Model(
      id: '5',
      name: 'Space Invaders\nGame',
      role: 'JAVA',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2022, DateTime.january),
      to: DateTime(2022, DateTime.january),
      description: [
        'Utilized JavaFX to re-imagine a well-known game, demonstrating creativity and technical prowess in game development. Skillfully employed JavaFX\'s rich graphical capabilities to recreate a captivating and visually appealing gaming experience, showcasing expertise in Java-based user interfaces.',
        'Crafted an engaging gameplay experience by leveraging multiple sprites and controllers within the game. Implemented intricate interactions between elements, enhancing user immersion and participation. Demonstrated a deep understanding of game mechanics and user engagement principles.',
      ],
      link: 'https://github.com/yashas-hm/Space_Invaders_JavaFX',
      skills: [
        'JAVA',
        'JavaFX',
      ],
      linkName: AppConstants.java,
    ),
    Model(
      id: '4',
      name: 'Direct Message',
      role: 'Flutter',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2021, DateTime.march),
      to: DateTime(2021, DateTime.april),
      description: [
        'Developed a user-centric feature enabling seamless access to WhatsApp chat screens without the need to save contact numbers. Implemented an intuitive pathway that enhances user engagement by simplifying communication processes. Applied mobile application development skills to streamline user interactions.',
        'Successfully launched the application on the Google Play Store, reaching a broader audience and showcasing technical proficiency in the entire app deployment lifecycle. Managed the app\'s submission, publication, and updates to ensure a consistent and reliable user experience.',
      ],
      link: 'https://github.com/yashas-hm/Direct-Message',
      skills: [
        'Flutter',
        'Play Store',
      ],
      linkName: AppConstants.flutter,
    ),
    Model(
      id: '3',
      name: 'Foodie',
      role: 'Android',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2020, DateTime.april),
      to: DateTime(2020, DateTime.may),
      description: [
        'Designed and developed a user-friendly mobile application for efficient food ordering. Implemented features allowing users to easily add items to their cart, organize selections, and employ search functionalities. Leveraged expertise in mobile application development to ensure a seamless and intuitive user experience.',
        'Integrated the app with a robust REST API to fetch and manage real-time food item data. Effectively communicated with external data sources, optimizing data retrieval and ensuring accurate menu representation within the application. Demonstrated proficiency in API integration techniques.',
      ],
      link: 'https://github.com/yashas-hm/Foodie',
      skills: [
        'Android',
        'REST',
      ],
      linkName: AppConstants.android,
    ),
    Model(
      id: '2',
      name: 'MIDI Drum Set',
      role: 'IoT',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2019, DateTime.november),
      to: DateTime(2020, DateTime.january),
      description: [
        'Developed a cutting-edge MIDI drum set that seamlessly interfaces with laptops, accurately replicating the dynamics and feel of a real drum kit. Leveraged expertise in mobile application development and AI to create a user-friendly and responsive virtual drumming experience.',
        'Engineered innovative foam-based drum pads equipped with precision piezo sensors, enabling intricate tap detection and translating user input into expressive MIDI signals. Employed software development skills to optimize sensor integration and enhance drumming realism.',
      ],
      link: 'https://www.instructables.com/id/Arduino-MIDI-Drums/',
      skills: [
        'IoT',
        'Arduino',
      ],
      linkName: AppConstants.iot,
    ),
    // Model(
    //   id: '1',
    //   name: 'GitHub',
    //   role: 'More Projects',
    //   location: 'Online',
    //   from: DateTime(2019, DateTime.april),
    //   to: DateTime(2300, DateTime.april),
    //   description: [
    //     'More projects in my github repository.',
    //   ],
    //   link: 'https://github.com/yashas-hm',
    //   skills: [],
    //   linkName: 'Visit',
    // ),
  ];

  static List<Model> certifications = [
    Model(
      id: '1',
      name: 'Flutter Development',
      role: 'Udemy',
      location: 'Online',
      from: DateTime(3000),
      to: DateTime(2021, DateTime.april),
      description: [],
      link:
          'https://drive.google.com/file/d/1E0yEqmsBtCFTHYDP0cLYpW_xqGwevjRZ/view?usp=sharing',
      skills: [],
      linkName: 'Certificate',
    ),
    Model(
      id: '1',
      name: 'Python Specialization',
      role: 'Coursera',
      location: 'Online',
      from: DateTime(3000),
      to: DateTime(2020, DateTime.august),
      description: [],
      link:
          'https://drive.google.com/file/d/1KvlYD5UmyrPK2e94vTU306P6biBibb_k/view?usp=sharing',
      skills: [],
      linkName: 'Certificate',
    ),
    Model(
      id: '1',
      name: 'Android App Development',
      role: 'Internshala',
      location: 'Online',
      from: DateTime(3000),
      to: DateTime(2020, DateTime.may),
      description: [],
      link:
          'https://drive.google.com/file/d/1WDZYhw6dMKsGamP7lZmy76LM6Av7746g/view?usp=sharing',
      skills: [],
      linkName: 'Certificate',
    ),
    Model(
      id: '1',
      name: 'Java Development',
      role: 'Udemy',
      location: 'Online',
      from: DateTime(3000),
      to: DateTime(2021, DateTime.march),
      description: [],
      link:
          'https://drive.google.com/file/d/1dIIArU-f13H7nTC9byfdodDhOSTTDBXt/view?usp=sharing',
      skills: [],
      linkName: 'Certificate',
    ),
    Model(
      id: '1',
      name: 'Data Analysis With Python',
      role: 'FreeCode\nCamp',
      location: 'Online',
      from: DateTime(3000),
      to: DateTime(2021, DateTime.june),
      description: [],
      link:
          'https://drive.google.com/file/d/1mJ0Xi5JIZm917miGkpJTc8Yu8MwZIpH4/view?usp=sharing',
      skills: [],
      linkName: 'Certificate',
    ),
    Model(
      id: '1',
      name: 'Scientific Computing With Python',
      role: 'FreeCode\nCamp',
      location: 'Online',
      from: DateTime(3000),
      to: DateTime(2021, DateTime.june),
      description: [],
      link:
          'https://drive.google.com/file/d/10H1vvFElFjE4RNAQostS0duz8a4g8jnW/view?usp=sharing',
      skills: [],
      linkName: 'Certificate',
    ),
    Model(
      id: '1',
      name: 'SQL Intermediate',
      role: 'Hacker\nRank',
      location: 'Online',
      from: DateTime(3000),
      to: DateTime(2021, DateTime.july),
      description: [],
      link:
          'https://drive.google.com/file/d/1Yh6NWRag68BAvyFsJd3_G4B-snfcddY2/view?usp=sharing',
      skills: [],
      linkName: 'Certificate',
    ),
    Model(
      id: '1',
      name: 'JavScript Intermediate',
      role: 'Hacker\nRank',
      location: 'Online',
      from: DateTime(3000),
      to: DateTime(2021, DateTime.july),
      description: [],
      link:
          'https://drive.google.com/file/d/137ufqIby5gBC9LAJJ1UAsJIt1j59Rjw2/view?usp=sharing',
      skills: [],
      linkName: 'Certificate',
    ),
  ];

  static Model culAchievements = Model(
    id: '1',
    name: 'Achievements',
    role: 'Cultural',
    location: 'Ahmedabad, Gujarat',
    from: DateTime(2019, DateTime.august),
    to: DateTime(2023, DateTime.april),
    description: [
      '2nd Prize in Nirma Duet Singing Competition 2019.',
      '1st Prize in Parul University e-cultural fest 2020.',
      '3rd Prize in Nirma University Western Singing Competition 2023.',
      'Performed on stage multiple times in front of a huge crowd.',
    ],
    link: '',
    skills: [],
    linkName: 'Certificate',
  );

  static Model techAchievements = Model(
    id: '1',
    name: 'Achievements',
    role: 'Technical',
    location: 'Ahmedabad, Gujarat',
    from: DateTime(2019, DateTime.august),
    to: DateTime(2023, DateTime.april),
    description: [
      'Smart India Hackathon Finalist 2022, developed Fake News Detection AI Website & API.',
      '1st Prize in National Level Hackathon by Nirma University 2021, developed a Cheque Scanner OCR Mobile App.',
      '1st Prize in National Level Hackathon by Nirma University 2022, developed American Sign Language gesture detector using open Computer Vision.',
      '2nd Prize in Student Startup and Innovation Program 2019, award by CM of Gujarat.',
      '1st Prize in National Level Hackathon by Parul University 2020.',
      '1st Prize in National Level Hackathon by Indus University 2019, developed an IoT MR smart-glass.',
    ],
    link: '',
    skills: [
      'Team co-ordination',
      'Project Management',
    ],
    linkName: 'Certificate',
  );

  static List<Model> por = [
    Model(
      id: '3',
      name: 'Student Activity Cell, Indus University',
      role: 'President',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2021, DateTime.june),
      to: DateTime(2022, DateTime.june),
      description: [
        'Demonstrated strong leadership skills and a proactive approach to organizing and overseeing a wide range of student events.',
        'Managed a dedicated team of 30 students, providing guidance, support, and direction to ensure the successful execution of over 80 events, highlighting effective team management and coordination abilities.',
      ],
      link:
          'https://drive.google.com/file/d/1rbEq5ahFdvNMz8SgbFBlLj3pTqU7uaUv/view?usp=sharing',
      skills: [
        'Team Management',
        'Leadership',
      ],
      linkName: 'Certificate',
    ),
    Model(
      id: '2',
      name: 'GDSE Android Jams',
      role: 'Facilitator',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2021, DateTime.december),
      to: DateTime(2022, DateTime.january),
      description: [
        'Exemplified a commitment to fostering technological learning and community engagement among students.',
        'Successfully organized and led three educational events focused on teaching Android development to enthusiastic students, showcasing leadership in promoting skill development and knowledge sharing within the student community.',
      ],
      link:
          'https://drive.google.com/file/d/1OBGCxoIyuJVbMIgdjEnYOI1qzXVo8Fy0/view?usp=sharing',
      skills: [
        'Teaching',
        'Leadership',
      ],
      linkName: 'Certificate',
    ),
    Model(
      id: '1',
      name: 'National Level Hackathons',
      role: 'Team Leader',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2019, DateTime.august),
      to: DateTime(2023, DateTime.april),
      description: [
        'Appointed as Team Leader in multiple National Level Hackathons, showcasing recognition of leadership abilities and responsibility in guiding teams of 3-5 students through intensive competition environments.',
        'Demonstrated adept project management by overseeing and actively contributing to various projects within the hackathon context, highlighting a dynamic skill set and proactive problem-solving approach.',
      ],
      link: '',
      skills: [
        'Team Management',
        'Co-ordination',
      ],
      linkName: 'Certificate',
    ),
  ];

  static Map<String, String> softSkills = {
    'Leadership': AppConstants.leader,
    'Team\nCoordination': AppConstants.coord,
    'Team Management': AppConstants.management,
    'Analytical &\nCritical Thinking': AppConstants.thinking,
    'Communication': AppConstants.communication,
  };

  static Map<String, String> projectSkills = {
    'Agile\nArchitecture': AppConstants.agile,
    'BLoC\nArchitecture': AppConstants.bloc,
    'MVC\nArchitecture': AppConstants.mvc,
    'Data Structures\n& Algorithms': AppConstants.dsa,
    'Multi-Domain\nProgramming': AppConstants.mdp,
    'Machine\nLearning': AppConstants.ml,
  };
}
