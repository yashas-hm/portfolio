import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_theme.dart';
import 'package:portfolio/screens/about_screen.dart';
import 'package:portfolio/screens/contact_screen.dart';
import 'package:portfolio/screens/experience_screen.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/screens/project_screen.dart';
import 'package:resize/resize.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(NavController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    Size size;

    if (screenSize.height > screenSize.width) {
      size = const Size(410, 910);
    } else {
      size = const Size(1728, 1000);
    }

    return Resize(
      builder: () => OKToast(
        child: GetMaterialApp(
          defaultTransition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 500),
          theme: AppTheme.getTheme(context),
          debugShowCheckedModeBanner: false,
          title: 'Software Sorcerer',
          routes: {
            AppConstants.homeRoute: (ctx) => const HomeScreen(),
            AppConstants.aboutMeRoute: (ctx) => const AboutScreen(),
            AppConstants.experienceRoute: (ctx) => const ExperienceScreen(),
            AppConstants.projectsRoute: (ctx) => const ProjectScreen(),
            AppConstants.contactMeRoute: (ctx) => const ContactScreen(),
          },
        ),
      ),
      allowtextScaling: false,
      size: size,
    );
  }
}
