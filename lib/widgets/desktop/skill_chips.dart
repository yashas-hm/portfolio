import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/color_constants.dart';
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
            horizontal: 8.sp,
            vertical: 3.sp,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            color: AppColor.primary.withOpacity(0.1),
          ),
          child: Text(
            skill,
            maxLines: 1,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColor.primary,
            ),
          ),
        ),
      );
    }

    return Wrap(
      runSpacing: 5.sp,
      spacing: 5.sp,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.start,
      children: skillsChildren,
    );
  }
}
