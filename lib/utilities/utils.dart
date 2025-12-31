import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/model/experience.dart';
import 'package:portfolio/utilities/extensions.dart';
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
