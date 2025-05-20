import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/core/utilities/utils.dart';
import 'package:portfolio/screens/desktop/about_screen.dart' as desktop;
import 'package:portfolio/screens/mobile/about_screen.dart' as mobile;
import 'package:portfolio/widgets/custom_scaffold.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      indexCheck(aboutIndex, ref);
    });

    return CustomScaffold(
      child: context.isMobile
          ? const mobile.AboutScreen()
          : const desktop.AboutScreen(),
    );
  }
}
