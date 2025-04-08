import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/model/achievement_model.dart';
import 'package:portfolio/core/model/experience_model.dart';
import 'package:portfolio/core/model/project_model.dart';
import 'package:portfolio/core/model/testimonial_model.dart';

const String linkedinLink = 'https://www.linkedin.com/in/yashashm';

const String emailId = 'yashashm.dev@gmail.com';

const String instaLink = 'https://www.instagram.com/yashas_hm';

const String githubLink = 'https://github.com/yashas-hm';

const String resumeLink =
    'https://drive.google.com/file/d/1AQldheq0E2W0l3Cr8N2LkstXBG5Hf2U_/view?usp=sharing';

const String aboutBrief = '👨🏻‍💻 Full Stack Software Developer & Digital '
    'Craftsman at your service! 🚀 From crafting elegant user interfaces to '
    'engineering rock-solid backend systems, I bring end-to-end software '
    'solutions to life. 🛠️ Whether it\'s cross-platform mobile apps with '
    'Flutter, intelligent web platforms powered by Node.js and FastAPI, or '
    'AI-enhanced tools using Python and LangChain ; I thrive on building '
    'impactful, scalable, and future-ready software. 💡 Skilled in Dart, '
    'JavaScript, TypeScript, Python, Java, and more, I tackle every challenge '
    'with precision and creativity. Databases? From PostgreSQL to ChromaDB, I '
    'navigate data like a pro. ☁️ And with tools like Docker, Kubernetes, and '
    'GitHub Actions, I keep the DevOps engine running smoothly. ⚙️ Driven by '
    'curiosity, a love for clean code, and the desire to make a real impact, '
    'I’m here to turn bold ideas into brilliant reality. ✨ Let\'s collaborate'
    ' and create something truly magical';

const String about =
    "🚀 I'm the Conductor of Code and Innovation in the digital symphony!<br><br>"
    "🌐 As a Full Stack Virtuoso, I wield both the frontend finesse and backend brilliance to create experiences that are as seamless as they are stunning. With <b>Flutter</b>, I craft cross-platform mobile marvels, while <b>JavaScript</b>, <b>TypeScript</b>, and <b>Dart</b> are my go-to tools to orchestrate interactive and immersive UIs.<br><br>"
    "🎨 Whether it's bringing ideas to life with pixel-perfect precision on Android or animating fluid screens using <b>Kotlin</b>, <b>Swift</b>, and <b>Flutter</b>, I turn mobile dreams into reality.<br><br>"
    "🧠 In the realm of intelligence, I delve deep into the world of <b>Machine Learning</b> and <b>AI</b>, working magic with <b>Python</b>, <b>LangChain</b>, and <b>LLMs</b> like <b>Ollama</b>. From smart assistants to insightful models, I engineer systems that think, learn, and evolve.<br><br>"
    "🛠️ My backend toolkit includes the sharp precision of <b>FastAPI</b>, the unyielding power of <b>Node.js</b> and <b>Express.js</b>, and the art of building <b>RESTful APIs</b> that power the core of powerful applications.<br><br>"
    "💾 Data is my muse — from the structured elegance of <b>PostgreSQL</b> and <b>MySQL</b>, to the agile flexibility of <b>MongoDB</b>, and the realtime realm of <b>Firebase</b>. I even venture into the vectorized frontier of <b>ChromaDB</b>, crafting solutions ready for the AI era.<br><br>"
    "🐳 <b>Docker</b> ensures my environments are portable and precise, while <b>Kubernetes</b> allows me to scale and orchestrate with elegance. My CI/CD mantra flows through <b>GitHub Actions</b>, driving automation that brings code to life instantly.<br><br>"
    "🌩️ In the clouds, I soar through <b>AWS</b> and <b>GCP</b>, architecting robust, scalable solutions with the agility of a cloud-native artisan.<br><br>"
    "🔧 With <b>Git</b> as my trusty sidekick, version control is second nature, while collaboration tools like <b>Jira</b> keep my missions clear and collaborative.<br><br>"
    "💡 From scripting with <b>Bash</b> to engineering with <b>C/C++</b>, from the clarity of <b>Java</b> to the precision of <b>TypeScript</b>, every language is another string on my instrument. Each project is a performance, and every line of code is a note in my digital symphony.<br><br>"
    "🔥 I don’t just build software — I shape experiences, engineer intelligence, and lead with innovation. Join me on this epic coding quest, where technology meets artistry!";

