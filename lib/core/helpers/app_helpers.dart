import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/model/experience_model.dart';
import 'package:portfolio/core/model/model.dart';
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
              color: AppColor.primary,
              width: 1.sp,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColor.primary,
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
              color: AppColor.primary,
              width: 1.sp,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColor.primary,
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

  static void indexCheck(int index) {
    final ctr = Get.find<NavController>();
    if (ctr.currentIndex.value != index) {
      ctr.pageIndex = index;
      ctr.currentIndex.value = index;
    }
  }

  static Widget bottomBarSocial({
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

  static Widget bottomBarConnection({
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

  static Widget achievementItem(Model model, Size screenSize, String logo) {
    bool hover = false;
    return StatefulBuilder(
      builder: (_, setState) {
        return MouseRegion(
          opaque: false,
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

  static String getTimeLine(ExperienceModel model) {
    final from = DateFormat('MMMM yyyy').format(model.from);
    final to = DateFormat('MMMM yyyy').format(model.to);
    final present = model.to.isAfter(DateTime.now());
    return '$from — ${present ? 'Present' : to}';
  }

  static Future<(bool, String)> sendMessage({
    required String email,
    required String text,
  }) async {
    try {} catch (err) {
      log(err.toString());
    }

    final response = await http.post(
      Uri.parse(const String.fromEnvironment('BASE_URL')),
      headers: <String, String>{
        'Authorization': 'Bearer ${const String.fromEnvironment('JWT')}',
      },
      body: jsonEncode({'email': email, 'message': text}),
    );

    print(response.body);

    final responseBody = jsonDecode(response.body);

    return (
      responseBody['success'] == 'true',
      responseBody['message'].toString(),
    );

    return (
      false,
      'Communication hiccup! Unexpected error encountered. Retry later, please!',
    );
  }
}

extension RemapExtension on num {
  num remap(num minExtent, num maxExtent, num minRange, num maxRange) {
    return (this - minExtent) /
            (maxExtent - minExtent) *
            (maxRange - minRange) +
        minRange;
  }
}

extension GetByIdentifier<T> on List {
  T getByIdentifier(String identifier) {
    return firstWhere(
      (element) => element.identifier == identifier,
      orElse: () => throw Exception('Invalid Identifier'),
    );
  }
}
