import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/data/data.dart';
import 'package:portfolio/core/data/model.dart';
import 'package:portfolio/widgets/rain.dart';
import 'package:resize/resize.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ParallaxRain(
      dropColors: [
        AppColor.primary,
        AppColor.primary.withOpacity(0.6),
        AppColor.primary.withOpacity(0.8),
      ],
      child: Container(
        width: screenSize.width,
        padding: EdgeInsets.only(top: 70.sp),
        alignment: Alignment.center,
        child: screenSize.height > screenSize.width
            ? mobileBody(screenSize)
            : body(screenSize),
      ),
    );
  }

  Widget body(Size screenSize) => Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Work Experience',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColor.textColor,
          fontSize: 30.sp,
        ),
      ),
      SizedBox(
        height: 20.sp,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          experienceItemMobile(Data.experience[0], screenSize),
          experienceItemMobile(Data.experience[1], screenSize),
        ],
      ),
      SizedBox(
        height: 20.sp,
      ),
      experienceItemMobile(Data.experience[2], screenSize),
      SizedBox(
        height: 20.sp,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          experienceItemMobile(Data.experience[3], screenSize),
          experienceItemMobile(Data.experience[4], screenSize),
        ],
      ),
      SizedBox(
        height: 20.sp,
      ),
      experienceItemMobile(Data.experience[5], screenSize),
      SizedBox(
        height: 20.sp,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          experienceItemMobile(Data.experience[6], screenSize),
          experienceItemMobile(Data.experience[7], screenSize),
        ],
      ),
      SizedBox(
        height: 20.sp,
      ),
    ],
  );

  Widget mobileBody(Size screenSize) => Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Work Experience',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColor.textColor,
          fontSize: 30.sp,
        ),
      ),
      SizedBox(
        height: 20.sp,
      ),
      experienceItemMobile(Data.experience[0], screenSize),
      SizedBox(
        height: 20.sp,
      ),
      experienceItemMobile(Data.experience[1], screenSize),
      SizedBox(
        height: 20.sp,
      ),
      experienceItemMobile(Data.experience[2], screenSize),
      SizedBox(
        height: 20.sp,
      ),
      experienceItemMobile(Data.experience[3], screenSize),
      SizedBox(
        height: 20.sp,
      ),
      experienceItemMobile(Data.experience[4], screenSize),
      SizedBox(
        height: 20.sp,
      ),
      experienceItemMobile(Data.experience[5], screenSize),
      SizedBox(
        height: 20.sp,
      ),
      experienceItemMobile(Data.experience[6], screenSize),
      SizedBox(
        height: 20.sp,
      ),
      experienceItemMobile(Data.experience[7], screenSize),
      SizedBox(
        height: 20.sp,
      ),
    ],
  );

  Widget experienceItemMobile(Model model, Size screenSize) => Container(
    width: screenSize.height > screenSize.width
        ? screenSize.width / 1.2
        : screenSize.width / 2.4,
    padding: EdgeInsets.all(10.sp),
    decoration: BoxDecoration(
      color: AppColor.box,
      borderRadius: BorderRadius.circular(10.sp),
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
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColor.textColor,
                fontSize: 25.sp,
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Text(
              model.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColor.textColor.withOpacity(0.8),
                fontSize: 20.sp,
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Text(
              model.location,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColor.textColor.withOpacity(0.6),
                fontSize: 18.sp,
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Text(
              '${DateFormat('MMMM yyyy').format(model.from)} - ${model.to.year == 2300 ? 'Present':DateFormat('MMMM yyyy').format(model.to)}',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColor.textColor.withOpacity(0.6),
                fontSize: 15.sp,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Text(
              model.description.join('\n\n'),
              softWrap: true,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColor.textColor,
                fontSize: 18.sp,
              ),
            ),
            // SizedBox(
            //   height: 5.sp,
            // ),
            // GestureDetector(
            //   onTap: () async => await launchUrlString(model.link),
            //   child: Container(
            //     height: 40.sp,
            //     width: 40.sp,
            //     padding: EdgeInsets.all(10.sp),
            //     decoration: const BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: AppColor.primary,
            //     ),
            //     child: Image.asset(
            //       AppConstants.link,
            //       fit: BoxFit.contain,
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    ),
  );
}
