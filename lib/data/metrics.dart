import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/model/metric.dart';

class Metrics {
  Metrics._();

  static const highConcurrency = Metric(
    impactIcon: FontAwesomeIcons.peopleGroup,
    metricSuffixIcon: FontAwesomeIcons.plus,
    details:
        'Active users supported via scalable cloud infrastructure and efficient backend logic.',
    name: 'High Concurrency',
    metric: '10k',
  );

  static const latencyOptimization = Metric(
    impactIcon: FontAwesomeIcons.bolt,
    metricSuffixIcon: FontAwesomeIcons.percent,
    details:
        'Faster data retrieval across the stack, from database queries to frontend rendering.',
    name: 'Latency Optimization',
    metric: '40',
    suffixIcon: FontAwesomeIcons.arrowDownLong,
  );

  static const globalDeployment = Metric(
    impactIcon: FontAwesomeIcons.earthAmericas,
    metricSuffixIcon: FontAwesomeIcons.plus,
    details: 'Deploying robust & scalable software systems serving to massive global audiences.',
    name: 'Global Deployment',
    metric: '100k',
  );

  static const systemResilience = Metric(
    impactIcon: FontAwesomeIcons.shieldHalved,
    metricSuffixIcon: FontAwesomeIcons.percent,
    details:
        'Reduction in production errors via clean architecture and rigorous CI/CD.',
    name: 'System Resilience',
    metric: '40',
    suffixIcon: FontAwesomeIcons.arrowDownLong,
  );

  static const List<Metric> all = [
    highConcurrency,
    latencyOptimization,
    globalDeployment,
    systemResilience,
  ];
}
