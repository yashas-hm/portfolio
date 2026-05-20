import 'package:flutter/material.dart' show Color;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Responsibility {
  final Color color;
  final FaIconData icon;
  final String role;
  final String destination;
  final String description;
  final DateTime? date;

  Responsibility({
    required this.color,
    required this.icon,
    required this.role,
    required this.destination,
    required this.description,
    this.date,
  });
}
