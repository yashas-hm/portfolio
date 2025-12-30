import 'package:portfolio/model/legacy_models/base_model.dart';

class ProjectModel extends BaseModel {
  final int priority;

  final String name;

  final String shortDescription;

  final String longDescription;

  final String link;

  final String image;

  final List<String> skills;

  final bool codeAvailable;

  ProjectModel({
    required super.identifier,
    required this.name,
    required this.link,
    required this.image,
    required this.skills,
    required this.longDescription,
    required this.shortDescription,
    this.codeAvailable = false,
    this.priority = 1000,
  });
}
