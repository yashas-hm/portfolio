import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/helpers/app_helpers.dart';
import 'package:portfolio/screens/desktop/project_screen.dart' as desktop;
import 'package:portfolio/screens/mobile//project_screen.dart' as mobile;
import 'package:portfolio/widgets/custom_scaffold.dart';

class ProjectScreen extends ConsumerWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      AppHelper.indexCheck(AppConstants.projectsIndex, ref);
    });

    return CustomScaffold(
      child: screenSize.height > screenSize.width
          ? const mobile.ProjectScreen()
          : const desktop.ProjectScreen(),
    );
  }
}
