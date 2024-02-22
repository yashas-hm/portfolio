import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/model/data.dart';
import 'package:portfolio/screens/desktop/data_item.dart';
import 'package:resize/resize.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      padding: EdgeInsets.only(top: 70.sp),
      alignment: Alignment.center,
      child: Column(
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
          Gap(20.sp),
          DataItem(model: Data.experience[0]),
          Gap(20.sp),
          Text(
            'Internships',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColor.textColor,
              fontSize: 30.sp,
            ),
          ),
          Gap(20.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              DataItem(model: Data.experience[1]),
              DataItem(model: Data.experience[2]),
            ],
          ),
          Gap(20.sp),
          DataItem(model: Data.experience[3]),
          Gap(20.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              DataItem(model: Data.experience[4]),
              DataItem(model: Data.experience[5]),
            ],
          ),
          Gap(20.sp),
          DataItem(model: Data.experience[6]),
          Gap(20.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              DataItem(model: Data.experience[7]),
              SizedBox(
                width: screenSize.width / 2.4,
              ),
            ],
          ),
          Gap(20.sp),
        ],
      ),
    );
  }
}
