import 'package:flutter/material.dart' show IconData, Color;

class Narrative {
  Narrative({
    required this.icon,
    required this.baseIcon,
    required this.color,
    required this.headline,
    required this.description,
  });

  final IconData icon;
  final IconData baseIcon;
  final Color color;
  final String headline;
  final String description;
}
