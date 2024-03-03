import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/helpers/app_helpers.dart';
import 'package:portfolio/core/model/project_model.dart';
import 'package:portfolio/widgets/mobile/project_item.dart';
import 'package:resize/resize.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> with SingleTickerProviderStateMixin {
  final List<ProjectModel> projects = [
    PortfolioData.projects.getByIdentifier('dentavacation'),
    PortfolioData.projects.getByIdentifier('spotter'),
    PortfolioData.projects.getByIdentifier('asl'),
    PortfolioData.projects.getByIdentifier('glow-app-bar'),
  ];
  late final AnimationController animationController;
  final ctr = Get.find<NavController>();
  bool hovering = false;
  double duration = 0;

  @override
  void initState() {
    duration = projects.length * 300.0;

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

      if (item != null &&
          item.itemLeadingEdge <= 0.7 &&
          !animationController.isAnimating) {
        animationController.forward();
      } else if (item != null && item.itemLeadingEdge > 0.7) {
        animationController.reverse();
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
        Gap(15.sp),
        Text(
          'Projects',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap(15.sp),
        SizedBox(
          width: screenSize.width / 1.1,
          child: GridView(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15.sp,
              crossAxisSpacing: 15.sp,
              childAspectRatio: 0.6,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: buildChildren(),
          ),
        ),
        Gap(15.sp),
        SizedBox(
          width: screenSize.width / 1.2,
          child: GestureDetector(
            onTap: () => Get.find<NavController>().updateIndex(
              AppConstants.projectsIndex,
              force: true,
            ),
            child: Text(
              'Prepped for a follow-up of my creative journey? 🦾\n(Read More)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColor.textColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> buildChildren() {
    final list = <Widget>[];
    double interval =
        (duration / projects.length).remap(0, duration, 0, 1).toDouble();
    double begin = 0;

    for (var data in projects) {
      list.add(ProjectItem(
        project: data,
        begin: begin,
        end: begin + interval,
        animationController: animationController,
      ));
      begin += interval * 3 / 4;
    }
    return list;
  }
}
