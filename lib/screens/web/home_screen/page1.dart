part of '../web_home_screen.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> slide;
  late final Animation<double> fade;

  final int duration = 1000;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: 800.milliseconds,
    );

    slide = Tween<double>(
      begin: 200,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );

    fade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0,
          0.5,
          curve: Curves.easeIn,
        ),
      ),
    );

    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final skills = [
      skillBox(
        'Languages',
        xAxis: false,
        reverseDirection: true,
      ),
      skillBox(
        'Mobile & Frontend',
        xAxis: true,
        reverseDirection: true,
      ),
      skillBox(
        'Backend',
        xAxis: true,
        reverseDirection: false,
      ),
      skillBox(
        'Databases',
        xAxis: false,
        reverseDirection: true,
      ),
      skillBox(
        'ML/AI',
        xAxis: false,
        reverseDirection: false,
      ),
      skillBox(
        'DevOps',
        xAxis: true,
        reverseDirection: true,
      ),
      skillBox(
        'Cloud & Tools',
        xAxis: true,
        reverseDirection: false,
      ),
      skillBox(
        'IoT',
        xAxis: false,
        reverseDirection: false,
      ),
    ];

    return Container(
      padding: EdgeInsets.only(top: 90.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          nameWidget(),
          Gap(30.sp),
          Flexible(child: ProjectsComponent()),
          Flexible(child: ExperiencesComponent()),
          Flexible(child: MetricsComponent()),
          Gap(30.sp),
          Flexible(child: SkillsComponent()),
        ],
      ),
    );
  }

  Widget skillBox(
    String stack, {
    bool xAxis = true,
    bool reverseDirection = false,
  }) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) => Opacity(
        opacity: fade.value,
        child: Container(
          width: context.width / 4.3,
          height: context.height / 4,
          transform: Matrix4.translationValues(
            (xAxis ? slide.value : 0) * (reverseDirection ? -1 : 1),
            (xAxis ? 0 : slide.value) * (reverseDirection ? -1 : 1),
            0,
          ),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.sp),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: WebSkillBox(
            stack: stack,
            xAxis: xAxis,
            reverseDirection: reverseDirection,
          ),
        ),
      ),
    );
  }

  Widget nameWidget() {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) => Opacity(
        opacity: fade.value,
        child: Transform.translate(
          offset: Offset(-slide.value, 0),
          child: const WebHomeName(),
        ),
      ),
    );
  }
}
