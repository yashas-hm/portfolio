import 'package:flutter/material.dart';
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
            horizontal: 5.sp,
            vertical: 2.sp,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          ),
          child: Text(
            skill,
            maxLines: 1,
            style: TextStyle(
              fontSize: 10.sp,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      );
    }

    return Wrap(
      runSpacing: 3.sp,
      spacing: 3.sp,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.start,
      children: skillsChildren,
    );
  }
}
