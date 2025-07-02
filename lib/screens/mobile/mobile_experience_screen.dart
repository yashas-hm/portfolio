part of '../experience_screen.dart';

class MobileExperienceScreen extends StatefulWidget {
  const MobileExperienceScreen({super.key});

  @override
  State<MobileExperienceScreen> createState() => _MobileExperienceScreenState();
}

class _MobileExperienceScreenState extends State<MobileExperienceScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  double duration = 0;

  @override
  void initState() {
    duration = allExperiences.length * 800;

    animationController = AnimationController(
      vsync: this,
      duration: duration.milliseconds,
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (!animationController.isCompleted) {
        animationController.forward();
      }
    });

    return Container(
      width: context.width,
      padding: EdgeInsets.only(top: 70.sp),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Work Experience',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 20.sp,
            ),
          ),
          Gap(15.sp),
          ...buildExperience(),
          Gap(15.sp),
        ],
      ),
    );
  }

  List<Widget> buildExperience() {
    final list = <Widget>[];

    double interval =
        (duration / allExperiences.length).remap(0, duration, 0, 1).toDouble();
    double sum = 0;

    for (var index = 0; index <= allExperiences.length - 1; index++) {
      list.add(
        MobileExperienceItem(
          experience: allExperiences[index],
          begin: sum,
          end: sum + interval,
          animationController: animationController,
        ),
      );

      sum += interval * 3 / 4;
    }

    return list;
  }
}
