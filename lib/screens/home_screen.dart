import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marqueer/marqueer.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/data/data.dart';
import 'package:portfolio/widgets/connect_button.dart';
import 'package:resize/resize.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return screenSize.height > screenSize.width
        ? mobileWelcome(screenSize)
        : welcome(screenSize);
  }

  Widget mobileWelcome(Size screenSize) => Container(
        width: screenSize.width,
        height: screenSize.height,
        margin: EdgeInsets.only(top: 80.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppConstants.photo,
              height: screenSize.width / 1.3,
            ),
            SizedBox(
              height: 10.sp,
            ),
            SizedBox(
              width: screenSize.height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Hi there, I\'m\nYashas H Majmudar',
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 50.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Row(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'I can build ',
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.textColor,
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: AnimatedTextKit(
                          displayFullTextOnTap: true,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Mobile Apps',
                              textStyle: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.primary,
                              ),
                            ),
                            TypewriterAnimatedText(
                              'Web Apps',
                              textStyle: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.primary,
                              ),
                            ),
                            TypewriterAnimatedText(
                              'Websites',
                              textStyle: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.primary,
                              ),
                            ),
                            TypewriterAnimatedText(
                              'Databases',
                              textStyle: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.primary,
                              ),
                            ),
                            TypewriterAnimatedText(
                              'APIs',
                              textStyle: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.primary,
                              ),
                            ),
                            TypewriterAnimatedText(
                              'ML Models',
                              textStyle: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.primary,
                              ),
                            ),
                          ],
                          repeatForever: true,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Container(
                    width: screenSize.width,
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Connect with me at:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColor.textColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  SizedBox(
                    width: screenSize.width,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const ConnectButton(
                          animation: AppConstants.githubAnim,
                          link: AppConstants.githubLink,
                        ),
                        SizedBox(
                          width: 30.sp,
                        ),
                        const ConnectButton(
                          animation: AppConstants.linkedinAnim,
                          link: AppConstants.linkedinLink,
                        ),
                        SizedBox(
                          width: 30.sp,
                        ),
                        const ConnectButton(
                          animation: AppConstants.instaAnim,
                          link: AppConstants.instaLink,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.sp,
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
                  children: childrenFromMap(
                    Data.logoSkill[0],
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
                direction: MarqueerDirection.ltr,
                pps: 50,
                child: Row(
                  children: childrenFromMap(
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
                  children: childrenFromMap(
                    Data.logoSkill[2],
                    screenSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget welcome(Size screenSize) => Container(
        width: screenSize.width,
        height: screenSize.height,
        margin: EdgeInsets.only(top: 80.sp),
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
                  width: screenSize.width * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Hi there, I\'m\nYashas H Majmudar',
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
                              displayFullTextOnTap: true,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Mobile Apps',
                                  textStyle: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.primary,
                                  ),
                                ),
                                TypewriterAnimatedText(
                                  'Web Apps',
                                  textStyle: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.primary,
                                  ),
                                ),
                                TypewriterAnimatedText(
                                  'Websites',
                                  textStyle: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.primary,
                                  ),
                                ),
                                TypewriterAnimatedText(
                                  'Databases',
                                  textStyle: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.primary,
                                  ),
                                ),
                                TypewriterAnimatedText(
                                  'APIs',
                                  textStyle: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.primary,
                                  ),
                                ),
                                TypewriterAnimatedText(
                                  'ML Models',
                                  textStyle: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.primary,
                                  ),
                                ),
                              ],
                              repeatForever: true,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: screenSize.width / 5,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Connect with me at:',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w300,
                              color: AppColor.textColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      SizedBox(
                        width: screenSize.width / 5,
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ConnectButton(
                              animation: AppConstants.githubAnim,
                              link: AppConstants.githubLink,
                            ),
                            ConnectButton(
                              animation: AppConstants.linkedinAnim,
                              link: AppConstants.linkedinLink,
                            ),
                            ConnectButton(
                              animation: AppConstants.instaAnim,
                              link: AppConstants.instaLink,
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
            SizedBox(
              height: screenSize.height / 10,
              child: Marqueer(
                interaction: false,
                padding: EdgeInsets.symmetric(vertical: 10.sp),
                restartAfterInteraction: false,
                pps: 50,
                child: Row(
                  children: childrenFromMap(Data.logoSkill[0], screenSize),
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
                  children: childrenFromMap(
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
                  children: childrenFromMap(
                    Data.logoSkill[2],
                    screenSize,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60.sp,
            ),
          ],
        ),
      );

  List<Widget> childrenFromMap(
    Map<String, String> data,
    Size screenSize,
  ) {
    final list = <Widget>[];

    for (var item in data.keys) {
      list.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.sp),
          padding: EdgeInsets.symmetric(
            vertical: 3.sp,
            horizontal: 5.sp,
          ),
          height: screenSize.height / 15,
          width: screenSize.height > screenSize.width
              ? screenSize.width / 3
              : screenSize.width / 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            border: Border.all(
              color: AppColor.primary,
              width: 1.sp,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColor.primary,
                blurRadius: 5.sp,
              ),
            ],
            color: AppColor.background,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  data[item]!,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  item,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return list;
  }
}
