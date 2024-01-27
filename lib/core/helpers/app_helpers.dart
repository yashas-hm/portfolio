import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/data/model.dart';
import 'package:portfolio/screens/about_screen.dart';
import 'package:portfolio/screens/experience_screen.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/screens/project_screen.dart';
import 'package:resize/resize.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppHelper {
  static List<Widget> marqueeSvgChildrenFromMap(
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
              color: AppColor.tertiary,
              width: 1.sp,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColor.tertiary,
                blurRadius: 10.sp,
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
                  height: 45.sp,
                  width: 45.sp,
                ),
                Gap(8.sp),
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

  static List<Widget> marqueeImgChildrenFromMap(
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
              color: AppColor.tertiary,
              width: 1.sp,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColor.tertiary,
                blurRadius: 10.sp,
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
                Image.asset(
                  data[item]!,
                  fit: BoxFit.cover,
                  height: 45.sp,
                  width: 45.sp,
                ),
                Gap(8.sp),
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

  static Widget getScreen() {
    final ctr = Get.find<NavController>();
    switch (ctr.page.value) {
      case 0:
        return const HomeScreen();
      case 1:
        return const AboutScreen();
      case 2:
        return const ExperienceScreen();
      case 3:
        return const ProjectScreen();
      // case 4:
      //   return const CertificationsScreen();
      default:
        return const HomeScreen();
    }
  }

  static Widget connectionBtn({
    required String icon,
    required String link,
    required String text,
    required Size screenSize,
  }) =>
      MouseRegion(
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

  static Widget iconBtn({
    required IconData asset,
    required String text,
    required Function() onTap,
    required Size screenSize,
  }) =>
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                asset,
                color: AppColor.textColor,
                size: 25.sp,
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

  static Widget achievementItem(Model model, Size screenSize, String logo) {
    bool hover = false;
    return StatefulBuilder(
      builder: (_, setState) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: InkWell(
            onTap: () {},
            splashColor: Colors.transparent,
            onHover: (hovering) => setState(() => hover = hovering),
            child: AnimatedContainer(
              duration: 100.milliseconds,
              child: Container(
                width: screenSize.height > screenSize.width
                    ? screenSize.width / 1.2
                    : screenSize.width / 2.4,
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                  color: AppColor.box,
                  borderRadius: BorderRadius.circular(10.sp),
                  boxShadow: [
                    if (hover)
                      BoxShadow(
                        color: AppColor.primary,
                        spreadRadius: 2.sp,
                        blurRadius: 30.sp,
                      ),
                  ],
                ),
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          model.role,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColor.textColor,
                            fontSize: 25.sp,
                          ),
                        ),
                        Gap(5.sp),
                        Text(
                          model.location,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColor.textColor.withOpacity(0.6),
                            fontSize: 18.sp,
                          ),
                        ),
                        Gap(5.sp),
                        Text(
                          '${DateFormat('MMMM yyyy').format(model.from)} - Present',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColor.textColor.withOpacity(0.6),
                            fontSize: 15.sp,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Gap(5.sp),
                        Html(
                          data:
                              '<p style="font-size:${20.sp};text-align: center">'
                              '${model.description.join('<br><br>')}'
                              '</p>',
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: screenSize.height > screenSize.width
                            ? 50.sp
                            : 60.sp,
                        width: screenSize.height > screenSize.width
                            ? 50.sp
                            : 60.sp,
                        padding: EdgeInsets.all(10.sp),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Image.asset(
                          logo,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
