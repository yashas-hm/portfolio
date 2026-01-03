import 'package:flutter/material.dart';
import 'package:portfolio/components/base_page/base_page.dart';
import 'package:portfolio/components/projects/projects_component.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      content: ProjectsComponent(),
    );
  }
}
