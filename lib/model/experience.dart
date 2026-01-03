import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/model/skill.dart' show Skill;

enum ExperienceType {
  partTime('Part Time', KnownColors.amber500),
  fullTime('Full Time', KnownColors.green500),
  internship('Internship', KnownColors.blue600),
  freelance('Freelance', KnownColors.purple500);

  final String value;
  final Color color;

  const ExperienceType(this.value, this.color);
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

  bool get present => endDate == null;
}
