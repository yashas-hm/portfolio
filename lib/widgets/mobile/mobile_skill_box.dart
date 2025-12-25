import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/model/skill.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/core/utilities/utils.dart';
import 'package:resize/resize.dart';

class MobileSkillBox extends StatefulWidget {
  const MobileSkillBox({
    super.key,
    required this.stack,
  });

  final String stack;

  @override
  State<MobileSkillBox> createState() => _MobileSkillBoxState();
}

class _MobileSkillBoxState extends State<MobileSkillBox> with TickerProviderStateMixin {
  late final List<Skill> data;
  late final AnimationController popupAnimationController;
  int duration = 0;
  bool hovering = false;

  @override
  void dispose() {
    popupAnimationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    data = skills[widget.stack]!;
    duration = data.length * 300;
    popupAnimationController = AnimationController(
      vsync: this,
      duration: duration.milliseconds,
    );

    popupAnimationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width / 1.2,
      padding: EdgeInsets.all(15.sp),
      constraints: BoxConstraints(minHeight: context.height / 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.stack,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Gap(15.sp),
          Flexible(
            child: SizedBox(
              width: context.width,
              child: Wrap(
                runSpacing: 10.sp,
                spacing: 10.sp,
                children: buildChildren(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildChildren() {
    final interval =
        (duration / (data.length)).remap(0, duration, 0, 1).toDouble();

    double sum = 0;

    List<Widget> chips = [];

    for (var skill in data) {
      chips.add(
        ScaleTransition(
          scale: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(
            CurvedAnimation(
              parent: popupAnimationController,
              curve: Interval(
                sum,
                sum + interval,
                curve: Curves.bounceIn,
              ),
            ),
          ),
          child: Container(
            height: 30.sp,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8.sp),
              border: Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .tertiary
                    .withValues(alpha: 0.5),
                width: 1.sp,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 8.sp,
              vertical: 5.sp,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (skill.icon != null)
                  SvgPicture.asset(
                    skill.icon!,
                    height: 15.sp,
                    width: 15.sp,
                    colorFilter: filterAccToThemeIfNeeded(context, skill),
                  ),
                Gap(5.sp),
                Text(
                  skill.name,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      sum += interval;
    }

    return chips;
  }
}
