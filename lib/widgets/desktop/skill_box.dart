import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:resize/resize.dart';

class SkillBox extends StatefulWidget {
  const SkillBox({
    super.key,
    required this.stack,
    this.xAxis = true,
    this.reverseDirection = false,
  });

  final String stack;
  final bool xAxis;
  final bool reverseDirection;

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
    data = skills[widget.stack]!;
    duration = data.length * 200;
    popupAnimationController = AnimationController(
      vsync: this,
      duration: duration.milliseconds,
    );

    Future.delayed(
      900.milliseconds,
      popupAnimationController.forward,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.click,
      onExit: (_) {
        setState(() {
          hovering = false;
        });
      },
      onEnter: (_) {
        setState(() {
          hovering = true;
        });
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.stack,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(15.sp),
                Expanded(
                  child: SizedBox(
                    width: screenSize.width / 4.3,
                    child: Wrap(
                      runSpacing: 15.sp,
                      spacing: 15.sp,
                      children: buildChildren(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.sp,
                  sigmaY: 10.sp,
                ),
                child: Consumer(
                  builder: (_, ref, __) => GestureDetector(
                    onTap: () => updateIndex(
                      context,
                      ref,
                      projectsIndex,
                      force: true,
                    ),
                    child: AnimatedContainer(
                      duration: 300.milliseconds,
                      width: screenSize.width / 4,
                      height: hovering ? screenSize.width / 4 : 0,
                      alignment: Alignment.center,
                      child: Text(
                        'See Projects',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
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
            height: 40.sp,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8.sp),
              border: Border.all(
                color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
                width: 1.sp,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10.sp,
              vertical: 8.sp,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (data[skill] != '')
                  SvgPicture.asset(
                    data[skill]!,
                    height: 25.sp,
                    width: 25.sp,
                    colorFilter: filterAccToThemeIfNeeded(skill),
                  ),
                Gap(10.sp),
                Text(
                  skill,
                  style: TextStyle(
                    fontSize: 14.sp,
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

  ColorFilter? filterAccToThemeIfNeeded(String skill) {
    if (skill == 'Express.js' || skill == 'Actions') {
      return ColorFilter.mode(
        Theme.of(context).colorScheme.tertiary,
        BlendMode.srcIn,
      );
    }

    return null;
  }
}
