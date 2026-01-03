import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/model/experience.dart';
import 'package:portfolio/utilities/toast.dart';
import 'package:url_launcher/url_launcher.dart';

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

  static void safelyLaunchUrl(String? url, BuildContext? context) async {
    if (context == null || url == null) return;

    bool launched = false;

    try {
      final split = url.split(':');
      Uri uri;
      if (split.length > 1 && !split[0].startsWith('http')) {
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
      Toast.showErrorToast(
        context,
        'Sorry, couldn\'t launch the URL. Please try again later.',
      );
    }
  }
}
