import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/model/model.dart';

class Data {
  static const String smallAbout =
      '👨🏻‍💻 Experienced developer extraordinaire '
      'here! 💼 With a knack for crafting robust solutions and coding wizardry,'
      ' I\'m your go-to guy for turning ideas into reality. 🛠️ With a proven '
      'track record of success in diverse projects, I thrive on challenges and '
      'constantly seek opportunities to innovate and push boundaries. 🧙🏻‍♂️ My '
      'dedication to excellence, coupled with a passion for learning and growth'
      ', allows me to adapt swiftly to new technologies and deliver exceptional'
      ' results. 🌟 I\'m committed to leveraging my skills and experience to'
      ' drive meaningful impact and contribute to the success of every project'
      ' I undertake. 🚀 Let\'s collaborate and create something truly magical'
      ' together! ✨';

  static const String about =
      "🚀 I'm the Maestro of Code at <b>Practice Buzz!</b><br><br>"
      "🌐 As a Software Sorcerer, I craft enchanting cross-platform apps that dance seamlessly between devices using <b>Flutter</b> and <b>Dart</b>. I don't just build apps; I craft experiences that users won't forget.<br><br>🎨 Frontend arts are not lost on me. <b>HTML</b>, <b>CSS</b>, <b>Javascript</b>, <b>React</b> are my brushes, turning screens into canvases that tell compelling tales.<br><br>"
      "💻 In the backend battlegrounds, I wield the mighty <b>Node</b> and <b>Express</b>, sculpting APIs that are more robust than a fortress, backed by the formidable powers of <b>PostgreSQL</b> or the nimble <b>MongoDB</b>. With the wisdom of cloud giants, I effortlessly navigate the realms of <b>AWS</b>, <b>Firebase</b>, and <b>Google Cloud</b>, crafting digital ecosystems that transcend ordinary boundaries.<br><br>"
      "🐳 <b>Docker</b> is my magic potion, encapsulating my innovations into digital time capsules. When chaos reigns, I summon the <b>Kubernetes</b> forces, orchestrating containers like a symphony conductor.<br><br>"
      "🏗️ DevOps is my realm; CI/CD is my anthem. <b>Git workflows</b>, <b>Jenkins</b>, and the rhythmic beats of version control with <b>Git</b> and the automated enchantments of <b>Ansible</b> as my trusty steeds, ensuring each line of code dances flawlessly from creation to deployment.<br><br>"
      "🌐 Stepping into the collaborative cosmos, I am fluent in the languages of collaboration platforms — <b>Jira</b>, <b>Trello</b>, and <b>Slack</b>. I orchestrate seamless teamwork, ensuring that communication flows like a well-rehearsed melody.<br><br>"
      "🎓 Armed with a <b>Bachelor's in Computer Science Engineering</b> from Indus University Ahmedabad, I don't just study code; I sculpt it into winning solutions, conquering hackathons and competitions with flair.<br><br>"
      "💻 From the elegance of Java to the versatility of <b>Python</b>, the dynamism of <b>Java</b> to the power of <b>C++</b>, every coding language, including the rhythmic <b>Bash</b>, is a note in my symphony. <b>GitHub</b> and <b>GitLab</b> are my arenas, where repositories thrive like digital ecosystems.<br><br>"
      "💡 I don't just write code; I build innovative solutions that push the boundaries of what's possible. Join me on this journey, where every line of code is a stroke of genius! ⚡️";

  static List<String> navItems = [
    'Home',
    'About Me',
    'Experience',
    'Projects',
    'Contact Me'
    // 'Certifications',
  ];