const List<String> navItems = [
  'Home',
  'About Me',
  'Experience',
  'Projects',
  'Contact Me',
  'Resume',
  'AskYashas',
];

const List<String> colorOverrideOnTag = [
  'Express.js',
  'Actions',
  'LangChain',
  'Ollama'
];

const Map<String, Map<String, String>> skills = {
  'Languages': {
    'Dart': dart,
    'Python': python,
    'JAVA': java,
    'JavaScript': js,
    'TypeScript': typescript,
    'Bash': bash,
    'C++': cpp,
    // 'Rust': rust,
  },
  'Front-End': {
    'Flutter': flutter,
    'React': react,
    'HTML': html,
    'CSS': css,
  },
  'Back-End': {
    'FastAPI': fastapi,
    'Node.js': nodeJs,
    'Express.js': expressJs,
    'NGINX': nginx,
    'GraphQL': graphQl,
  },
  'Database': {
    'Firebase': firebase,
    'Supabase': supabase,
    'MySQL': mysql,
    'PostgreSQL': psql,
    'MongoDb': mongoDb,
  },
  'DevOps': {
    'Git': git,
    'Docker': docker,
    'Kubernetes': kubernetes,
    'Actions': githubActions,
    'Jenkins': jenkins,
    // 'Ansible': ansible,
    // 'Prometheus': prometheus,
  },
  'ML/AI': {
    'Ollama': ollama,
    'HuggingFace': huggingface,
    'LangChain': langchain,
    'OpenCV': opencv,
    'TensorFlow': tensorFlow,
    'LLMs': ''
  },
  'Cloud & Tools': {
    'GCP': gcp,
    'AWS': aws,
    'Jira': jira,
    'Slack': slack,
  },
  'IoT': {
    'Arduino': arduino,
    'RaspberryPi': raspberryPi,
    'ESP32': '',
  }
};

