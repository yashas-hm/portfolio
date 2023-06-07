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

    return Container(
      width: screenSize.width,
      height: screenSize.height / 4,
      color: AppColor.bgDarker,
      padding: EdgeInsets.all(20.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: AppColor.bgLight,
                        size: 30.sp,
                      ),
                      SizedBox(
                        width: 20.sp,
                      ),
                      Text(
                        'Navi Mumbai, Maharastra, 400706',
                        style: TextStyle(
                          color: AppColor.bgLight,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
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
                          color: AppColor.bgLight,
                          size: 30.sp,
                        ),
                        SizedBox(
                          width: 20.sp,
                        ),
                        SelectableText(
                          'yashashm.dev@gmail.com',
                          style: TextStyle(
                            color: AppColor.bgLight,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async => launchUrlString(AppConstants.resumeLink),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_present,
                          color: AppColor.bgLight,
                          size: 30.sp,
                        ),
                        SizedBox(
                          width: 20.sp,
                        ),
                        Text(
                          'Resume',
                          style: TextStyle(
                            color: AppColor.bgLight,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Connect with me at:',
                    style: TextStyle(
                      fontFamily: 'noto',
                      fontSize: 25.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColor.bgLight,
                    ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Row(
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
                ],
              ),
            ],
          ),
          Text(
            '©2023 Yashas H Majmudar',
            style: TextStyle(
              color: AppColor.bgLight,
              fontSize: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
