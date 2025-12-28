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
          ExperiencesComponent(),
          
          MetricsComponent(),
          Gap(30.sp),
          SkillsComponent(),
        ],
      ),
    );
  }
}
