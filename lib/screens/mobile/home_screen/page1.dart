part of '../mobile_home_screen.dart';

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
          const MobileHomeName(),
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
      'Languages',
      'Front-End',
      'Back-End',
      'Database',
      'ML/AI',
      'DevOps',
      'Cloud & Tools',
      'IoT',
    ];

    for (var index = 0; index < skills.length; index++) {
      list.add(MobileSkillBox(
        stack: skills[index],
      ));

      if (index != skills.length - 1) {
        list.add(Gap(25.sp));
      }
    }

    return list;
  }
}
