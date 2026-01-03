import 'package:flutter/material.dart' show IconData;

class Metric {
  final String details;
  final String name;
  final String metric;
  final IconData impactIcon;
  final IconData metricSuffixIcon;
  final IconData? suffixIcon;

  const Metric({
    required this.impactIcon,
    required this.metricSuffixIcon,
    required this.details,
    required this.name,
    required this.metric,
    this.suffixIcon,
  });
}
