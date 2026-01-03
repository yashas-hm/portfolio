import 'package:flutter/material.dart';
import 'package:portfolio/components/about/about_component.dart';
import 'package:portfolio/components/base_page/base_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      content: AboutComponent(),
    );
  }
}
