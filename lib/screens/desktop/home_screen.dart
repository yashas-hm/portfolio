import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:marqueer/marqueer.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/data/data.dart';
import 'package:portfolio/core/helpers/app_helpers.dart';
import 'package:portfolio/widgets/connect_button.dart';
import 'package:resize/resize.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height,
      padding: EdgeInsets.only(top: 80.sp),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.primary.withOpacity(0.7),
            Colors.transparent,
          ],
          stops: const [0, 0.6],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: screenSize.width * 0.5,
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
                          fontSize: 50.sp,
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
                              fontSize: 30.sp,
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
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Mobile Apps',
                                textStyle: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.secondary,
                                ),
                              ),
                              TypewriterAnimatedText(
                                'Web Apps',
                                textStyle: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.secondary,
                                ),
                              ),
                              TypewriterAnimatedText(
                                'Websites',
                                textStyle: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.secondary,
                                ),
                              ),
                              TypewriterAnimatedText(
                                'Databases',
                                textStyle: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.secondary,
                                ),
                              ),
                              TypewriterAnimatedText(
                                'APIs',
                                textStyle: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.secondary,
                                ),
                              ),
                              TypewriterAnimatedText(
                                'ML Models',
                                textStyle: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.secondary,
                                ),
                              ),
                            ],
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
                            fontSize: 25.sp,
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
                          ConnectButton(
                            icon: AppConstants.github,
                            link: AppConstants.githubLink,
                            color: const ColorFilter.mode(
                              AppColor.box,
                              BlendMode.srcIn,
                            ),
                            size: Size(50.sp, 50.sp),
                          ),
                          ConnectButton(
                            icon: AppConstants.linkedin,
                            link: AppConstants.linkedinLink,
                            size: Size(50.sp, 50.sp),
                          ),
                          ConnectButton(
                            icon: AppConstants.instagram,
                            link: AppConstants.instaLink,
                            size: Size(50.sp, 50.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                AppConstants.photo,
                height: screenSize.height > screenSize.width
                    ? screenSize.width / 2
                    : screenSize.height / 2,
              ),
            ],
          ),
          Gap(20.sp),
          SizedBox(
            height: screenSize.height / 10,
            child: Marqueer(
              interaction: false,
              padding: EdgeInsets.symmetric(vertical: 10.sp),
              restartAfterInteraction: false,
              pps: 50,
              child: Row(
                children: AppHelper.marqueeSvgChildrenFromMap(
                    Data.logoSkill[0], screenSize),
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height / 10,
            width: screenSize.width,
            child: Marqueer(
              interaction: false,
              padding: EdgeInsets.symmetric(vertical: 10.sp),
              restartAfterInteraction: false,
              direction: MarqueerDirection.ltr,
              pps: 50,
              child: Row(
                children: AppHelper.marqueeSvgChildrenFromMap(
                  Data.logoSkill[1],
                  screenSize,
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height / 10,
            width: screenSize.width,
            child: Marqueer(
              interaction: false,
              padding: EdgeInsets.symmetric(vertical: 10.sp),
              restartAfterInteraction: false,
              pps: 50,
              child: Row(
                children: AppHelper.marqueeSvgChildrenFromMap(
                  Data.logoSkill[2],
                  screenSize,
                ),
              ),
            ),
          ),
          Gap(60.sp),
        ],
      ),
    );
  }
}
