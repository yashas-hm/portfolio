import 'package:flutter/material.dart' show IconData, Color;

class Responsibility {
  final Color color;
  final IconData icon;
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
