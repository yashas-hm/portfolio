import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/utilities/utils.dart';
import 'package:portfolio/screens/desktop/about_screen.dart' as desktop;
import 'package:portfolio/screens/mobile/about_screen.dart' as mobile;
import 'package:portfolio/widgets/custom_scaffold.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      indexCheck(aboutIndex, ref);
    });

    return CustomScaffold(
      child: screenSize.height > screenSize.width
          ? const mobile.AboutScreen()
          : const desktop.AboutScreen(),
    );
  }
}
