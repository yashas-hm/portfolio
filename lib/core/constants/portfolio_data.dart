import 'package:portfolio/core/model/experience_model.dart';
import 'package:portfolio/core/model/project_model.dart';

class PortfolioData {
  static List<ExperienceModel> experience = [
    ExperienceModel(
      identifier: 'pb',
      role: 'Senior Software Developer',
      organization: 'PracticeBuzz',
      from: DateTime(2023, DateTime.june),
      to: DateTime(2300, DateTime.june),
      shortDescription: '🎨 Crafted captivating cross-platform Flutter apps, '
          'sprinkling them with a touch of magic to enchant users and boost '
          'engagement by 30%\n\n💻 Masterminded custom APIs with Node.js and '
          'SQL wizardry, conjuring a 40% increase in data processing speed and '
          'shaving 50ms off server response time.\n\n📢 Orchestrated a symphony'
          ' of notifications, charming users with timely alerts and enhancing '
          'engagement by 25%, keeping them spellbound and coming back for more.',
      longDescription: '',
      skills: [],
    ),
    ExperienceModel(
      identifier: 'internships',
      role: 'Developer Intern',
      organization: 'Internships',
      from: DateTime(2019, DateTime.august),
      to: DateTime(2023, DateTime.may),
      shortDescription: '🌟 Dabbled in over 7 internships, wearing hats as a '
          'software sorcerer, Flutter magician, game genie, and Android '
          'alchemist.\n\n🧙‍♂️ Delivered projects with wizard-like efficiency, '
          'waving my wand to ensure on-time completion and submission with '
          'fewer bugs than a spellbound forest.',
      longDescription: '',
      skills: [],
    )
  ];

  static List<ProjectModel> projects = [
    ProjectModel(
      identifier: 'dentavacation',
      name: 'DentaVacation',
      shortDescription: 'Innovative Flutter app revolutionizing dental care.',
      longDescription: '',
      link: 'https://app.dentavacation.com',
      image: 'https://yashashm.sirv.com/portfolio/dentavacation.png',
      skills: [
        'Flutter',
        'Node.js',
        'Express.js',
        'SQL',
        'Python',
        'Cloud',
      ],
    ),
    ProjectModel(
      identifier: 'spotter',
      name: 'Spotter: Find your Spot!',
      shortDescription: 'Tailored spot suggestions, discounts and community.',
      longDescription: '',
      link: 'https://github.com/spotter-find-your-spot/spotter',
      image: 'https://yashashm.sirv.com/portfolio/spotter.png',
      skills: [
        'Flutter',
        'Firebase',
        'Maps SDK',
      ],
    ),
    ProjectModel(
      identifier: 'asl',
      name: 'ASL Gesture Detection',
      shortDescription:
          'Machine Learning model that converts ASL Gestures to text.',
      longDescription: '',
      link: 'https://github.com/yashas-hm/ASL-Gesture-Sensing',
      image: 'https://cdn.yashashm.dev/portfolio/asl.png',
      skills: [
        'Python',
        'TensorFlow',
        'MediaPipe',
      ],
      codeAvailable: true,
    ),
  ];
}
