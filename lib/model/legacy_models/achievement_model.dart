import 'package:portfolio/model/legacy_models/base_model.dart';
import 'package:portfolio/model/legacy_models/base_model.dart';

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
