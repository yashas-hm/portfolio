import 'package:portfolio/model/legacy_models/base_model.dart';

class TestimonialModel extends BaseModel {
  String referer;

  String designation;

  String description;

  TestimonialModel({
    required super.identifier,
    required this.referer,
    required this.designation,
    required this.description,
  });
}
