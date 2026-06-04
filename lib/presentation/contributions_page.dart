import 'package:flutter/material.dart';
import 'package:portfolio/components/base_page/base_page.dart';
import 'package:portfolio/components/contributions/contributions_component.dart';

class ContributionsPage extends StatelessWidget {
  const ContributionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(content: ContributionsComponent());
  }
}
