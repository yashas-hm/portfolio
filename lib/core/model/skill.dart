import 'dart:ui';

import 'package:portfolio/core/constants/constants.dart';

enum SkillCategory {
  languages(SkillCategoryColors.languages),
  frontend(SkillCategoryColors.frontend),
  backend(SkillCategoryColors.backend),
  database(SkillCategoryColors.database),
  devops(SkillCategoryColors.devops),
  mlAi(SkillCategoryColors.mlAi),
  cloudTools(SkillCategoryColors.cloudTools),
  iot(SkillCategoryColors.iot);

  final Color color;

  const SkillCategory(this.color);
}

class Skill {
  final String name;
  final String? icon;
  final SkillCategory _category;
  final bool overrideLogoColor;

  const Skill({
    required this.name,
    required SkillCategory category,
    this.icon,
    this.overrideLogoColor = false,
  }) : _category = category;

  Color get color => _category.color;
  
  Color get backgroundColor => color.withValues(alpha: 0.1);
}
