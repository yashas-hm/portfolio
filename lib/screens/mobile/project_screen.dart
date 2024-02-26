import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/model/data.dart';
import 'package:portfolio/screens/mobile/data_item.dart';
import 'package:portfolio/widgets/connect_button.dart';
import 'package:resize/resize.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

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
            'Projects',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColor.textColor,
              fontSize: 30.sp,
            ),
          ),
          Gap(30.sp),
          DataItem(
            model: Data.projects[0],
            showSkill: true,
          ),
          Gap(30.sp),
          DataItem(
            model: Data.projects[1],
            showSkill: true,
          ),
          Gap(30.sp),
          Text(
            'Side Projects',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColor.textColor,
              fontSize: 30.sp,
            ),
          ),
          Gap(30.sp),
          DataItem(
            model: Data.projects[2],
            showSkill: true,
          ),
          Gap(30.sp),
          DataItem(
            model: Data.projects[3],
            showSkill: true,
          ),
          Gap(30.sp),
          DataItem(
            model: Data.projects[4],
            showSkill: true,
          ),
          Gap(30.sp),
          DataItem(
            model: Data.projects[5],
            showSkill: true,
          ),
          Gap(30.sp),
          DataItem(
            model: Data.projects[6],
            showSkill: true,
          ),
          Gap(30.sp),
          DataItem(
            model: Data.projects[7],
            showSkill: true,
          ),
          Gap(30.sp),
          DataItem(
            model: Data.projects[8],
            showSkill: true,
          ),
          Gap(30.sp),
          Text(
            'More projects on Github',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColor.textColor,
              fontSize: 26.sp,
            ),
          ),
          Gap(30.sp),
          SocialButton(
            icon: AppConstants.githubAvatar,
            link: AppConstants.githubLink,
            size: Size(
              screenSize.width / 3,
              screenSize.width / 3,
            ),
          ),
          Gap(30.sp),
        ],
      ),
    );
  }
}