//INFO: Experience
final List<ExperienceModel> experienceList = [
  ExperienceModel(
    identifier: 'unc-e',
    role: 'Software Developer Engineer',
    organization: 'UNC Eshleman School of Pharmacy',
    from: DateTime(2024, DateTime.november),
    to: null,
    shortDescription: '🚀 Engineered and launched a custom game engine, '
        'reducing load times by 30% and enhancing seamless gameplay 🎮.\n\n'
        '📊 Introduced analytics to track user performance, boosting training '
        'effectiveness by 25% 📈 and aiding educators with actionable insights'
        ' 🧑‍🏫✨.',
    longDescription: '',
    skills: [
      'Flutter',
      'UI/UX',
    ],
  ),
  ExperienceModel(
    identifier: 'pb',
    role: 'Senior Software Developer',
    organization: 'PracticeBuzz',
    from: DateTime(2023, DateTime.june),
    to: DateTime(2024, DateTime.july),
    shortDescription: '🎨 Crafted captivating cross-platform Flutter apps, '
        'sprinkling them with a touch of magic to enchant users and boost '
        'engagement by 30%\n\n💻 Masterminded custom APIs with Node.js and '
        'SQL wizardry, conjuring a 40% increase in data processing speed and '
        'shaving 50ms off server response time.\n\n📢 Orchestrated a symphony'
        ' of notifications, charming users with timely alerts and enhancing '
        'engagement by 25%, keeping them spellbound and coming back for more.',
    longDescription: '🚀 Successfully set up and configured a cloud server '
        'infrastructure to efficiently host APIs, ensuring seamless '
        'accessibility and performance for users worldwide.\n\n💳 Seamlessly '
        'integrated a user-friendly payments interface into the website, '
        'resulting in a significant 15% increase in online sales within the '
        'initial month of implementation.\n\n🖥️ Engineered a sophisticated '
        'content management system, empowering remote updates to the app\'s '
        'text content without the need for frequent app updates, thereby '
        'enhancing agility and adaptability.\n\n🏆 Engineered '
        'a dynamic leaderboard feature within the app, fostering healthy '
        'competition and increasing user engagement with quizzes by an '
        'impressive 25%.\n\n⚕️ Seamlessly integrated a health tracking '
        'functionality into the app, syncing user\'s health data with default'
        ' health apps, resulting in a 20% increase in user engagement and '
        'improved wellness monitoring.\n\n🔄 Implemented Python scripts and '
        'configured cronjobs to fetch user query data from web forms, '
        'converting it to Excel format for comprehensive data analysis and '
        'reporting.',
    skills: [
      'Flutter/Dart',
      'Node.js',
      'Express.js',
      'Git',
      'Bash',
      'Python',
      'GitHub Actions',
    ],
  ),
  ExperienceModel(
    identifier: 'internships',
    role: 'Software Developer',
    organization: 'Internships & Freelancing',
    from: DateTime(2019, DateTime.august),
    to: DateTime(2023, DateTime.may),
    shortDescription: '🌟 Dabbled in over 7 internships, wearing hats as a '
        'software sorcerer, Flutter magician, game genie, and Android '
        'alchemist.\n\n🧙‍♂️ Delivered projects with wizard-like efficiency, '
        'waving my wand to ensure on-time completion and submission with '
        'fewer bugs than a spellbound forest.',
    longDescription: '',
    skills: [],
  ),
  ExperienceModel(
    identifier: 'cy',
    role: 'Software Developer Intern',
    organization: 'Camp Yellow',
    from: DateTime(2023, DateTime.april),
    to: DateTime(2023, DateTime.may),
    shortDescription: 'Engineered a parallel downloading method and file '
        'compression technique, reducing download time by 50% for 1000+ daily'
        ' active users. 🚀⏬\n\nImplemented a dynamic system to update '
        'gameplay storyboards from Excel sheets, streamlining content '
        'management and reducing update time by 50%. 📊🕹️',
    longDescription: 'Collaborated with UI/UX designers to integrate '
        'innovative designs and animations, increasing user engagement by '
        '30%. 🎨📈\n\nImplemented secure APIs for authentication and data '
        'transfer, prioritizing data security and user privacy for a '
        'substantial user base. 🔐🌐\n\nImplemented audio interface for '
        'seamless background music during gameplay, enhancing user '
        'experience. 🎵🎮',
    skills: [
      'Flutter/Dart',
      'CMS',
      'Firebase',
      'Git',
    ],
  ),
  ExperienceModel(
    identifier: 'grahnumb',
    role: 'Flutter Game Developer Intern',
    organization: 'Grahnumb',
    from: DateTime(2023, DateTime.february),
    to: DateTime(2023, DateTime.march),
    shortDescription: 'Spearheaded the development of a visually stunning '
        'Flutter Flame games, boosting user engagement by 20% and enhancing '
        'interactivity with immersive visuals and gameplay experiences. 🎮🚀'
        '\n\nEngineered secure authentication and data APIs, ensuring user '
        'privacy and achieving an impressive error rate of less than 3%. '
        'Prioritized data security to establish trust and reliability for '
        'users. 🔐🌐',
    longDescription: 'Optimized code efficiency, reducing loading times by '
        '30% and delivering a smoother gameplay experience. Implemented '
        'reusable and reliable code to enhance performance and user '
        'satisfaction. ⚙️🕹️\n\nCrafted and engineered three dynamic Flutter '
        'games, each contributing to a significant 20% reduction in user '
        'churn rate 🕹️📉',
    skills: [
      'Flutter/Dart',
      'Flame Game',
      'Firebase',
      'Git',
    ],
  ),
  ExperienceModel(
    identifier: 'ecsol',
    role: 'Flutter Developer Intern',
    organization: 'EcoConsumers Solutions Pvt. Ltd.',
    from: DateTime(2022, DateTime.june),
    to: DateTime(2022, DateTime.september),
    shortDescription: 'Developed a B2C mobile app integrated with Firebase, '
        'resulting in a remarkable 40% increase in user engagement and '
        'dynamic content delivery 📱🔗\n\nLeveraged the Provider & RiverPod '
        'library for streamlined state management, yielding a significant 20% '
        'reduction in development time and enhancing app responsiveness ⚙️🔄'
        '\n\nImplemented caching using the Hive library, leading to a '
        'substantial 30% improvement in app performance and a 50% reduction '
        'in server requests 🚀📊',
    longDescription: '',
    skills: [
      'Flutter/Dart',
      'RiverPod',
      'Hive',
      'Firebase',
      'Git',
    ],
  ),
  ExperienceModel(
    identifier: 'raahi',
    role: 'Android Developer Intern',
    organization: 'Raahi Mobi Pvt. Ltd.',
    from: DateTime(2021, DateTime.may),
    to: DateTime(2021, DateTime.june),
    shortDescription: 'Integrated caching mechanism, reducing asset loading '
        'time by 20% for enhanced performance 🕹️⚙️\n\nDeveloped and '
        'implemented RESTful search and create API, reducing development '
        'time by 30% 🚀🔍',
    longDescription: '',
    skills: [
      'Android',
      'Room',
      'REST API',
      'Java',
    ],
  ),
  ExperienceModel(
    identifier: 'surjal',
    role: 'Android Developer Intern',
    organization: 'Surjal Services Pvt. Ltd.',
    from: DateTime(2021, DateTime.january),
    to: DateTime(2021, DateTime.february),
    shortDescription: 'Developed a WhatsApp auto-responder app with a 95% '
        'response rate, boosting user engagement 📱💬\n\nOptimized '
        'performance and reduced battery consumption by 30% through Android '
        'native services integration ⚙️🔋',
    longDescription: '',
    skills: [
      'Android',
      'Room',
      'Android Services',
      'Kotlin',
    ],
  ),
  ExperienceModel(
    identifier: 'yellow',
    role: 'Android Developer Intern',
    organization: '99 Yellow',
    from: DateTime(2020, DateTime.august),
    to: DateTime(2020, DateTime.december),
    shortDescription: 'Implemented local storage with Room Database, reducing'
        ' data retrieval time by 30% 🗄️📉\n\nConducted thorough unit tests '
        'using JUnit, achieving a test coverage of 95% 🧪🔍',
    longDescription: '',
    skills: [
      'Android',
      'JUnit',
      'Room',
      'Kotlin',
    ],
  ),
  ExperienceModel(
    identifier: 'ngo',
    role: 'Android Developer Intern',
    organization: 'Shree Mahesh Heritage',
    from: DateTime(2020, DateTime.june),
    to: DateTime(2020, DateTime.july),
    shortDescription: 'Integrated offline storage, enabling browsing history '
        'access without internet, enhancing user convenience 🗃️📶\n\n'
        'Optimized performance with threading techniques, reducing loading '
        'time by 50% 🚀⏱️',
    longDescription: '',
    skills: [
      'Android',
      'Room',
      'Kotlin',
    ],
  ),
];

