import 'package:portfolio/model/legacy_models/base_model.dart';

class ExperienceModel extends BaseModel {
  final String role;
  final String organization;
  final DateTime from;
  final DateTime? to;
  final String shortDescription;
  final String longDescription;
  final List<String> skills;

  ExperienceModel({
    required super.identifier,
    required this.role,
    required this.organization,
    required this.from,
    required this.to,
    required this.shortDescription,
    required this.longDescription,
    required this.skills,
  });
}
