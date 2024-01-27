import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/helpers/app_helpers.dart';
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
                  AppHelper.iconBtn(
                    asset: Icons.location_pin,
                    text: 'Navi Mumbai',
                    onTap: () {},
                    screenSize: screenSize,
                  ),
                  Gap(15.sp),
                  AppHelper.iconBtn(
                    asset: Icons.mail_outline_rounded,
                    text: 'Mail Me',
                    onTap: () =>
                        launchUrl(Uri.parse('mailto:yashashm.dev@gmail.com')),
                    screenSize: screenSize,
                  ),
                  Gap(15.sp),
                  AppHelper.iconBtn(
                    asset: Icons.file_present,
                    text: 'Read my Resume',
                    onTap: () => launchUrlString(AppConstants.resumeLink),
                    screenSize: screenSize,
                  ),
                ],
              ),
              Expanded(child: Container()),
              if(!noConnection)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppHelper.connectionBtn(
                    icon: AppConstants.github,
                    link: AppConstants.githubLink,
                    text: 'GitHub',
                    screenSize: screenSize,
                  ),
                  Gap(15.sp),
                  AppHelper.connectionBtn(
                    icon: AppConstants.linkedin,
                    link: AppConstants.linkedinLink,
                    text: 'LinkedIn',
                    screenSize: screenSize,
                  ),
                  Gap(15.sp),
                  AppHelper.connectionBtn(
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
            'Built with ♥️ by Yashas H Majmudar',
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
}
