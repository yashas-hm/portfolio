import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/widgets/connect_button.dart';
import 'package:portfolio/widgets/desktop/project_item.dart';
import 'package:resize/resize.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  double duration = 0;

  @override
  void initState() {
    duration = projectsList.length * 300;

    animationController = AnimationController(
      vsync: this,
      duration: duration.milliseconds,
    );

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

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (!animationController.isCompleted) {
        animationController.forward();
      }
    });

    return Container(
      width: screenSize.width,
      padding: EdgeInsets.only(top: 70.sp),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Projects',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 30.sp,
            ),
          ),
          Gap(30.sp),
          Container(
            width: screenSize.width,
            padding: EdgeInsets.symmetric(horizontal: 30.sp),
            child: Wrap(
              runAlignment: WrapAlignment.start,
              alignment: WrapAlignment.spaceEvenly,
              spacing: 30.sp,
              runSpacing: 30.sp,
              children: buildChildren(),
            ),
          ),
          Gap(30.sp),
          Text(
            'Unlock the treasure trove of my brilliance – behold all my projects on GitHub!',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
            ),
          ),
          Gap(30.sp),
          SocialButton(
            icon: githubAvatar,
            link: githubLink,
            size: Size(screenSize.width / 8, screenSize.width / 8),
          ),
          Gap(30.sp),
        ],
      ),
    );
  }

  List<Widget> buildChildren() {
    final children = <Widget>[];
    double interval =
        (duration / projectsList.length).remap(0, duration, 0, 1).toDouble();
    double sum = 0;

    for (var index = 0; index <= projectsList.length - 1; index++) {
      children.add(
        ProjectItem(
          project: projectsList[index],
          begin: sum,
          end: sum + interval,
          animationController: animationController,
        ),
      );

      sum += interval - (interval / 3);
    }

    return children;
  }
}
