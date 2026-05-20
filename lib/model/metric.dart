import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Metric {
  final String details;
  final String name;
  final String metric;
  final FaIconData impactIcon;
  final FaIconData metricSuffixIcon;
  final FaIconData? suffixIcon;

  const Metric({
    required this.impactIcon,
    required this.metricSuffixIcon,
    required this.details,
    required this.name,
    required this.metric,
    this.suffixIcon,
  });
}
