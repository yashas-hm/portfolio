import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/core/model/experience_model.dart';
import 'package:portfolio/widgets/desktop/experience_item.dart';
import 'package:resize/resize.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final List<ExperienceModel> experience;

  double duration = 0;

  @override
  void initState() {
    experience = PortfolioData.experience
        .where((element) => element.identifier != 'internships')
        .toList();

    duration = experience.length * 800;

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
      padding: EdgeInsets.only(top: 70.sp),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Experience',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 30.sp,
            ),
          ),
          Gap(30.sp),
          ...buildChildren(),
        ],
      ),
    );
  }

  List<Widget> buildChildren() {
    final children = <Widget>[];
    double interval =
        (duration / experience.length).remap(0, duration, 0, 1).toDouble();
    double sum = 0;

    for (var index = 0; index <= experience.length - 1; index++) {
      children.add(
        ExperienceItem(
          experience: experience[index],
          begin: sum,
          end: sum + interval,
          animationController: animationController,
          reverse: index % 2 != 0,
        ),
      );

      sum += interval;
    }

    return children;
  }
}
