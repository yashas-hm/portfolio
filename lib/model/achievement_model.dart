import 'package:portfolio/core/model/base_model.dart';

class AchievementModel extends BaseModel {
  String eventName;

  String position;

  String description;

  AchievementModel(
      {required super.identifier,
      required this.eventName,
      required this.position,
      required this.description});
}
