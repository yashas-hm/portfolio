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
    this.reverse = false,
  });

  final ExperienceModel experience;

  final bool reverse;

  final double begin;

  final double end;

  final AnimationController animationController;

  @override
  State<ExperienceItem> createState() => _ExperienceItemState();
}

class _ExperienceItemState extends State<ExperienceItem> {
  final key = GlobalKey();
  double? height;
  late double mid;
  late double buffer;

  @override
  void initState() {
    mid = (widget.end + widget.begin) / 2;
    buffer = (widget.end - widget.begin) / 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (height == null) {
        final box = key.currentContext?.findRenderObject() as RenderBox;
        setState(() {
          height = box.size.height + 30.sp;
        });
      }
    });

    return Transform.rotate(
      angle: widget.reverse ? pi : 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.sp),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-0.5, 0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: widget.animationController,
                  curve: Interval(
                    widget.begin,
                    mid,
                    curve: Curves.easeIn,
                  ),
                ),
              ),
              child: FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1).animate(
                  CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval(
                      widget.begin,
                      widget.begin + buffer,
                      curve: Curves.easeIn,
                    ),
                  ),
                ),
                child: Transform.rotate(
                  angle: widget.reverse ? pi : 0,
                  child: Container(
                    key: key,
                    width: screenSize.width / 2.5,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.sp,
                      vertical: 10.sp,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(13.sp),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.experience.role,
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Text(
                          widget.experience.organization,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Gap(15.sp),
                        Text(
                          widget.experience.shortDescription,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18.sp,
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
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: height ?? screenSize.height / 5,
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
                        height: 25.sp,
                        width: 25.sp,
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
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.5, 0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: widget.animationController,
                  curve: Interval(
                    mid,
                    widget.end,
                    curve: Curves.easeIn,
                  ),
                ),
              ),
              child: FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1).animate(
                  CurvedAnimation(
                    parent: widget.animationController,
                    curve: Interval(
                      mid,
                      mid + buffer,
                      curve: Curves.easeIn,
                    ),
                  ),
                ),
                child: Transform.rotate(
                  angle: widget.reverse ? pi : 0,
                  child: Container(
                    alignment: widget.reverse
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    width: screenSize.width / 2.5,
                    child: Text(
                      getTimeLine(widget.experience),
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
