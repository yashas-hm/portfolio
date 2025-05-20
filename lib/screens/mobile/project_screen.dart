import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/widgets/connect_button.dart';
import 'package:portfolio/widgets/mobile/project_item.dart';
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
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (!animationController.isCompleted) {
        animationController.forward();
      }
    });

    return Container(
      width: context.width / 1.2,
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
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 20.sp,
            ),
          ),
          Gap(15.sp),
          GridView(
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
          Gap(15.sp),
          Text(
            'Unlock the treasure trove of my brilliance – behold all my projects on GitHub!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
            ),
          ),
          Gap(15.sp),
          SocialButton(
            icon: githubAvatar,
            link: githubLink,
            size: Size(
              context.width / 4,
              context.width / 4,
            ),
          ),
          Gap(15.sp),
        ],
      ),
    );
  }

  List<Widget> buildChildren() {
    final list = <Widget>[];
    double interval =
        (duration / projectsList.length).remap(0, duration, 0, 1).toDouble();
    double begin = 0;

    for (var data in projectsList) {
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