  static Map<String, Map<String, String>> homeSkills = {
    'Front-End': {
      'Flutter': AppConstants.flutter,
      'React': AppConstants.react,
      'HTML': AppConstants.html,
      'CSS': AppConstants.css,
    },
    'Back-End': {
      'Node.js': AppConstants.nodeJs,
      'Express.js': AppConstants.expressJs,
      'NGINX': AppConstants.nginx,
      'GraphQL': AppConstants.graphQl,
    },
    'Database': {
      'Firebase': AppConstants.firebase,
      'MySQL': AppConstants.mysql,
      'PostgreSQL': AppConstants.psql,
      'MongoDb': AppConstants.mongoDb,
    },
    'DevOps': {
      'Git': AppConstants.git,
      'Docker': AppConstants.docker,
      'Kubernetes': AppConstants.kubernetes,
      'Jenkins': AppConstants.jenkins,
      // 'Ansible': AppConstants.ansible,
      'Actions': AppConstants.githubActions,
      // 'Prometheus': AppConstants.prometheus,
    },
    'Languages': {
      'Dart': AppConstants.dart,
      'Python': AppConstants.python,
      'JAVA': AppConstants.java,
      'JavaScript': AppConstants.js,
      'TypeScript': AppConstants.typescript,
      'Bash': AppConstants.bash,
      'C++': AppConstants.cpp,
      'Rust': AppConstants.rust,
    },
    'Machine Learning': {
      'NumPy': AppConstants.numPy,
      'OpenCV': AppConstants.opencv,
      'TensorFlow': AppConstants.tensorFlow,
      'Pandas': AppConstants.pd,
    },
    'Others': {
      'GCP': AppConstants.gcp,
      'AWS': AppConstants.aws,
      'Jira': AppConstants.jira,
      'Slack': AppConstants.slack,
    },
    'IoT': {
      'Arduino': AppConstants.arduino,
      'RaspberryPi': AppConstants.raspberryPi,
      'ESP32': '',
    }
  };

  static List<Map<String, String>> logoSkill = [
    {
      'Flutter': AppConstants.flutter,
      'Dart': AppConstants.dart,
      'Python': AppConstants.python,
      'JAVA': AppConstants.java,
      'JavaScript': AppConstants.js,
      'Git': AppConstants.git,
      'Bash': AppConstants.bash,
      'C++': AppConstants.cpp,
    },
    {
      'PostgreSQL': AppConstants.psql,
      'Firebase': AppConstants.firebase,
      'GCP': AppConstants.gcp,
      'AWS': AppConstants.aws,
      'Docker': AppConstants.docker,
      'Kubernetes': AppConstants.kubernetes,
      'Jenkins': AppConstants.jenkins,
    },
    {
      'HTML': AppConstants.html,
      'CSS': AppConstants.css,
      'React': AppConstants.react,
      'NumPy': AppConstants.numPy,
      'OpenCV': AppConstants.opencv,
      'TensorFlow': AppConstants.tensorFlow,
      'Pandas': AppConstants.pd,
      'Jira': AppConstants.jira,
      'Slack': AppConstants.slack,
    },
  ];


