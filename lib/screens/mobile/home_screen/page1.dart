import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/widgets/mobile/home_name.dart';
import 'package:portfolio/widgets/mobile/skill_box.dart';
import 'package:resize/resize.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 70.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HomeName(),
          Gap(15.sp),
          Text(
            'My Skills 🚀',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(15.sp),
          ...buildChildren(),
        ],
      ),
    );
  }

  List<Widget> buildChildren() {
    final list = <Widget>[];
    final skills = [
      'Front-End',
      'Back-End',
      'Database',
      'DevOps',
      'Machine Learning',
      'Languages',
      'Others',
      'IoT',
    ];

    for (var index = 0; index < skills.length; index++) {
      list.add(SkillBox(
        stack: skills[index],
      ));

      if (index != skills.length - 1) {
        list.add(Gap(25.sp));
      }
    }

    return list;
  }
}
