import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/helpers/dialog_helper.dart';
import 'package:portfolio/core/helpers/widgets_helper.dart';
import 'package:portfolio/core/model/project_model.dart';
import 'package:resize/resize.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectItem extends StatefulWidget {
  const ProjectItem({
    super.key,
    required this.project,
    required this.begin,
    required this.end,
    required this.animationController,
  });

  final ProjectModel project;

  final double begin;

  final double end;

  final AnimationController animationController;

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  double buffer = 0;
  bool hovering = false;

  @override
  void initState() {
    buffer = (widget.end - widget.begin) / 2;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final height = screenSize.width / 4.6;
    final width = screenSize.width / 5;

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 0.5),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: widget.animationController,
          curve: Interval(
            widget.begin,
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
              widget.begin,
              widget.begin + buffer,
              curve: Curves.easeIn,
            ),
          ),
        ),
        child: MouseRegion(
          opaque: false,
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => hovering = true),
          onExit: (_) => setState(() => hovering = false),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.sp),
              color: AppColor.box,
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      widget.project.image,
                      height: height / 2.1,
                      width: width,
                      fit: BoxFit.fill,
                    ),
                    Gap(10.sp),
                    Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        widget.project.name,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        minFontSize: 5,
                        stepGranularity: 0.1,
                      ),
                    ),
                    Gap(10.sp),
                    Expanded(
                      child: Container(
                        width: width,
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: AutoSizeText(
                          widget.project.shortDescription,
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          minFontSize: 5,
                          stepGranularity: 0.1,
                        ),
                      ),
                    ),
                    Gap(10.sp),
                    Container(
                      width: width,
                      padding: EdgeInsets.only(
                        right: 10.sp,
                        left: 10.sp,
                        bottom: 15.sp,
                      ),
                      child:
                          WidgetHelper.skillChipBuilder(widget.project.skills),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13.sp),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10.sp,
                        sigmaY: 10.sp,
                      ),
                      child: AnimatedContainer(
                        duration: 300.milliseconds,
                        width: width,
                        height: hovering ? height : 0,
                        color: Colors.black12,
                        padding: EdgeInsets.all(10.sp),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (widget.project.longDescription.isNotEmpty)
                              Flexible(
                                child: GestureDetector(
                                  onTap: () => DialogHelper.showMore(
                                    context: context,
                                    text: widget.project.longDescription,
                                    skills: widget.project.skills,
                                  ),
                                  child: Text(
                                    'Read More',
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            Flexible(
                              child: GestureDetector(
                                onTap: () =>
                                    launchUrlString(widget.project.link),
                                child: Text(
                                  widget.project.codeAvailable
                                      ? 'View Code ↗'
                                      : 'Visit Site ↗',
                                  style: TextStyle(
                                    fontSize: 16.sp,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