  static List<Model> testimonial = [
    Model(
      id: '0',
      role: 'CEO, PracticeBuzz',
      name: 'Deepak Datta',
      location: 'Remote',
      from: DateTime(2023, DateTime.june),
      to: DateTime(2300, DateTime.june),
      description: [
       'Yashas\'s contributions as a Senior Software Engineer at PracticeBuzz '
           'are outstanding. His role in developing the DentaVacation app '
           'showcased technical prowess, innovative design, and a commitment to'
           ' security. His adaptability, collaboration, and pursuit of '
           'excellence are commendable.'
      ],
      link: '',
      skills: [],
      linkName: '',
    ),
    Model(
      id: '1',
      role: 'Director, EcoConsumer Solutions Pvt. Ltd.',
      name: 'Manjunath Jakkur Munigowda',
      location: 'Remote',
      from: DateTime(2023, DateTime.june),
      to: DateTime(2300, DateTime.june),
      description: [
        'Yashas\'s time as a Flutter Developer Intern was marked by exceptional'
            ' skill and dedication. His problem-solving abilities and '
            'innovative solutions significantly enhanced our mobile app '
            'development. His commitment to excellence, coupled with his '
            'teamwork and communication skills, made him an invaluable asset. '
            'I highly recommend him for any role requiring a skilled software '
            'developer.'
      ],
      link: '',
      skills: [],
      linkName: '',
    ),

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
        '<b>Cross-Platform Clinic Collaboration Apps</b>: Developed and launched multiple user-friendly cross-platform apps showcasing clinic collaborations, driving a significant 30% increase in patient appointments 📱💡.',
        '<b>Secure Multi-Platform Authentication</b>: Engineered a secure authentication system with email, Google, Apple, and Facebook login options, contributing to a substantial 20% boost in user sign-ups while ensuring data integrity and user privacy 🔐👤.',
        '<b>Effective Notification System</b>: Designed and integrated a notification system, resulting in a noteworthy 20% increase in user engagement, enhancing the app\'s interaction and retention capabilities 📬📈.',
        '<b>Seamless Payments Interface</b>: Developed a seamless payments interface for the website, yielding a 15% increase in online sales within the first month of implementation. Streamlined the user experience and contributed to improved conversion rates 💳💻.',
        '<b>Custom API and Database Management</b>: Developed and maintained a custom API and Database using Node.js and Express.js, leading to a remarkable 40% improvement in data processing efficiency and a 50ms reduction in server response time ⚙️💽.',
        '<b>Efficient Content Management System</b>: Engineered and deployed a content management system facilitating seamless modification of app content via Excel, leading to a 50% reduction in the time required for updates, enhancing efficiency and agility 🖥️🔄.',
        '<b>BLoC Architecture and Agile Methodology</b>: Employed BLoC Architecture in conjunction with the Agile methodology to craft the application, ensuring a modular and efficient development process 🏗️🔄.',
      ],
      link: '',
      skills: [
        'Flutter',
        'Node.js',
        'JavaScript',
        'Git',
        'Python',
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
        '<b>Optimized Download Process</b>: Implemented a parallel downloading method and file compression technique, culminating in a substantial 50% reduction in download time for application users. Enhanced user experience through efficient data acquisition 🚀⏬.',
        '<b>Innovative UI/UX Integration</b>: Collaborated with UI/UX designers to seamlessly integrate innovative designs and animations into the application. The result: a noteworthy 30% increase in user engagement, enhancing the visual appeal and interactivity of the app 🎨📈.',
        '<b>Secure API Implementation</b>: Instrumented secure APIs for authentication and data transfer, ensuring a seamless and protected user experience for a substantial user base of 1000+ daily active users. Prioritized data security and user privacy 🔐🌐.',
      ],
      link:
          'https://drive.google.com/file/d/1RFNNyXiYk-s_6IiD4LcPcwW0X52y2gPj/view?usp=sharing',
      skills: [
        'Flutter',
        'Node.js',
        'UI/UX',
        'Git',
      ],
      linkName: 'Certificate',
    ),
    Model(
      id: '6',
      name: 'Grahnumb',
      role: 'Flutter Developer Intern',
      location: 'Bengaluru, Karnataka',
      from: DateTime(2023, DateTime.february),
      to: DateTime(2022, DateTime.march),
      description: [
        '<b>Flutter Flame Game Development</b>: Developed a highly interactive and visually stunning game utilizing the Flutter Flame engine, contributing to a substantial 20% increase in user engagement. Elevated the gaming experience through immersive visuals and interactivity 🎮🚀.',
        '<b>Secure Authentication and Data APIs</b>: Implemented secure authentication and data APIs, prioritizing user privacy and safeguarding sensitive information. Achieved an impressive error rate of less than 3%, ensuring a protected and trustworthy user experience 🔐🌐.',
        '<b>Efficient Code Optimization</b>: Wrote efficient, reusable, and reliable code that reduced loading times by 30%, resulting in a smoother gameplay experience for users. Prioritized code optimization for enhanced performance and user satisfaction ⚙️🕹️.',
      ],
      link: '',
      skills: [
        'Flutter',
        'Flame Game Engine',
        'Firebase',
        'Git',
      ],
      linkName: 'Certificate',
    ),
    Model(
      id: '5',
      name: 'EcoConsumers Solutions Pvt. Ltd.',
      role: 'Flutter Developer Intern',
      location: 'Bengaluru, Karnataka',
      from: DateTime(2022, DateTime.june),
      to: DateTime(2022, DateTime.september),
      description: [
        '<b>GetX Library for State Management</b>: Utilized the GetX library for state management, leading to enhanced app responsiveness and a significant 20% reduction in development time. Streamlined the development process for improved efficiency ⚙️🔄.',
        '<b>B2C Mobile App Development</b>: Developed a B2C mobile app from scratch, seamlessly integrating it with Firebase for real-time data synchronization. Achieved an impressive 40% increase in user engagement by providing up-to-date and dynamic content 📱🔗.',
        '<b>Caching with Hive Library</b>: Implemented caching using the Hive library, resulting in a substantial 30% improvement in app performance. Additionally, reduced server requests by 50%, optimizing data retrieval and enhancing overall user experience 🚀📊.',
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
      location: 'Bengaluru, Karnataka',
      from: DateTime(2021, DateTime.may),
      to: DateTime(2021, DateTime.june),
      description: [
        '<b>Wireframe to Functional Code</b>: Transformed wireframe UI designs into fully functional code, creating a seamless user experience. Achieved a notable 15% increase in user engagement through the implementation of intuitive and responsive interfaces 🎨💻.',
        '<b>Performance Enhancement with Caching</b>: Integrated a caching mechanism to enhance performance, resulting in a significant 20% decrease in loading time for game assets. Optimized asset retrieval for a smoother gaming experience 🕹️⚙️.',
        '<b>Search and Create API Implementation</b>: Developed and implemented a search and create API using RESTful services, streamlining game development and reducing development time by an impressive 30%. Improved efficiency in managing game-related data and processes 🚀🔍.',
      ],
      link:
          'https://drive.google.com/file/d/1J3EJwXQuUSfXE0fDU3I-9rGOWG_vgjBq/view?usp=sharing',
      skills: [
        'Android',
        'REST API',
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
        '<b>Efficient WhatsApp Auto Responder</b>: Developed a highly efficient WhatsApp auto-responder app achieving an impressive 95% response rate. Elevated user engagement and satisfaction through timely and automated responses 📱💬.',
        '<b>Firebase Integration for Real-time Data</b>: Integrated Firebase into the app, enabling seamless and real-time data retrieval. Achieved a significant 50% reduction in response time for retrieving user data, enhancing overall app efficiency 🚀🔗.',
        '<b>Android Native Services Integration</b>: Successfully integrated Android native services, optimizing performance and reducing battery consumption by 30%. Resulted in a substantial improvement in user experience through efficient resource utilization ⚙️🔋.'
      ],
      link:
          'https://drive.google.com/file/d/1Hfnk4zyjt7dTzV7uBlwInk2hcegx8DZn/view?usp=sharing',
      skills: [
        'Android',
        'REST API',
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
        '<b>Local Storage with Room Database</b>: Implemented local storage functionality using Room Database, achieving a notable 30% reduction in data retrieval time. Enhanced the app\'s efficiency in handling and accessing stored data 🗄️📉.',
        '<b>Thorough Unit Testing with JUnit</b>: Executed thorough unit tests using the JUnit framework, ensuring the reliability and stability of the application. Achieved an extensive test coverage of 95%, validating the robustness of the implemented features and functionalities 🧪🔍.',
      ],
      link:
          'https://drive.google.com/file/d/1SS-dw_wDisPR9Ul9vU1FOoiFv8za_pOP/view?usp=sharing',
      skills: [
        'Android',
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
        '<b>Web Browser App</b>: Spearheaded development of a web browser app using Java, achieving over 100,000 downloads and a commendable 4-star rating on the Google Play Store. Demonstrated both popularity and user satisfaction 🌐📲⭐.',
        '<b>Offline Storage Integration</b>: Integrated offline storage capabilities into the app, enabling users to access their browsing history without an internet connection. Enhanced user convenience and accessibility 🗃️📶.',
        '<b>Performance Optimization with Threading</b>: Optimized performance by implementing threading techniques, resulting in an impressive 50% decrease in app loading time. Elevated the app\'s responsiveness and overall user experience 🚀⏱️.',
      ],
      link:
          'https://drive.google.com/file/d/1clY8oQyuHSyzHJ3BuA8Tgc0d4AP2Kxe9/view?usp=sharing',
      skills: [
        'Android',
        'Room',
        'Python',
      ],
      linkName: 'Certificate',
    ),
  ];

  static List<Model> projects = [
    Model(
      id: '11',
      role: 'DentaVacation',
      name: 'Med Tourism Co.',
      location: 'Navi Mumbai, Maharashtra',
      from: DateTime(2023, DateTime.june),
      to: DateTime(2024, DateTime.january),
      description: [
        '<b>DentaVacation Flutter App</b>: Crafted a dynamic app using Flutter, named DentaVacation, seamlessly offering clinics, discounts, and engaging blogs based on user location 🦷🌍.',
        '<b>Interactive Learning Quizzes and Videos</b>: Integrated fun quizzes and instructional videos to enlighten users about proper dental habits, combining education with user engagement 📚🎥.',
        '<b>Zoho Chat Integration</b>: Facilitated real-time communication by integrating Zoho Chat, enabling users to connect with sales agents directly from the app for personalized assistance 💬🤝.',
        '<b>Habit Tracker and Notification System</b>: Implemented a habit tracker to promote dental care, notifying users about frequent habits. A proactive approach to oral health through timely reminders ⏰🦷.',
        '<b>Cost Calculator Feature</b>: Incorporated a cost calculator providing users with approximate costs for dental procedures, ensuring transparency and aiding informed decision-making 💰🧮.',
        '<b>Community Forum for Interaction</b>: Established a community forum allowing users to post questions and receive answers from both peers and experts, fostering a collaborative environment for shared insights and support 🤔💬.',
        '<b>Secure Custom APIs and Database</b>: Developed secure custom APIs using Node.js and Express, backed by a robust database to ensure data integrity and privacy 🔒💽.',
        '<b>Dynamic Text Updates</b>: Engineered a system for real-time text updates within the app, allowing for seamless content updates without the need for frequent app updates, ensuring a continuously fresh user experience 🔄📲.',
      ],
      link: 'https://github.com/spotter-find-your-spot/spotter',
      skills: [
        'Flutter',
        'Node.js',
        'SQL',
        'Python',
        'CMS',
      ],
      linkName: AppConstants.flutter,
    ),
    Model(
      id: '10',
      role: 'Spotter',
      name: 'Spotter Inc.',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2022, DateTime.november),
      to: DateTime(2023, DateTime.february),
      description: [
        '<b>Led development of Spotter</b>: Spearheaded the creation of Spotter, a social media app leveraging advanced algorithms for personalized location suggestions 🌐.',
        '<b>Community Engagement and Artistic Connection</b>: Fostered a sense of belonging by connecting local artists through Spotter, promoting their work and encouraging users to share favorite spots 🎨.',
        '<b>BLoC Architecture Implementation</b>: Implemented the BLoC architecture in Spotter, fortifying the app with a modular structure for enhanced code organization, re-usability, and maintainability 🏗️.',
        '<b>Integration of Cutting-Edge Technologies</b>: Integrated Firebase for streamlined data management, harnessed Google Maps API for precise geolocation, and leveraged Google Cloud for robust backend support in Spotter\'s development ⚙️.',
        '<b>Strategic Image Compression</b>: Implemented image compression techniques to intelligently reduce database storage, optimizing resource utilization and enhancing overall database efficiency. 🖼️📉',
        '<b>Efficient Storage Management</b>: Through image compression, successfully minimized storage requirements, ensuring a streamlined and cost-effective approach to database management. Improved data retrieval speed and reduced bandwidth usage. 🚀💽',
      ],
      link: 'https://github.com/spotter-find-your-spot/spotter',
      skills: [
        'Flutter',
        'Node.js',
        'GCP',
        'Python',
        'Google Maps SDK',
      ],
      linkName: AppConstants.flutter,
    ),
    Model(
      id: '9',
      role: 'PraTvi',
      name: 'Flutter',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2022, DateTime.november),
      to: DateTime(2022, DateTime.december),
      description: [
        '<b>Feature-Rich Wedding Logistics App</b>: Engineered a comprehensive wedding logistics app with a Firebase backend, providing real-time functionalities including check-in, bus status updates, room allocation, and personalized itineraries. Showcased expertise in mobile app development and seamless cloud integration. 📱💼',
        '<b>User-Centric Event Coordination</b>: Ensured a seamless user experience by incorporating driver contact details, demonstrating a user-centered approach. Applied problem-solving skills to create a comprehensive solution that enhances event coordination, contributing to a flawless wedding experience. 🤝🎉',
      ],
      link: 'https://github.com/yashas-hm/PRATVI',
      skills: [
        'Flutter',
        'Firebase',
        'CI/CD',
      ],
      linkName: AppConstants.flutter,
    ),
    Model(
      id: '7',
      role: 'Cheque Scanner',
      name: 'Android',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2021, DateTime.march),
      to: DateTime(2021, DateTime.april),
      description: [
        '<b>OCR Integration for Cheque Details</b>: Pioneered the integration of Optical Character Recognition (OCR) technology to seamlessly detect and automatically populate cheque details. Expertly utilized OCR capabilities to optimize user input, reducing errors and enhancing efficiency in financial transactions. 📊💳',
        '<b>Firebase ML Kit for Machine Learning</b>: Employed Firebase ML Kit to implement sophisticated machine learning functionalities, enabling accurate text recognition and efficient data extraction within the application. Demonstrated adeptness in harnessing cutting-edge tools to enhance user experiences through advanced machine learning features. 🧠🚀',
      ],
      link: 'https://github.com/yashas-hm/Cheque-Scanner',
      skills: [
        'Android',
        'AI/ML',
        'Firebase ML Kit',
      ],
      linkName: '',
    ),
    Model(
      id: '6',
      role: 'ASL Gesture\nSensing',
      name: 'AI/ML',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2021, DateTime.june),
      to: DateTime(2021, DateTime.july),
      description: [
        '<b>Advanced ASL Gesture Recognition Model</b>: Developed an advanced Machine Learning model proficient in accurately recognizing and interpreting American Sign Language (ASL) gestures, showcasing expertise in computer vision and language understanding. 🤖👐',
        '<b>Holistic Gesture Recognition Approach</b>: Engineered a holistic approach to gesture recognition, considering complete ASL gestures within the model\'s predictions. Demonstrated a comprehensive understanding of gesture dynamics, significantly enhancing communication accessibility for users. 🌐✨',
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
      role: 'Space Invaders\nGame',
      name: 'JAVA',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2022, DateTime.january),
      to: DateTime(2022, DateTime.january),
      description: [
        '<b>JavaFX Game</b>: Utilized JavaFX to reimagine a well-known game, showcasing creativity and technical prowess in game development. Skillfully employed JavaFX\'s rich graphical capabilities to recreate a captivating and visually appealing gaming experience, highlighting expertise in Java-based user interfaces. 🎮🖥️',
        '<b>Engaging Gameplay Design</b>: Crafted an engaging gameplay experience by leveraging multiple sprites and controllers within the game. Implemented intricate interactions between elements, enhancing user immersion and participation. Demonstrated a deep understanding of game mechanics and user engagement principles. 🕹️🎨',
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
      role: 'Direct Message',
      name: 'Flutter',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2021, DateTime.march),
      to: DateTime(2021, DateTime.april),
      description: [
        '<b>User-Centric WhatsApp Access Feature</b>: Developed a user-centric feature enabling seamless access to WhatsApp chat screens without saving contact numbers. Implemented an intuitive pathway to simplify communication processes, showcasing mobile application development skills and enhancing user engagement. 📱💬',
        '<b>Google Play Store Deployment</b>: Successfully launched the application on the Google Play Store, demonstrating technical proficiency in the entire app deployment lifecycle. Managed the app\'s submission, publication, and updates, ensuring a consistent and reliable user experience for a broader audience. 🚀📊',
      ],
      link: 'https://github.com/yashas-hm/Direct-Message',
      skills: [
        'Flutter',
      ],
      linkName: AppConstants.flutter,
    ),
    Model(
      id: '3',
      role: 'Foodie',
      name: 'Android',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2020, DateTime.april),
      to: DateTime(2020, DateTime.may),
      description: [
        '<b>Efficient Food Ordering App</b>: Designed and developed a user-friendly mobile application for efficient food ordering, implementing features for easy cart management, organization of selections, and user-friendly search functionalities. Leveraged mobile application development expertise to ensure a seamless and intuitive user experience. 📱🍔',
        '<b>REST API Integration</b>: Integrated the app with a robust REST API for real-time food item data management. Effectively communicated with external data sources, optimizing data retrieval, and ensuring accurate menu representation within the application. Demonstrated proficiency in API integration techniques. 🔄🌐',
      ],
      link: 'https://github.com/yashas-hm/Foodie',
      skills: [
        'Android',
        'REST API',
      ],
      linkName: '',
    ),
    Model(
      id: '2',
      role: 'MIDI Drum Set',
      name: 'IoT',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2019, DateTime.november),
      to: DateTime(2020, DateTime.january),
      description: [
        '<b>Cutting-Edge MIDI Drum Set</b>: Developed a cutting-edge MIDI drum set, seamlessly interfacing with laptops to accurately replicate the dynamics and feel of a real drum kit. Leveraged expertise in mobile application development and AI to create a user-friendly and responsive virtual drumming experience. 🥁🔌',
        '<b>Innovative Foam-Based Drum Pads</b>: Engineered innovative foam-based drum pads with precision piezo sensors for intricate tap detection, translating user input into expressive MIDI signals. Employed software development skills to optimize sensor integration, enhancing the realism of the drumming experience. 🎵🛠️',
      ],
      link: 'https://www.instructables.com/id/Arduino-MIDI-Drums/',
      skills: [
        'IoT',
        'Arduino',
      ],
      linkName: AppConstants.arduino,
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
      '<b>2nd Prize, Nirma Duet Singing Competition 2019</b>: Harmonized melodies to secure 2nd place, showcasing vocal finesse and musical prowess in a competitive setting 🎤🥈.',
      '<b>1st Prize, Parul University E-Cultural Fest 2020</b>: Clinched 1st prize, delivering a captivating musical performance, adding vibrancy to the cultural celebration 🎶🏆.',
      '<b>3rd Prize, Nirma University Western Singing Competition 2023</b>: Achieved 3rd place, demonstrating continued musical excellence and versatility in the Western Singing domain 🎵🥉.',
      '<b>Stage Performances</b>: Enthralling audiences with multiple on-stage appearances, showcased a dynamic and engaging musical presence in front of large crowds 🌟🎤.',
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
      '<b>Smart India Hackathon Finalist 2022</b>: Recognized as a Finalist, developed a Fake News Detection AI Website & API, showcasing expertise in combating misinformation and advancing technology for societal benefit 🏅🤖.',
      '<b>1st Prize in Nirma University Hackathon 2022</b>: Achieved 1st Prize, developed an American Sign Language gesture detector using open Computer Vision, showcasing commitment to accessibility and inclusive technology 🏆👐.',
      '<b>1st Prize in Nirma University Hackathon 2021</b>: Secured 1st Prize, developed a Cheque Scanner OCR Mobile App, demonstrating innovative mobile technology solutions and excellence in application development 🥇📱.',
      '<b>1st Prize in Parul University Hackathon 2020</b>: Secured 1st Prize in a National Level Hackathon, demonstrating consistent excellence in problem-solving and technological innovation 🏆🚀.',
      '<b>1st Prize in Indus University Hackathon 2019</b>: Attained 1st Prize, developed an IoT MR smart-glass, showcasing proficiency in merging IoT and Mixed Reality for cutting-edge solutions 🥇🔍.',
      '<b>2nd Prize in Student Startup and Innovation Program 2019</b>: Recognized with the 2nd Prize, awarded by the CM of Gujarat, for entrepreneurial endeavors and innovative contributions to the startup ecosystem 🌐💡.',
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
        'Masterminded dynamic student events with precision and foresight, prioritizing efficiency and strategic planning 🌟🚀\n\n'
            'Led and energized a 30-strong student team, ensuring flawless execution of 80+ events. Skillfully orchestrated efforts for seamless event delivery 🤝📅'
      ],
      link:
          'https://drive.google.com/file/d/1rbEq5ahFdvNMz8SgbFBlLj3pTqU7uaUv/view?usp=sharing',
      skills: [
        'Team Management',
        'Event Management',
        'Event Organizing',
        'Team Co-Ordination',
        'Communication',
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
        'Orchestrated three impactful events, resulting in a 25% rise in Android development proficiency and a 20% increase in knowledge-sharing interactions 👩‍💻🌐\n\n',
        'Drove a 30% surge in student engagement in tech learning initiatives, setting new standards for educational excellence 🚀📚'
      ],
      link:
          'https://drive.google.com/file/d/1OBGCxoIyuJVbMIgdjEnYOI1qzXVo8Fy0/view?usp=sharing',
      skills: [
        'Teaching',
        'Communication',
        'Public Speaking',
      ],
      linkName: 'Certificate',
    ),
    Model(
      id: '1',
      name: 'Hackathons & Internships',
      role: 'Team Lead',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2019, DateTime.august),
      to: DateTime(2023, DateTime.april),
      description: [
        'Executed projects with a 95% on-time delivery rate and a 40% reduction in bugs, highlighting adept project management skills and proactive problem-solving under pressure 🚀🛠️\n\n',
        'Led teams to victory in multiple National Level Hackathons, achieving a 90% success rate as Team Lead 🏆👩‍💻'
      ],
      link: '',
      skills: [
        'Team Management',
        'Team Co-ordination',
        'Presentation',
        'Communication',
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
    'Multi-Domain\nProgramming': AppConstants.multiDomainProgramming,
    'Machine\nLearning': AppConstants.machineLearning,
  };
}
