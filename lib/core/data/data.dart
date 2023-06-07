import 'package:portfolio/core/data/model.dart';

class Data {
  static List<String> navItems = [
    'Home',
    'About',
    'Experience',
    'Education',
    'Projects',
    'Certifications',
  ];

  static List<Model> highlights = [
    Model(
      id: '8',
      name: 'Practice Buzz',
      role: 'Software Developer Engineer',
      location: 'Sector 48D, Chandigarh',
      from: DateTime(2023, DateTime.june),
      to: DateTime(2024, DateTime.june),
      description: [
        'Fetching data using Wordpress API.',
        'Integrating CRM using ZOHO.',
        'QnA forum integration with discourse.',
      ],
      link: '',
      skills: [
        'Flutter',
        'MVC',
        'UI/UX',
        'Git',
        'GetX',
      ],
      linkName: 'Certificate',
    ),
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
      to: DateTime(2024, DateTime.june),
      description: [
        'Fetching data using Wordpress API.',
        'Integrating CRM using ZOHO.',
        'QnA forum integration with discourse.',
      ],
      link: '',
      skills: [
        'Flutter',
        'MVC',
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
        'Implemented UI/UX designs and Animations.',
        'Implemented APIs for Authentication and Data transfer.',
        'Developed a choice-based role-playing mobile game.',
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
        'Developed game using flutter flame engine.',
        'Implemented Authentication and Data APIs.',
        'Wrote efficient, reusable, and reliable code.',
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
        'Used GetX library for state management.',
        'Developed a B2C mobile app from scratch integrated with Firebase.',
        'Implemented caching using Hive to improve performance by 30% .',
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
        'Implemented wireframe UI designs to working code.',
        'Integrated caching mechanism to increase performance by 20%.',
        'Implemented search and create API using REST-full services.',
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
        'Developed whatsapp auto responder app.',
        'Integrated Firebase for retrieving data.',
        'Integrated android native services.',
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
        'Implemented local storage using Room Database to store temporary contact details.',
        'Employed JUnit framework to perform unit tests.',
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
        'Developed web browser app from scratch.',
        'Incorporated offline storage, performance tuning and threading into apps for seamless use.',
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
    //TODO: complete this
    Model(
      id: '1',
      name: 'Spotter',
      role: 'Flutter',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2022, DateTime.november),
      to: DateTime(2023, DateTime.february),
      description: [
       '',
      ],
      link: '',
      skills: [
        'Flutter',
        'Firebase',
        'Google Cloud',
      ],
      linkName: 'Certificate',
    ),
  ];

  static List<Model> education = [
    Model(
      id: '2',
      name: 'Indus University',
      role: 'B.Tech. CSE',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2019, DateTime.august),
      to: DateTime(2023, DateTime.april),
      description: [
        'Secured 9.6 CGPA.',
        'Held position of responsibility on multiple occasions.',
        'Winner in multiple national level hackathons.'
      ],
      link: '',
      skills: [
        'Software Development',
        'Team Management',
        'Leadership',
      ],
      linkName: 'Certificate',
    ),
    Model(
      id: '1',
      name: 'Delhi Public School Bopal',
      role: 'Science\n10th - 12th',
      location: 'Ahmedabad, Gujarat',
      from: DateTime(2016, DateTime.april),
      to: DateTime(2019, DateTime.april),
      description: [
        'Secured 8.6 CGPA.',
        'Involved in Robotics Club, Research and Development Club, Science Fests, and Coding Competitions.',
        'Explored new technologies through the Research and Development Club.'
      ],
      link: '',
      skills: [],
      linkName: 'Certificate',
    ),
  ];

  static List<Model> certifications = [
    //TODO: Complete this
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
        'Supervised team of 30 students.',
        'Organized over 80+ cultural and technical events.',
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
        'Organized study sessions to teach over 40 students.',
        'Developed a basic app.',
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
        'Won multiple national hackathons.',
        'Collaborated and led team of 3-5 students.',
      ],
      link: '',
      skills: [
        'Team Management',
        'Co-ordination',
      ],
      linkName: 'Certificate',
    ),
  ];

  static List<String> software = [
    'Flutter',
    'Dart',
    'JAVA',
    'Python',
    'Firebase',
    'SQL',
    'Git',
    'Kotlin',
    'JavaScript',
    'C/C++',
    'AWS',
  ];

  static List<String> softSkills = [
    'Team Leadership',
    'Project Coordination',
    'Project Management',
    'Communication',
    'Analytical & Critical thinking',
  ];

  static List<String> projectSkills = [
    'Agile Methodology',
    'MVVM Architecture',
    'MVC Architecture',
    'Multi-Domain Programming',
    'Data Structures',
    'AI/ML'
  ];
}
