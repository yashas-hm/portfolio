import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_constants.dart';
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
      color: Theme.of(context).colorScheme.secondary,
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
                    context,
                    asset: location,
                    text: 'Navi Mumbai',
                    onTap: () {},
                    screenSize: screenSize,
                  ),
                  Gap(15.sp),
                  bottomBarConnection(
                    context,
                    asset: mail,
                    text: 'Mail Me',
                    onTap: () => launchUrl(Uri.parse('mailto:$emailId')),
                    screenSize: screenSize,
                  ),
                  Gap(15.sp),
                  bottomBarConnection(
                    context,
                    asset: cv,
                    text: 'My Resume',
                    onTap: () => launchUrlString(resumeLink),
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
                      context,
                      icon: github,
                      link: githubLink,
                      text: 'GitHub',
                      screenSize: screenSize,
                    ),
                    Gap(15.sp),
                    bottomBarSocial(
                      context,
                      icon: linkedin,
                      link: linkedinLink,
                      text: 'LinkedIn',
                      screenSize: screenSize,
                    ),
                    Gap(15.sp),
                    bottomBarSocial(
                      context,
                      icon: instagram,
                      link: instaLink,
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
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomBarSocial(
    BuildContext context, {
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
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ),
      );

  Widget bottomBarConnection(
    BuildContext context, {
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
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.tertiary,
                  BlendMode.srcIn,
                ),
              ),
              Gap(10.sp),
              Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      );
}
