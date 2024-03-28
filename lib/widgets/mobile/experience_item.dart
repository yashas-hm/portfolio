import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/model/experience_model.dart';
import 'package:portfolio/core/utilities/dialog_utils.dart';
import 'package:portfolio/core/utilities/utils.dart';
import 'package:resize/resize.dart';

class ExperienceItem extends StatefulWidget {
  const ExperienceItem({
    super.key,
    required this.experience,
    required this.begin,
    required this.end,
    required this.animationController,
  });

  final ExperienceModel experience;

  final double begin;

  final double end;

  final AnimationController animationController;

  @override
  State<ExperienceItem> createState() => _ExperienceItemState();
}

class _ExperienceItemState extends State<ExperienceItem> {
  final key = GlobalKey();
  double? height;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (height == null) {
        final box = key.currentContext?.findRenderObject() as RenderBox;
        setState(() {
          height = box.size.height + 15.sp;
        });
      }
    });

    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          widget.begin,
          widget.end,
          curve: Curves.easeIn,
        ),
      )),
      child: SizedBox(
        width: screenSize.width / 1.2,
        height: height ?? screenSize.height / 1.5,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                transform: Matrix4.translationValues(
                  -screenSize.width / 4,
                  0,
                  0,
                ),
                width: screenSize.width / 2,
                child: Transform.rotate(
                  angle: -pi / 2,
                  child: Text(
                    getTimeLine(widget.experience),
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(
                  left: 30.sp,
                ),
                height: height ?? screenSize.height / 1.5,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height ?? screenSize.height / 5,
                      width: 15.sp,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 1.5.sp,
                              height: height ?? screenSize.height / 5,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 15.sp,
                              width: 15.sp,
                              decoration: BoxDecoration(
                                color: darkText,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 3.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(20.sp),
                    Expanded(
                      child: Container(
                        key: key,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.sp),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.sp,
                          vertical: 10.sp,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.experience.role,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            Text(
                              widget.experience.organization,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Gap(15.sp),
                            Text(
                              widget.experience.shortDescription,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            if (widget.experience.skills.isNotEmpty) Gap(15.sp),
                            if (widget.experience.skills.isNotEmpty)
                              MouseRegion(
                                opaque: false,
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => showMore(
                                    context: context,
                                    text: widget.experience.longDescription,
                                    skills: widget.experience.skills,
                                  ),
                                  child: Text(
                                    'Read More',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
