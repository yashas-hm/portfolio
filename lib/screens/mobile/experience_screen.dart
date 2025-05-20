import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/widgets/mobile/experience_item.dart';
import 'package:resize/resize.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  double duration = 0;

  @override
  void initState() {
    duration = allExperiences.length * 800;

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
      width: context.width,
      padding: EdgeInsets.only(top: 70.sp),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Work Experience',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 20.sp,
            ),
          ),
          Gap(15.sp),
          ...buildExperience(),
          Gap(15.sp),
        ],
      ),
    );
  }

  List<Widget> buildExperience() {
    final list = <Widget>[];

    double interval =
        (duration / allExperiences.length).remap(0, duration, 0, 1).toDouble();
    double sum = 0;

    for (var index = 0; index <= allExperiences.length - 1; index++) {
      list.add(
        ExperienceItem(
          experience: allExperiences[index],
          begin: sum,
          end: sum + interval,
          animationController: animationController,
        ),
      );

      sum += interval * 3 / 4;
    }

    return list;
  }
}
