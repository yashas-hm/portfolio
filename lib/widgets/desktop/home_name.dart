import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/widgets/connect_button.dart';
import 'package:resize/resize.dart';

class HomeName extends StatefulWidget {
  const HomeName({super.key});

  @override
  State<HomeName> createState() => _HomeNameState();
}

class _HomeNameState extends State<HomeName> {
  final key = GlobalKey();
  double? boxHeight;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (boxHeight == null) {
        final box = key.currentContext?.findRenderObject() as RenderBox;
        setState(() {
          boxHeight = box.size.height + 30.sp;
        });
      }
    });

    return Container(
      width: screenSize.width / 3.3,
      height: boxHeight ?? screenSize.width / 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.sp),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Image.asset(
            AppConstants.gif,
            fit: BoxFit.fill,
            width: screenSize.width / 3.3,
            height: boxHeight ?? screenSize.width / 5,
          ),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15.sp,
                  sigmaY: 15.sp,
                ),
                child: Container(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              key: key,
              padding: EdgeInsets.all(25.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Hello 👋🏻, I\'m\nYashas H Majmudar',
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'I can build ',
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.textColor,
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: AnimatedTextKit(
                          pause: 1.5.seconds,
                          displayFullTextOnTap: true,
                          animatedTexts: buildWriterText(),
                          repeatForever: true,
                        ),
                      )
                    ],
                  ),
                  Gap(10.sp),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: screenSize.width / 5,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Let\'s Connect 🤝🏻',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.textColor,
                        ),
                      ),
                    ),
                  ),
                  Gap(20.sp),
                  SizedBox(
                    width: screenSize.width / 6,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SocialButton(
                          icon: AppConstants.github,
                          link: AppConstants.githubLink,
                          color: const ColorFilter.mode(
                            AppColor.textColor,
                            BlendMode.srcIn,
                          ),
                          size: Size(40.sp, 40.sp),
                        ),
                        SocialButton(
                          icon: AppConstants.linkedin,
                          link: AppConstants.linkedinLink,
                          size: Size(40.sp, 40.sp),
                        ),
                        SocialButton(
                          icon: AppConstants.instagram,
                          link: AppConstants.instaLink,
                          size: Size(40.sp, 40.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<TypewriterAnimatedText> buildWriterText() {
    final textList = [
      'Mobile Apps',
      'Web Apps',
      'Websites',
      'Databases',
      'APIs',
      'ML Models'
    ];
    final textWidgets = <TypewriterAnimatedText>[];
    for (var text in textList) {
      textWidgets.add(
        TypewriterAnimatedText(
          text,
          textStyle: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.primary,
          ),
        ),
      );
    }
    return textWidgets;
  }
}
