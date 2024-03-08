import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/helpers/app_utils.dart';
import 'package:resize/resize.dart';

class SkillBox extends StatefulWidget {
  const SkillBox({
    super.key,
    required this.stack,
  });

  final String stack;

  @override
  State<SkillBox> createState() => _SkillBoxState();
}

class _SkillBoxState extends State<SkillBox> with TickerProviderStateMixin {
  late final Map<String, String> data;
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
    data = PortfolioData.skills[widget.stack]!;
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
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width / 1.2,
      padding: EdgeInsets.all(15.sp),
      constraints: BoxConstraints(minHeight: screenSize.height / 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        color: AppColor.box,
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
              width: screenSize.width,
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

    for (var skill in data.keys) {
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
              color: AppColor.background,
              borderRadius: BorderRadius.circular(8.sp),
              border: Border.all(
                color: AppColor.textColor.withOpacity(0.5),
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
                if (data[skill] != '')
                  SvgPicture.asset(
                    data[skill]!,
                    height: 15.sp,
                    width: 15.sp,
                  ),
                Gap(5.sp),
                Text(
                  skill,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColor.textColor,
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
