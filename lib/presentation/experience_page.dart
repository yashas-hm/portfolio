import 'package:flutter/material.dart';
import 'package:portfolio/components/base_page/base_page.dart';
import 'package:portfolio/components/experiences/experiences_component.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      content: ExperiencesComponent(),
    );
  }
}
