import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/app_theme.dart';
import 'package:portfolio/screens/about_screen.dart';
import 'package:portfolio/screens/certifications_screen.dart';
import 'package:portfolio/screens/education_screen.dart';
import 'package:portfolio/screens/experience_screen.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/screens/project_screen.dart';
import 'package:resize/resize.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = WidgetsBinding.instance.window.physicalSize;

    final resize = screenSize.width > screenSize.height
        ? Size(
            screenSize.width,
            screenSize.height,
          )
        : const Size(390, 844);

    return Resize(
      builder: () => GetMaterialApp(
        defaultTransition: Transition.upToDown,
        transitionDuration: const Duration(milliseconds: 500),
        theme: AppTheme.getTheme(false, context),
        debugShowCheckedModeBanner: false,
        title: 'Yashas Majmudar',
        routes: {
          '/':(ctx) => const HomeScreen(),
          '/HomeScreen': (ctx) => const HomeScreen(),
          '/AboutScreen': (ctx) => const AboutScreen(),
          '/ExperienceScreen': (ctx) => const ExperienceScreen(),
          '/EducationScreen': (ctx) => const EducationScreen(),
          '/ProjectsScreen': (ctx) => const ProjectsScreen(),
          '/CertificationsScreen': (ctx) => const CertificationsScreen(),
        },
      ),
      allowtextScaling: false,
      size: resize,
    );
  }
}
