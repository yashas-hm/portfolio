import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/color_constants.dart';
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
        'Front-End',
        xAxis: false,
        reverseDirection: true,
      ),
      skillBox(
        'Back-End',
        xAxis: true,
        reverseDirection: true,
      ),
      skillBox(
        'Database',
        xAxis: true,
        reverseDirection: false,
      ),
      skillBox(
        'DevOps',
        xAxis: false,
        reverseDirection: true,
      ),
      skillBox(
        'Machine Learning',
        xAxis: false,
        reverseDirection: false,
      ),
      skillBox(
        'Languages',
        xAxis: true,
        reverseDirection: true,
      ),
      skillBox(
        'Others',
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
    final screenSize = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) => Opacity(
        opacity: fade.value,
        child: Container(
          width: screenSize.width / 4.3,
          height: screenSize.height / 4,
          transform: Matrix4.translationValues(
            (xAxis ? slide.value : 0) * (reverseDirection ? -1 : 1),
            (xAxis ? 0 : slide.value) * (reverseDirection ? -1 : 1),
            0,
          ),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.sp),
            color: AppColor.box,
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
