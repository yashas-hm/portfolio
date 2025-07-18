import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/model/experience_model.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/providers/scroll_provider.dart';
import 'package:portfolio/screens/about_screen.dart';
import 'package:portfolio/screens/chat_screen.dart';
import 'package:portfolio/screens/contact_screen.dart';
import 'package:portfolio/screens/contributions_screen.dart';
import 'package:portfolio/screens/experience_screen.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/screens/not_found_screen.dart';
import 'package:portfolio/screens/project_screen.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void indexCheck(int index, WidgetRef ref) {
  final currentIndex = ref.read(currentIndexProvider.notifier);

  if (currentIndex.state != index) {
    ref.read(pageIndexProvider.notifier).state = index;
    currentIndex.state = index;
  }
}

void reRoute(
  int pageIndex,
  BuildContext context,
  WidgetRef ref,
) {
  switch (pageIndex) {
    case homeIndex:
      ref
          .read(scrollControllerProvider.notifier)
          .update((state) => ItemScrollController());
      ref
          .read(positionListenerProvider.notifier)
          .update((state) => ItemPositionsListener.create());
      Navigator.pushNamed(context, homeRoute);
      break;
    case aboutIndex:
      Navigator.pushNamed(context, aboutMeRoute);
      break;
    case experienceIndex:
      Navigator.pushNamed(context, experienceRoute);
      break;
    case projectsIndex:
      Navigator.pushNamed(context, projectsRoute);
      break;
    case contributionsIndex:
      Navigator.pushNamed(context, contributionsRoute);
      break;
    case contactMeIndex:
      Navigator.pushNamed(context, contactMeRoute);
      break;
    case chatIndex:
      Navigator.pushNamed(context, chatRoute);
      break;
    default:
      Navigator.pushNamed(context, homeRoute);
      break;
  }
}

bool isDarkMode(ThemeMode themeMode) {
  switch (themeMode) {
    case ThemeMode.light:
      return false;
    case ThemeMode.dark:
      return true;
    default:
      return true;
  }
}

String getTimeLine(ExperienceModel model) {
  final from = DateFormat('MMMM yyyy').format(model.from);

  String to = '';
  final present = model.to == null;
  if (!present) {
    to = DateFormat('MMMM yyyy').format(model.to!);
  }
  return '$from — ${present ? 'Present' : to}';
}

Future<(bool, String)> sendMessage({
  required String email,
  required String text,
}) async {
  try {
    final response = await http.post(
      Uri.parse('https://yashashm.dev/api/mail'),
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
      'Communication hiccup! Unexpected error encountered. Retry later, please!!!',
    );
  }
}

PageRouteBuilder pageRouteBuilder(
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

Route<dynamic> routeBuilder(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return pageRouteBuilder(const HomeScreen(), settings);
    case aboutMeRoute:
      return pageRouteBuilder(const AboutScreen(), settings);
    case experienceRoute:
      return pageRouteBuilder(const ExperienceScreen(), settings);
    case projectsRoute:
      return pageRouteBuilder(const ProjectScreen(), settings);
    case contributionsRoute:
      return pageRouteBuilder(const ContributionsScreen(), settings);
    case contactMeRoute:
      return pageRouteBuilder(const ContactScreen(), settings);
    case chatRoute:
      return pageRouteBuilder(const ChatScreen(), settings);
    case resumeRoute:
      return pageRouteBuilder(const HomeScreen(), settings);
    default:
      return pageRouteBuilder(const NotFoundScreen(), settings);
  }
}

ColorFilter? filterAccToThemeIfNeeded(BuildContext context, String skill) {
  if (colorOverrideOnTag.contains(skill)) {
    return ColorFilter.mode(
      Theme.of(context).colorScheme.tertiary,
      BlendMode.srcIn,
    );
  }

  return null;
}
