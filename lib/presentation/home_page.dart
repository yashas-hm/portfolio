import 'package:flutter/material.dart';
import 'package:portfolio/components/base_page/base_page.dart';
import 'package:portfolio/components/metrics/metrics_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      content: MetricsComponent(),
    );
  }
}
