import 'package:flutter/material.dart' show IconData, Color;
import 'package:portfolio/constants/constants.dart' show KnownColors;
import 'package:portfolio/model/skill.dart' show Skill;

enum ProjectTag {
  all('All', -1, KnownColors.transparent),
  inProgress('In Progress', 1, KnownColors.amber500),
  aiMl('AI/ML', 2, KnownColors.purple500),
  production('Production', 3, KnownColors.green500),
  project('Project', 4, KnownColors.blue500),
  package('Package', 5, KnownColors.cyan500);

  final String value;
  final int order;
  final Color color;

  const ProjectTag(this.value, this.order, this.color);

  @override
  String toString() => value;
}

typedef ProjectURL = ({
  String urlText,
  String url,
  IconData icon,
});

class Project {
  final String name;
  final String imageUrl;
  final ProjectTag tag;
  final String description;
  final List<Skill> skills;
  final List<ProjectURL> links;
  final DateTime? endDate;

  const Project({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.tag,
    required this.skills,
    required this.links,
    this.endDate,
  });
}
