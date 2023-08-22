import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/widgets/connect_button.dart';
import 'package:resize/resize.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return screenSize.height>screenSize.width?mobileBody(screenSize):body(screenSize);
  }

  Widget mobileBody(Size screenSize) => Container(
    width: screenSize.width,
    height: screenSize.height/3,
    color: AppColor.bottomBar,
    padding: EdgeInsets.symmetric(
      horizontal: 10.sp,
      vertical: 5.sp,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: screenSize.height / 20,
          width: screenSize.width / 2,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Connect with me at:',
              style: TextStyle(
                fontFamily: 'roboto',
                fontSize: 20.sp,
                fontWeight: FontWeight.w300,
                color: AppColor.textColor,
              ),
            ),
          ),
        ),
        SizedBox(
          width: screenSize.width/1.5,
          child: const Row(
            mainAxisSize: MainAxisSize.max,
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
        SizedBox(height: 5.sp,),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_pin,
                color: AppColor.textColor,
                size: screenSize.height * 0.03,
              ),
              SizedBox(
                width: 10.sp,
              ),
              Container(
                height: screenSize.height / 20,
                width: screenSize.width / 2,
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Navi Mumbai, Maharastra, 400706',
                    style: TextStyle(
                      color: AppColor.textColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () async =>
                launchUrl(Uri.parse('mailto:yashashm.dev@gmail.com')),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.mail_outline,
                  color: AppColor.textColor,
                  size: screenSize.height * 0.03,
                ),
                SizedBox(
                  width: 10.sp,
                ),
                Container(
                  height: screenSize.height / 20,
                  width: screenSize.width / 2,
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SelectableText(
                      'yashashm.dev@gmail.com',
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async =>
                  launchUrlString(AppConstants.resumeLink),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.file_present,
                    color: AppColor.textColor,
                    size: screenSize.height * 0.03,
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Container(
                    height: screenSize.height / 20,
                    width: screenSize.width / 2,
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Here\'s my Resume......',
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.sp,
        ),
        SizedBox(
          height: screenSize.height / 20,
          width: screenSize.width / 2,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Built with ♥️ by Yashas H Majmudar',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget body(Size screenSize) => Container(
    width: screenSize.width,
    height: screenSize.height / 4,
    color: AppColor.bottomBar,
    padding: EdgeInsets.symmetric(
      horizontal: 10.sp,
      vertical: 5.sp,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: AppColor.textColor,
                        size: screenSize.height * 0.03,
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Container(
                        height: screenSize.height / 25,
                        width: screenSize.width / 4,
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Navi Mumbai, Maharastra, 400706',
                            style: TextStyle(
                              color: AppColor.textColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async =>
                      launchUrl(Uri.parse('mailto:yashashm.dev@gmail.com')),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mail_outline,
                        color: AppColor.textColor,
                        size: screenSize.height * 0.03,
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Container(
                        height: screenSize.height / 25,
                        width: screenSize.width / 4,
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: SelectableText(
                            'yashashm.dev@gmail.com',
                            style: TextStyle(
                              color: AppColor.textColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async =>
                        launchUrlString(AppConstants.resumeLink),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_present,
                          color: AppColor.textColor,
                          size: screenSize.height * 0.03,
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Container(
                          height: screenSize.height / 25,
                          width: screenSize.width / 4,
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Here\'s my Resume......',
                              style: TextStyle(
                                color: AppColor.textColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: screenSize.width / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: screenSize.height / 25,
                    width: screenSize.width / 5,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Connect with me at:',
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColor.textColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  const Row(
                    mainAxisSize: MainAxisSize.max,
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
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenSize.height / 25,
          width: screenSize.width / 5,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Built with ♥️ by Yashas H Majmudar',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
