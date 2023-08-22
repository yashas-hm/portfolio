import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/data/data.dart';
import 'package:portfolio/core/data/model.dart';
import 'package:portfolio/widgets/connect_button.dart';
import 'package:resize/resize.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      padding: EdgeInsets.only(top: 70.sp),
      alignment: Alignment.center,
      child: screenSize.height > screenSize.width
          ? mobileBody(screenSize)
          : body(screenSize),
    );
  }

  Widget projectItem(Model model, Size screenSize) => Container(
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
                  model.name,
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
                  DateFormat('MMMM yyyy').format(model.from),
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
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async => await launchUrlString(model.link),
                  child: Container(
                    height:
                        screenSize.height > screenSize.width ? 35.sp : 40.sp,
                    width: screenSize.height > screenSize.width ? 35.sp : 40.sp,
                    padding: EdgeInsets.all(10.sp),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.primary,
                    ),
                    child: Image.asset(
                      AppConstants.link,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: screenSize.height > screenSize.width ? 50.sp : 60.sp,
                width: screenSize.height > screenSize.width ? 50.sp : 60.sp,
                padding: EdgeInsets.all(10.sp),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.box,
                ),
                child: SvgPicture.asset(
                  model.linkName,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );

  Widget projectItemMobile(Model model, Size screenSize) => Container(
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
              model.name,
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
              DateFormat('MMMM yyyy').format(model.from),
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
            SizedBox(
              height: 5.sp,
            ),
            GestureDetector(
              onTap: () async => await launchUrlString(model.link),
              child: Container(
                height:
                screenSize.height > screenSize.width ? 35.sp : 40.sp,
                width: screenSize.height > screenSize.width ? 35.sp : 40.sp,
                padding: EdgeInsets.all(10.sp),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.primary,
                ),
                child: Image.asset(
                  AppConstants.link,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: screenSize.height > screenSize.width ? 50.sp : 60.sp,
            width: screenSize.height > screenSize.width ? 50.sp : 60.sp,
            padding: EdgeInsets.all(10.sp),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.box,
            ),
            child: SvgPicture.asset(
              model.linkName,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    ),
  );

  Widget body(Size screenSize) => Column(
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
          SizedBox(
            height: 30.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              projectItem(Data.projects[0], screenSize),
              projectItem(Data.projects[1], screenSize),
            ],
          ),
          SizedBox(
            height: 30.sp,
          ),
          projectItem(Data.projects[2], screenSize),
          SizedBox(
            height: 30.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              projectItem(Data.projects[3], screenSize),
              projectItem(Data.projects[4], screenSize),
            ],
          ),
          SizedBox(
            height: 30.sp,
          ),
          projectItem(Data.projects[5], screenSize),
          SizedBox(
            height: 30.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              projectItem(Data.projects[6], screenSize),
              projectItem(Data.projects[7], screenSize),
            ],
          ),
          SizedBox(
            height: 40.sp,
          ),
          Text(
            'More projects on Github',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColor.textColor,
              fontSize: 26.sp,
            ),
          ),
          SizedBox(
            height: 30.sp,
          ),
          ConnectButton(
            animation: AppConstants.githubAnim,
            link: AppConstants.githubLink,
            size: Size(screenSize.width / 8, screenSize.width / 8),
          ),
          SizedBox(
            height: 30.sp,
          ),
        ],
      );

  Widget mobileBody(Size screenSize) => Column(
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
          SizedBox(
            height: 30.sp,
          ),
          projectItemMobile(Data.projects[0], screenSize),
          SizedBox(
            height: 30.sp,
          ),
          projectItemMobile(Data.projects[1], screenSize),
          SizedBox(
            height: 30.sp,
          ),
          projectItemMobile(Data.projects[2], screenSize),
          SizedBox(
            height: 30.sp,
          ),
          projectItemMobile(Data.projects[3], screenSize),
          SizedBox(
            height: 30.sp,
          ),
          projectItemMobile(Data.projects[4], screenSize),
          SizedBox(
            height: 30.sp,
          ),
          projectItemMobile(Data.projects[5], screenSize),
          SizedBox(
            height: 30.sp,
          ),
          projectItemMobile(Data.projects[6], screenSize),
          SizedBox(
            height: 40.sp,
          ),
          projectItemMobile(Data.projects[7], screenSize),
          SizedBox(
            height: 40.sp,
          ),
          Text(
            'More projects on Github',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColor.textColor,
              fontSize: 26.sp,
            ),
          ),
          SizedBox(
            height: 30.sp,
          ),
          ConnectButton(
            animation: AppConstants.githubAnim,
            link: AppConstants.githubLink,
            size: Size(
              screenSize.width / 3,
              screenSize.width / 3,
            ),
          ),
          SizedBox(
            height: 30.sp,
          ),
        ],
      );
}
