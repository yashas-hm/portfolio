import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/widgets/desktop/home_name.dart';
import 'package:portfolio/widgets/desktop/skill_box.dart';
import 'package:resize/resize.dart';

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
        'Front-End',
        xAxis: true,
        reverseDirection: true,
      ),
      skillBox(
        'Back-End',
        xAxis: true,
        reverseDirection: false,
      ),
      skillBox(
        'Database',
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
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              nameWidget(),
            ],
          ),
          Gap(30.sp),
          FadeTransition(
            opacity: fade,
            child: Text(
              'My Skills 🚀',
              style: TextStyle(
                fontSize: 23.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Gap(30.sp),
          Flexible(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 30.sp,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 30.sp,
                crossAxisSpacing: 30.sp,
                childAspectRatio: 1.5,
              ),
              itemCount: skills.length,
              itemBuilder: (ctx, index) => skills[index],
            ),
          ),
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
          child: SkillBox(
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
          child: const HomeName(),
        ),
      ),
    );
  }
}
