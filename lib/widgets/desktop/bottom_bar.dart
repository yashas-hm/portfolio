import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:resize/resize.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    required this.noConnection,
  });

  final bool noConnection;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      color: AppColor.box,
      padding: EdgeInsets.symmetric(
        horizontal: 25.sp,
        vertical: 15.sp,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  bottomBarConnection(
                    asset: AppConstants.location,
                    text: 'Navi Mumbai',
                    onTap: () {},
                    screenSize: screenSize,
                  ),
                  Gap(15.sp),
                  bottomBarConnection(
                    asset: AppConstants.mail,
                    text: 'Mail Me',
                    onTap: () =>
                        launchUrl(Uri.parse('mailto:${AppConstants.emailId}')),
                    screenSize: screenSize,
                  ),
                  Gap(15.sp),
                  bottomBarConnection(
                    asset: AppConstants.cv,
                    text: 'My Resume',
                    onTap: () => launchUrlString(AppConstants.resumeLink),
                    screenSize: screenSize,
                  ),
                ],
              ),
              Expanded(child: Container()),
              if (!noConnection)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    bottomBarSocial(
                      icon: AppConstants.github,
                      link: AppConstants.githubLink,
                      text: 'GitHub',
                      screenSize: screenSize,
                    ),
                    Gap(15.sp),
                    bottomBarSocial(
                      icon: AppConstants.linkedin,
                      link: AppConstants.linkedinLink,
                      text: 'LinkedIn',
                      screenSize: screenSize,
                    ),
                    Gap(15.sp),
                    bottomBarSocial(
                      icon: AppConstants.instagram,
                      link: AppConstants.instaLink,
                      text: 'Instagram',
                      screenSize: screenSize,
                    ),
                  ],
                ),
            ],
          ),
          Gap(30.sp),
          Text(
            'Built with ❤️ by Yashas H Majmudar',
            style: TextStyle(
              color: AppColor.textColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomBarSocial({
    required String icon,
    required String link,
    required String text,
    required Size screenSize,
  }) =>
      MouseRegion(
        opaque: false,
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => launchUrlString(link),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                height: 25.sp,
                width: 25.sp,
              ),
              Gap(10.sp),
              Text(
                text,
                style: TextStyle(
                  color: AppColor.textColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: AppColor.textColor,
                ),
              ),
            ],
          ),
        ),
      );

  Widget bottomBarConnection({
    required String asset,
    required String text,
    required Function() onTap,
    required Size screenSize,
  }) =>
      MouseRegion(
        opaque: false,
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                asset,
                height: 20.sp,
                width: 20.sp,
                colorFilter: const ColorFilter.mode(
                  AppColor.textColor,
                  BlendMode.srcIn,
                ),
              ),
              Gap(10.sp),
              Text(
                text,
                style: TextStyle(
                  color: AppColor.textColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      );
}
