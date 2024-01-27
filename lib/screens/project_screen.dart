import 'package:flutter/material.dart';
import 'package:resize/resize.dart';
import 'package:portfolio/screens/desktop/project_screen.dart' as desktop;
import 'package:portfolio/screens/mobile//project_screen.dart' as mobile;

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      padding: EdgeInsets.only(top: 70.sp),
      alignment: Alignment.center,
      child: screenSize.height > screenSize.width
          ? const mobile.ProjectScreen()
          : const desktop.ProjectScreen(),
    );
  }
}
