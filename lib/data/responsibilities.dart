import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/model/responsibility.dart';

class Responsibilities {
  Responsibilities._();

  static List<Responsibility> get all => [
        sac,
        gdsc,
        hackathon,
        hackNCJudge,
        codeTheDreamMentor,
      ]..sort((a, b) =>
          (b.date ?? DateTime(9999)).compareTo(a.date ?? DateTime(9999)));

  static final sac = Responsibility(
    color: KnownColors.cyan500,
    icon: FontAwesomeIcons.userGroup,
    role: 'President',
    destination: 'Student Activity Cell, Indus University',
    description:
        'Masterminded dynamic student events with precision and foresight, '
        'prioritizing efficiency and strategic planning.\n'
        'Led and energized a 30-strong student team, ensuring flawless '
        'execution of 80+ events. Skillfully orchestrated efforts for '
        'seamless event delivery.',
    date: DateTime(2022, 1),
  );

  static final gdsc = Responsibility(
    color: KnownColors.green500,
    icon: FontAwesomeIcons.android,
    role: 'Android Facilitator',
    destination: 'Google Developer Student Club',
    description:
        'Orchestrated three impactful events, resulting in a 25% rise in '
        'Android development proficiency and a 20% increase in '
        'knowledge-sharing interactions.\n'
        'Drove a 30% surge in student engagement in tech learning '
        'initiatives, setting new standards for educational excellence.',
    date: DateTime(2023, 1),
  );

  static final hackathon = Responsibility(
    color: KnownColors.amber500,
    icon: FontAwesomeIcons.trophy,
    role: 'Team Lead',
    destination: 'Hackathons & Internships',
    description: 'Executed projects with a 95% on-time delivery rate and a 40% '
        'reduction in bugs, highlighting adept project management '
        'skills and proactive problem-solving under pressure.\n'
        'Led teams to victory in multiple National Level Hackathons, '
        'achieving a 90% success rate as Team Lead.',
    date: DateTime(2023, 5),
  );

  static final hackNCJudge = Responsibility(
    color: KnownColors.purple500,
    icon: FontAwesomeIcons.gavel,
    role: 'Hackathon Judge',
    destination: 'HackNC',
    description:
        'Evaluated 50+ hackathon submissions across full-stack, mobile, and '
        'AI domains, applying rigorous technical and product criteria to '
        'identify high-impact solutions.\n'
        'Provided actionable feedback to teams, improving project clarity, '
        'technical robustness, and real-world feasibility.',
    date: DateTime(2025, 10),
  );

  static final codeTheDreamMentor = Responsibility(
    color: KnownColors.blue500,
    icon: FontAwesomeIcons.chalkboardUser,
    role: 'Coding Mentor',
    destination: 'Code the Dream',
    description:
        'Mentored aspiring developers through hands-on coding sessions, '
        'system design discussions, and project reviews, accelerating '
        'learning outcomes and technical confidence.\n'
        'Guided mentees on best practices in software development, '
        'resulting in measurable improvements in code quality and '
        'problem-solving efficiency.',
  );
}
