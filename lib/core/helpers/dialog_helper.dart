import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/helpers/widgets_helper.dart';
import 'package:resize/resize.dart';

class DialogHelper {
  static void showMore({
    required BuildContext context,
    required String text,
    required List<String> skills,
  }) {
    final screenSize = MediaQuery.of(context).size;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (_, __, ___) => Container(),
      transitionDuration: 500.milliseconds,
      transitionBuilder: (_, a, __, ___) => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15.sp * Curves.easeInOut.transform(a.value),
          sigmaX: 15.sp * Curves.easeInOut.transform(a.value),
        ),
        child: Transform.scale(
          scale: Curves.easeInOut.transform(a.value),
          child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              width: screenSize.width / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.sp),
                color: AppColor.box,
              ),
              padding: EdgeInsets.all(15.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (text.isNotEmpty)
                    Text(
                      text,
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.justify,
                    ),
                  if (text.isNotEmpty) Gap(15.sp),
                  Text(
                    'Tech Stack & Tools',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  Gap(15.sp),
                  WidgetHelper.skillChipBuilder(skills),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void showToast(String text, Size screenSize){
    showToastWidget(
      Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13.sp),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: 10.sp,
                sigmaX: 10.sp,
              ),
              child: Container(
                constraints: BoxConstraints(
                  minWidth: 100.sp,
                  maxWidth: screenSize.width / 2.5,
                ),
                height: 40.sp,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          Container(
            height: 40.sp,
            constraints: BoxConstraints(
              minWidth: 100.sp,
              maxWidth: screenSize.width / 2.5,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 8.sp,
              vertical: 3.sp,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.sp),
              color: Colors.transparent,
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColor.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      // context: context,
      position: ToastPosition.bottom,
      duration: 2500.milliseconds,
    );
  }
}
