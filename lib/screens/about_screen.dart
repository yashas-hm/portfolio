import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/helpers/app_helpers.dart';
import 'package:portfolio/screens/desktop/about_screen.dart' as desktop;
import 'package:portfolio/screens/mobile/about_screen.dart' as mobile;
import 'package:portfolio/widgets/custom_scaffold.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      AppHelper.indexCheck(AppConstants.aboutIndex);
    });

    return CustomScaffold(
      child: screenSize.height > screenSize.width
          ? const mobile.AboutScreen()
          : const desktop.AboutScreen(),
    );
  }
}
