import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/model/skill.dart' show Skill;

enum ExperienceType {
  partTime('Part Time'),
  fullTime('Full Time'),
  internship('Internship'),
  freelance('Freelance');

  final String value;

  const ExperienceType(this.value);
}

typedef ExperienceDescription = ({String description, IconData? icon});

class Experience {
  final String role;
  final String company;
  final DateTime startDate;
  final DateTime? endDate;
  final ExperienceType type;
  final List<ExperienceDescription> descriptions;
  final List<Skill> skills;
  final IconData icon;

  const Experience({
    required this.role,
    required this.company,
    required this.startDate,
    required this.type,
    required this.descriptions,
    required this.skills,
    this.endDate,
    this.icon = FontAwesomeIcons.codeBranch,
  });
}
