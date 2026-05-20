import 'package:flutter/material.dart' show Color;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Narrative {
  Narrative({
    required this.icon,
    required this.baseIcon,
    required this.color,
    required this.headline,
    required this.description,
  });

  final FaIconData icon;
  final FaIconData baseIcon;
  final Color color;
  final String headline;
  final String description;
}