//INFO: Projects
final List<ProjectModel> projectsList = [
  ProjectModel(
    identifier: 'ask-yashas',
    name: 'AskYashas',
    link: 'https://github.com/yashas-hm/ask-yashas-llm',
    image: 'https://yashashm.sirv.com/portfolio/henchman.png',
    skills: ['Python', 'RAG', 'Langchain', 'Serverless', 'LLM'],
    codeAvailable: true,
    longDescription: '',
    shortDescription: 'A personalized RAG chatbot designed to '
        'answer questions about me with precisions. Whether'
        ' it’s facts, timelines, or personal achievements, AskYashas knows '
        'the story.',
  ),
  ProjectModel(
    identifier: 'henchman',
    name: 'Henchman',
    link: 'https://github.com/yashas-hm/henchman',
    image: 'https://yashashm.sirv.com/portfolio/henchman.png',
    skills: [
      'JavaScript',
      'Bash',
    ],
    codeAvailable: true,
    longDescription: '',
    shortDescription: 'Henchman CLI is an all-in-one, interactive command-line '
        'tool designed to simplify the creation, setup, and management of '
        'development projects.',
  ),
  ProjectModel(
    identifier: 'illness-lab',
    name: 'Illness Lab',
    link: 'https://yashas-hm-unc.github.io/illness-lab-website/',
    image: 'https://yashashm.sirv.com/portfolio/illnessLab.png',
    skills: [
      'Flutter',
      'Game',
    ],
    codeAvailable: false,
    longDescription: '',
    shortDescription: 'A virtual escape room game to teach medical residents '
        'disease detection, starting with diabetes, combining interactive '
        'learning with problem-solving to enhance diagnostic skills.',
  ),
  ProjectModel(
    identifier: 'copter-war',
    name: 'Copter War',
    link: 'https://github.com/yashas-hm/copter-war',
    image: 'https://yashashm.sirv.com/portfolio/copterWar.gif',
    skills: [
      'JavaScript',
    ],
    longDescription: '',
    shortDescription: 'Copter War is a fast-paced 2D arcade game where you '
        'navigate a helicopter, dodge obstacles, and shoot enemies to survive.',
    codeAvailable: true,
  ),
  ProjectModel(
    identifier: 'med-tourism-co',
    name: 'MedTourism Co.',
    link:
        'https://github.com/yashas-hm/just-documentation/blob/main/MedTourismCo/MedTourismCo.md',
    image: 'https://yashashm.sirv.com/portfolio/mtc.png',
    skills: [
      'Flutter',
      'Node.js',
      'JavaScript',
      'TypeScript',
      'MariaDB',
      'Python',
    ],
    longDescription: '🔍 Search Clinics: Easily find the best dental and '
        'medical clinics based on location and procedure.\n\n💬 Community '
        'Forum: Engage with a community by asking questions, sharing '
        'experiences, and commenting on medical blogs.\n\n📚 Medical Blogs: '
        'Stay informed with well-researched medical blogs that offer insights '
        'into procedures, treatments, and healthcare trends.\n\n🍎 Calorie, '
        'Activity, and Macronutrient Tracker: Maintain your health goals with '
        'a detailed tracker that monitors your daily caloric intake, physical '
        'activity, and macronutrients\n\n🍽️ Meal Planner and Recipes: Plan '
        'nutritious meals effortlessly with a built-in meal planner and '
        'discover a variety of healthy recipes complete with macronutrient '
        'breakdowns\n\n💬 Zoho Chat Integration: Get real-time support from '
        'operators via integrated chat functionality for instant assistance.',
    shortDescription: 'A comprehensive medical tourism app offering clinic '
        'search, community forums, health tracking, meal planning, and '
        'real-time support.',
    codeAvailable: false,
  ),
  ProjectModel(
    identifier: 'dentavacation',
    name: 'DentaVacation',
    shortDescription: 'Innovative Flutter app revolutionizing dental care.',
    longDescription: 'Spearheaded the development of the DentaVacation '
        'Flutter app, resulting in a 40% increase in user engagement 🦷🌍\n\n'
        'Integrated interactive learning quizzes and videos, contributing to '
        'a 30% rise in user retention rates 📚🎥\n\nZoho Chat integration '
        'led to a 25% uptick in user inquiries and a notable 20% enhancement '
        'in customer satisfaction ratings 💬🤝\n\nImplementation of the '
        'habit tracker and notification system drove a 35% increase in habit '
        'adherence among users ⏰🦷\n\nThe cost calculator feature resulted '
        'in a 40% improvement in user decision-making accuracy regarding '
        'dental procedures 💰🧮\n\nCommunity forum establishment using '
        'Docker and Discourse fostered a 50% increase in user engagement and '
        'interaction 🤔💬\n\nCustom API developed using Node.js and '
        'Express.js ensured a 30% reduction in data retrieval time, '
        'enhancing overall app performance 🔒💽\n\nDynamic text update '
        'system led to a 25% decrease in app update frequency, resulting in '
        'a smoother user experience 🔄📲',
    link:
        'https://github.com/yashas-hm/just-documentation/blob/main/DentaVacation/DentaVacation.md',
    image: 'https://yashashm.sirv.com/portfolio/dentavacation.png',
    skills: [
      'Flutter',
      'Node.js',
      'JavaScript',
      'TypeScript',
      'SQL',
      'Python',
    ],
  ),
  ProjectModel(
    identifier: 'spotter',
    name: 'Spotter: Find your Spot!',
    shortDescription: 'Tailored spot suggestions, discounts and community.',
    longDescription: 'Spearheaded the development of Spotter, resulting in a '
        '40% increase in user engagement 🌐.\n\nFostered community engagement'
        ' by connecting local artists, boosting user interaction by 50% 🎨.'
        '\n\nImplemented BLoC architecture for Spotter, enhancing code '
        'organization and maintainability by 30% 🏗️.\n\nIntegrated '
        'cutting-edge technologies like Firebase and Google Cloud, improving'
        ' app robustness and scalability ⚙️.\n\nIntroduced strategic image '
        'compression techniques, reducing storage requirements by 50% 🖼️.\n'
        '\nManaged storage efficiently, minimizing storage needs and '
        'enhancing data retrieval speed by 25% 🚀.\n\n',
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
    image: 'https://yashashm.sirv.com/portfolio/asl.png',
    skills: [
      'Python',
      'TensorFlow',
      'MediaPipe',
    ],
    codeAvailable: true,
  ),
  ProjectModel(
    identifier: 'day-night-switcher',
    name: 'Day Night Switch',
    link: 'https://github.com/yashas-hm/day-night-themed-switcher',
    image: 'https://yashashm.sirv.com/portfolio/dayNightSwitcher.gif',
    skills: [
      'Flutter',
      'Animations',
    ],
    longDescription: '',
    shortDescription:
        'A customizable Flutter widget for toggling between day and night '
        'themes with smooth transitions and easy integration.',
  ),
  ProjectModel(
    identifier: 'glow-app-bar',
    name: 'Glow App Bar',
    shortDescription:
        'Widget which shows a glowing transition from when index changes and '
        'is fully customizable',
    longDescription: '',
    link: 'https://pub.dev/packages/glow_bottom_app_bar',
    image: 'https://yashashm.sirv.com/portfolio/glowAppBar.gif',
    skills: [
      'Flutter',
      'Animations',
    ],
  ),
  ProjectModel(
    identifier: 'direct-message',
    name: 'Direct Message',
    link:
        'https://play.google.com/store/apps/details?id=dev.yashashm.directmessage',
    image: 'https://yashashm.sirv.com/portfolio/directMessage.png',
    skills: [
      'Flutter',
    ],
    longDescription: '',
    shortDescription: 'Direct Message lets you send WhatsApp messages to any '
        'number without saving the contact, instantly and effortlessly.',
  ),
  ProjectModel(
    identifier: 'auto-whatsapp',
    name: 'AutoWhatsapp',
    shortDescription: 'An Android app automating WhatsApp replies for '
        'enhanced messaging efficiency and convenience.',
    longDescription: '',
    link: 'https://github.com/yashas-hm/AutoWhatsapp',
    image: 'https://yashashm.sirv.com/portfolio/autowhatsapp.jpg',
    skills: [
      'Android',
      'Background Services',
      'Firebase',
    ],
    codeAvailable: true,
  ),
  ProjectModel(
    identifier: 'smart-glass',
    name: 'Smart Glass',
    shortDescription: 'Low-Cost Efficient AR Smart Glass',
    longDescription: '',
    link: 'https://github.com/yashas-hm/Smart-Glass',
    image: 'https://yashashm.sirv.com/portfolio/smartglass.jpg',
    skills: [
      'Iot',
      'Arduino',
      'AR',
      'C++',
    ],
    codeAvailable: true,
  ),
  ProjectModel(
    identifier: 'space-invaders',
    name: 'Space Invaders',
    shortDescription: 'Re-creating of an old game: Space Invaders',
    longDescription: '',
    link: 'https://github.com/yashas-hm/Space_Invaders_JavaFX',
    image: 'https://yashashm.sirv.com/portfolio/spaceinvaders.jpg',
    skills: [
      'Java',
      'JavaFX',
    ],
    codeAvailable: true,
  ),
  ProjectModel(
    identifier: 'recipe-fetch',
    name: 'Recipe Scraper API',
    shortDescription: 'A simple web scraper api for recipes',
    longDescription: '',
    link: 'https://github.com/yashas-hm/Recipe-Scraper-API',
    image: 'https://yashashm.sirv.com/portfolio/recipefetch.png',
    skills: [
      'Python',
      'Flask',
    ],
    codeAvailable: true,
  ),
  ProjectModel(
    identifier: 'exam-assigner',
    name: 'Faculty Exam Assigner',
    shortDescription: 'A GUI-based system randomly assigns faculties to exam '
        'slots while adhering to specified constraints on reoccurrence.',
    longDescription: '',
    link: 'https://github.com/yashas-hm/Exam_Supervision_Assigner',
    image: 'https://yashashm.sirv.com/portfolio/examassigner.png',
    skills: [
      'Python',
      'Tkinter',
      'Pandas',
    ],
    codeAvailable: true,
  ),
  ProjectModel(
    identifier: 'midi-drums',
    name: 'MIDI Drums',
    shortDescription: 'A simple cost efficient MIDI Drum Set',
    longDescription: '',
    link: 'https://github.com/yashas-hm/Arduino-MIDI-Drums',
    image: 'https://yashashm.sirv.com/portfolio/drums.png',
    skills: [
      'IoT',
      'Arduino',
      'C++',
    ],
    codeAvailable: true,
  ),
];

