part of '../experience_screen.dart';

class WebExperienceScreen extends StatefulWidget {
  const WebExperienceScreen({super.key});

  @override
  State<WebExperienceScreen> createState() => _WebExperienceScreenState();
}

class _WebExperienceScreenState extends State<WebExperienceScreen>
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
      padding: EdgeInsets.only(top: 70.sp),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Experience',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 30.sp,
            ),
          ),
          Gap(30.sp),
          ...buildChildren(),
        ],
      ),
    );
  }

  List<Widget> buildChildren() {
    final children = <Widget>[];
    double interval =
        (duration / allExperiences.length).remap(0, duration, 0, 1).toDouble();
    double sum = 0;

    for (var index = 0; index <= allExperiences.length - 1; index++) {
      children.add(
        WebExperienceItem(
          experience: allExperiences[index],
          begin: sum,
          end: sum + interval,
          animationController: animationController,
          reverse: index % 2 != 0,
        ),
      );

      sum += interval;
    }

    return children;
  }
}
