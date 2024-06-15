import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/core/utilities/utils.dart';
import 'package:portfolio/screens/desktop/project_screen.dart' as desktop;
import 'package:portfolio/screens/mobile//project_screen.dart' as mobile;
import 'package:portfolio/widgets/custom_scaffold.dart';

class ProjectScreen extends ConsumerWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    SchedulerBinding.instance.addPostFrameCallback((_) {
      indexCheck(projectsIndex, ref);
    });

    return CustomScaffold(
      child: context.isMobile
          ? const mobile.ProjectScreen()
          : const desktop.ProjectScreen(),
    );
  }
}
