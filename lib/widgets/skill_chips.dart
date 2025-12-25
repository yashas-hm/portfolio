import 'package:flutter/material.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:resize/resize.dart';

class SkillChips extends StatelessWidget {
  const SkillChips({
    super.key,
    required this.skills,
  });

  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    List<Widget> skillsChildren = [];

    for (var skill in skills) {
      skillsChildren.add(
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.isMobile ? 5.sp : 8.sp,
            vertical: context.isMobile ? 2.sp : 3.sp,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          ),
          child: Text(
            skill,
            maxLines: 1,
            style: TextStyle(
              fontSize: context.isMobile ? 10.sp : 14.sp,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      );
    }

    return Wrap(
      runSpacing: context.isMobile ? 3.sp : 5.sp,
      spacing: context.isMobile ? 3.sp : 5.sp,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.start,
      children: skillsChildren,
    );
  }
}
