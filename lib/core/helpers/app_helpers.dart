import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/model/experience_model.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/providers/scroll_provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AppHelper {
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
}
