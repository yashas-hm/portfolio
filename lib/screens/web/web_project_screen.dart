part of '../project_screen.dart';

class WebProjectScreen extends StatefulWidget {
  const WebProjectScreen({super.key});

  @override
  State<WebProjectScreen> createState() => _WebProjectScreenState();
}

class _WebProjectScreenState extends State<WebProjectScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  double duration = 0;

  @override
  void initState() {
    duration = projectsList.length * 300;

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
            'Projects',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 30.sp,
            ),
          ),
          Gap(30.sp),
          Container(
            width: context.width,
            padding: EdgeInsets.symmetric(horizontal: 30.sp),
            child: Wrap(
              runAlignment: WrapAlignment.start,
              alignment: WrapAlignment.spaceEvenly,
              spacing: 30.sp,
              runSpacing: 30.sp,
              children: buildChildren(),
            ),
          ),
          Gap(30.sp),
          Text(
            'Unlock the treasure trove of my brilliance – behold all my projects on GitHub!',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
            ),
          ),
          Gap(30.sp),
          SocialButton(
            icon: githubAvatar,
            link: githubLink,
            size: Size(context.width / 8, context.width / 8),
          ),
          Gap(30.sp),
        ],
      ),
    );
  }

  List<Widget> buildChildren() {
    final children = <Widget>[];
    double interval =
        (duration / projectsList.length).remap(0, duration, 0, 1).toDouble();
    double sum = 0;

    for (var index = 0; index <= projectsList.length - 1; index++) {
      children.add(
        WebProjectItem(
          project: projectsList[index],
          begin: sum,
          end: sum + interval,
          animationController: animationController,
        ),
      );

      sum += interval - (interval / 3);
    }

    return children;
  }
}
