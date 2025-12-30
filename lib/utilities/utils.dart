import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';
import 'package:portfolio/constants/constants.dart'
    show Styles, KnownColors, Sizes;
import 'package:portfolio/constants/portfolio_constants.dart';
import 'package:portfolio/model/experience.dart';
import 'package:portfolio/model/experience_model.dart';
import 'package:portfolio/model/skill.dart';
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
import 'package:portfolio/utilities/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

void indexCheck(int index, WidgetRef ref) {
  final currentValue = ref.read(currentIndexProvider);

  if (currentValue != index) {
    ref.read(pageIndexProvider.notifier).set(index);
    ref.read(currentIndexProvider.notifier).set(index);
  }
}

void reRoute(
  int pageIndex,
  BuildContext context,
  WidgetRef ref,
) {
  switch (pageIndex) {
    case homeIndex:
      ref.read(scrollControllerProvider.notifier).reset();
      ref.read(positionListenerProvider.notifier).reset();
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

String convertToTimeline(Experience experience) {
  final from = DateFormat('MMM yyyy').format(experience.startDate);

  String to = '';
  final present = experience.endDate == null;
  if (!present) {
    to = DateFormat('MMM yyyy').format(experience.endDate!);
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

ColorFilter? filterAccToThemeIfNeeded(BuildContext context, Skill skill) {
  if (skill.overrideLogoColor) {
    return ColorFilter.mode(
      Theme.of(context).colorScheme.tertiary,
      BlendMode.srcIn,
    );
  }

  return null;
}

class Utils {
  Utils._();

  static String convertToTimeline(Experience experience) {
    final from = DateFormat('MMM yyyy').format(experience.startDate);

    String to = '';
    final present = experience.endDate == null;
    if (!present) {
      to = DateFormat('MMM yyyy').format(experience.endDate!);
    }
    return '$from — ${present ? 'Present' : to}';
  }

  static void safelyLaunchUrl(String url, BuildContext? context) async {
    bool launched = false;
    
    if(context==null) return;

    try {
      final split = url.split(':');
      Uri uri;
      if (split.length > 1) {
        uri = Uri(scheme: split[0], path: split[1]);
      } else {
        uri = Uri.parse(url);
      }
      if (await canLaunchUrl(uri)) {
        launched = await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
          webOnlyWindowName: '_blank',
        );
      }
    } catch (_) {}

    if (!launched && context.mounted) {
      showErrorToast(
        context,
        'Sorry, couldn\'t launch the URL. Please try again later.',
      );
    }
  }

  static void showToast(BuildContext context, String text, bool success) =>
      success ? showSuccessToast(context, text) : showErrorToast(context, text);

  static void showErrorToast(BuildContext context, String text) {
    showToastWidget(
      Container(
        width: context.isMobile ? context.width * 0.9 : context.width * 0.6,
        padding: Sizes.paddingRegular,
        decoration: BoxDecoration(
          borderRadius: Sizes.borderRadiusXS,
          gradient: LinearGradient(
            colors: [
              KnownColors.red600,
              KnownColors.red100,
              KnownColors.red600,
            ],
          ),
        ),
        child: Text(
          text,
          style: Styles.regularTextBold(textColor: KnownColors.white),
          textAlign: TextAlign.center,
        ),
      ),
      context: context,
      dismissOtherToast: true,
      handleTouch: true,
      position: ToastPosition.bottom,
      duration: 2500.milliseconds,
    );
  }

  static void showSuccessToast(BuildContext context, String text) {
    showToastWidget(
      Container(
        width: context.isMobile ? context.width * 0.9 : context.width * 0.6,
        padding: Sizes.paddingRegular,
        decoration: BoxDecoration(
          borderRadius: Sizes.borderRadiusXS,
          gradient: LinearGradient(
            colors: [
              KnownColors.green600,
              KnownColors.green100,
              KnownColors.green600,
            ],
          ),
        ),
        child: Text(
          text,
          style: Styles.regularTextBold(textColor: KnownColors.black),
          textAlign: TextAlign.center,
        ),
      ),
      context: context,
      dismissOtherToast: true,
      handleTouch: true,
      position: ToastPosition.bottom,
      duration: 2500.milliseconds,
    );
  }
}
