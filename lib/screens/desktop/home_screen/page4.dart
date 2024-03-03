import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/helpers/app_helpers.dart';
import 'package:portfolio/core/model/project_model.dart';
import 'package:portfolio/widgets/desktop/project_item.dart';
import 'package:resize/resize.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final List<ProjectModel> projects;
  final ctr = Get.find<NavController>();
  bool hovering = false;
  double duration = 0;

  @override
  void initState() {
    projects = [
      PortfolioData.projects.getByIdentifier('dentavacation'),
      PortfolioData.projects.getByIdentifier('spotter'),
      PortfolioData.projects.getByIdentifier('asl'),
    ];

    duration = projects.length * 200.0;

    animationController = AnimationController(
      vsync: this,
      duration: duration.milliseconds,
    );

    ctr.listener.itemPositions.addListener(() {
      ItemPosition? item;

      for (var position in ctr.listener.itemPositions.value) {
        if (position.index == AppConstants.projectsIndex) {
          item = position;
        }
      }

      if (item != null && item.itemLeadingEdge <= 0.7) {
        animationController.forward();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(30.sp),
        Text(
          'Projects',
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap(30.sp),
        SizedBox(
          width: screenSize.width / 1.1,
          child: Wrap(
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.spaceEvenly,
            runSpacing: 30.sp,
            children: buildChildren(),
          ),
        ),
        Gap(30.sp),
        StatefulBuilder(
          builder: (ctx, setState) {
            return MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.click,
              onEnter: (_) => setState(() => hovering = true),
              onExit: (_) => setState(() => hovering = false),
              child: GestureDetector(
                onTap: () => Get.find<NavController>().updateIndex(
                  AppConstants.projectsIndex,
                  force: true,
                ),
                child: Text(
                  'Prepped for a follow-up of my creative journey? ${hovering ? '🦾' : '📽️'}\n(Read More)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: hovering ? AppColor.primary : AppColor.textColor,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  List<Widget> buildChildren() {
    final list = <Widget>[];
    final interval = (duration / projects.length).remap(0, duration, 0, 1);
    final releaseBefore = interval / projects.length;
    double sum = 0.0;

    for (var project in projects) {
      list.add(ProjectItem(
        project: project,
        begin: sum,
        end: sum + interval,
        animationController: animationController,
      ));
      sum += interval - releaseBefore;
    }

    return list;
  }
}