//INFO: Testimonials
final List<TestimonialModel> testimonials = [
  TestimonialModel(
    identifier: 'pb',
    referer: 'Deepak Datta',
    designation: 'CEO, PracticeBuzz',
    description:
        'Yashas\'s contributions as a Senior Software Engineer at PracticeBuzz '
        'are outstanding. His role in developing the DentaVacation app '
        'showcased technical prowess, innovative design, and a commitment to'
        ' security. His adaptability, collaboration, and pursuit of '
        'excellence are commendable.',
  ),
  TestimonialModel(
    identifier: 'eco',
    referer: 'Manjunath Jakkur Munigowda',
    designation: 'Director, EcoConsumer Solutions Pvt. Ltd.',
    description:
        'Yashas\'s time as a Flutter Developer Intern was marked by exceptional'
        ' skill and dedication. His problem-solving abilities and '
        'innovative solutions significantly enhanced our mobile app '
        'development. His commitment to excellence, coupled with his '
        'teamwork and communication skills, made him an invaluable asset. '
        'I highly recommend him for any role requiring a skilled software '
        'developer.',
  ),
];

//INFO: Position of Responsibility
final List<TestimonialModel> porList = [
  TestimonialModel(
    identifier: 'sac',
    referer: 'Student Activity Cell, Indus University',
    designation: 'President',
    description:
        'Masterminded dynamic student events with precision and foresight, '
        'prioritizing efficiency and strategic planning 🌟🚀\n\n'
        'Led and energized a 30-strong student team, ensuring flawless '
        'execution of 80+ events. Skillfully orchestrated efforts for '
        'seamless event delivery 🤝📅',
  ),
  TestimonialModel(
    identifier: 'gdsc',
    referer: 'GDSC Android Jams',
    designation: 'Android Facilitator',
    description:
        'Orchestrated three impactful events, resulting in a 25% rise in '
        'Android development proficiency and a 20% increase in '
        'knowledge-sharing interactions 👩‍💻🌐\n\n'
        'Drove a 30% surge in student engagement in tech learning '
        'initiatives, setting new standards for educational '
        'excellence 🚀📚',
  ),
  TestimonialModel(
    identifier: 'hackathon',
    referer: 'Hackathons & Internships',
    designation: 'Team Lead',
    description: 'Executed projects with a 95% on-time delivery rate and a 40% '
        'reduction in bugs, highlighting adept project management '
        'skills and proactive problem-solving under pressure 🚀🛠️\n\n'
        'Led teams to victory in multiple National Level Hackathons, '
        'achieving a 90% success rate as Team Lead 🏆👩‍💻',
  ),
];

