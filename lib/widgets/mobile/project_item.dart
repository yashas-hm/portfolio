import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/model/project_model.dart';
import 'package:portfolio/core/utilities/dialog_utils.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/widgets/custom_cached_image.dart';
import 'package:portfolio/widgets/mobile/skill_chips.dart';
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
  @override
  Widget build(BuildContext context) {
    final height = context.screenSize.height / 4;

    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          widget.begin,
          widget.end,
          curve: Curves.easeIn,
        ),
      )),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.sp),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCachedImage(
              height: height / 2.3,
              imageUrl: widget.project.image,
            ),
            Gap(5.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: AutoSizeText(
                widget.project.name,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                minFontSize: 5,
                stepGranularity: 0.1,
              ),
            ),
            Gap(5.sp),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: AutoSizeText(
                  widget.project.shortDescription,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                  minFontSize: 5,
                  stepGranularity: 0.1,
                ),
              ),
            ),
            Gap(5.sp),
            SkillChips(
              skills: widget.project.skills,
            ),
            Gap(10.sp),
            GestureDetector(
              onTap: () => launchUrlString(widget.project.link),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.sp),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  vertical: 2.sp,
                  horizontal: 5.sp,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.sp),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  widget.project.codeAvailable
                      ? 'View Code ↗'
                      : 'View Website ↗',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            if (widget.project.longDescription != '') Gap(10.sp),
            if (widget.project.longDescription != '')
              GestureDetector(
                onTap: () => showMore(
                  context: context,
                  text: widget.project.longDescription,
                  skills: widget.project.skills,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.sp),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    vertical: 2.sp,
                    horizontal: 5.sp,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Text(
                    'Read More',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            Gap(10.sp),
          ],
        ),
      ),
    );
  }
}
