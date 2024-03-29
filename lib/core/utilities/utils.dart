import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/model/experience_model.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/providers/scroll_provider.dart';
import 'package:portfolio/screens/about_screen.dart';
import 'package:portfolio/screens/contact_screen.dart';
import 'package:portfolio/screens/experience_screen.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/screens/project_screen.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Utils {
  static void indexCheck(int index, WidgetRef ref) {
    final currentIndex = ref.read(currentIndexProvider.notifier);

    if (currentIndex.state != index) {
      ref.read(pageIndexProvider.notifier).state = index;
      currentIndex.state = index;
    }
  }

  static void reRoute(
    int pageIndex,
    BuildContext context,
    WidgetRef ref,
  ) {
    switch (pageIndex) {
      case AppConstants.homeIndex:
        ref
            .read(scrollControllerProvider.notifier)
            .update((state) => ItemScrollController());
        ref
            .read(positionListenerProvider.notifier)
            .update((state) => ItemPositionsListener.create());
        Navigator.pushNamed(context, AppConstants.homeRoute);
        break;
      case AppConstants.aboutIndex:
        Navigator.pushNamed(context, AppConstants.aboutMeRoute);
        break;
      case AppConstants.experienceIndex:
        Navigator.pushNamed(context, AppConstants.experienceRoute);
        break;
      case AppConstants.projectsIndex:
        Navigator.pushNamed(context, AppConstants.projectsRoute);
        break;
      case AppConstants.contactMeIndex:
        Navigator.pushNamed(context, AppConstants.contactMeRoute);
        break;
      default:
        Navigator.pushNamed(context, AppConstants.homeRoute);
        break;
    }
  }

  static String getTimeLine(ExperienceModel model) {
    final from = DateFormat('MMMM yyyy').format(model.from);
    final to = DateFormat('MMMM yyyy').format(model.to);
    final present = model.to.isAfter(DateTime.now());
    return '$from — ${present ? 'Present' : to}';
  }

  static Future<(bool, String)> sendMessage({
    required String email,
    required String text,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(const String.fromEnvironment('BASE_URL')),
        headers: <String, String>{
          'Authorization': 'Bearer ${const String.fromEnvironment('JWT')}',
        },
        body: jsonEncode({'email': email, 'message': text}),
      );

      final responseBody = jsonDecode(response.body);

      return (
        responseBody['success'].toString() == 'true',
        responseBody['message'].toString(),
      );
    } catch (err) {
      log(err.toString());
      return (
        false,
        'Communication hiccup! Unexpected error encountered. Retry later, please!',
      );
    }
  }

  static PageRouteBuilder pageRouteBuilder(
    Widget page,
    RouteSettings settings,
  ) =>
      PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) => FadeTransition(
          opacity:
              animation.drive(Tween<double>(begin: 0, end: 1).chain(CurveTween(
            curve: Curves.easeInOut,
          ))),
          child: child,
        ),
        transitionDuration: 600.milliseconds,
        reverseTransitionDuration: 600.milliseconds,
      );

  static Route<dynamic> routeBuilder(RouteSettings settings) {
    switch (settings.name) {
      case AppConstants.homeRoute:
        return pageRouteBuilder(const HomeScreen(), settings);
      case AppConstants.aboutMeRoute:
        return pageRouteBuilder(const AboutScreen(), settings);
      case AppConstants.experienceRoute:
        return pageRouteBuilder(const ExperienceScreen(), settings);
      case AppConstants.projectsRoute:
        return pageRouteBuilder(const ProjectScreen(), settings);
      case AppConstants.contactMeRoute:
        return pageRouteBuilder(const ContactScreen(), settings);
      default:
        return pageRouteBuilder(const HomeScreen(), settings);
    }
  }
}