//INFO: Technical Achievements
final List<AchievementModel> techAchievementsList = [
  AchievementModel(
    identifier: 'sih',
    eventName: 'Smart India Hackathon 2022',
    position: 'Finals',
    description: 'Developed a Fake News Detection AI Website & API, '
        'showcasing expertise in combating misinformation and advancing '
        'technology for societal benefit 🏅🤖.',
  ),
  AchievementModel(
    identifier: 'nirma22',
    eventName: 'Nirma University National Hackathon 2022',
    position: '1st',
    description: 'Developed an American Sign Language gesture detector using '
        'open Computer Vision, showcasing commitment to accessibility and '
        'inclusive technology 🏆👐.',
  ),
  AchievementModel(
    identifier: 'nirma21',
    eventName: 'Nirma University National Hackathon 2021',
    position: '1st',
    description: 'Developed a Cheque Scanner OCR Mobile App, demonstrating '
        'innovative mobile technology solutions and excellence in '
        'application development 🥇📱.',
  ),
  AchievementModel(
    identifier: 'parul',
    eventName: 'Parul University National Hackathon 2020',
    position: '1st',
    description: 'Developed an AR Weather App, demonstrating consistent '
        'excellence in problem-solving and technological innovation 🏆🚀.',
  ),
  AchievementModel(
    identifier: 'indus',
    eventName: 'Indus University National e-Hackathon 2019',
    position: '1st',
    description: 'Developed an IoT MR smart-glass, showcasing proficiency in '
        'merging IoT and Mixed Reality for cutting-edge solutions 🥇🔍.',
  ),
  AchievementModel(
    identifier: 'ssip',
    eventName: 'Student Startup and Innovation Program 2019',
    position: '2nd',
    description: 'Awarded by the CM of Gujarat, for entrepreneurial endeavors'
        ' and innovative contributions to the startup ecosystem 🌐💡.',
  ),
];

//INFO: Cultural Achievements
final List<AchievementModel> culAchievementsList = [
  AchievementModel(
    identifier: 'nirma23',
    eventName: 'Nirma University Western Singing Competition 2023',
    position: '2nd',
    description: 'Nailed it with \'Stitches\' by Shawn Mendes in Western '
        'Singing showdown! 🏆🎤',
  ),
  AchievementModel(
    identifier: 'parul',
    eventName: 'Parul University E-Cultural Fest 2020',
    position: '1st',
    description: 'Snagged the top spot with an epic old song mashup! 🥇🎶',
  ),
  AchievementModel(
    identifier: 'nirma 2019',
    eventName: 'Nirma Duet Singing Competition 2019',
    position: '2nd',
    description: 'Claimed victory with a guitar-duet mashup'
        ' performance! 🏆🎸',
  ),
  AchievementModel(
    identifier: 'events',
    eventName: 'Performances at Events',
    position: 'Stage',
    description: 'Dazzling crowds with dynamic on-stage performances, '
        'exuding captivating musical charm 🎤🌟.',
  ),
];
