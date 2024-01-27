import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/data/data.dart';
import 'package:portfolio/core/data/model.dart';
import 'package:portfolio/screens/desktop/data_item.dart';
import 'package:portfolio/widgets/connect_button.dart';
import 'package:resize/resize.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            DataItem(
              model: Data.projects[0],
              showSkill: true,
              color: AppColor.tertiary,
            ),
            DataItem(
              model: Data.projects[1],
              showSkill: true,
              color: AppColor.tertiary,
            ),
          ],
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
          color: AppColor.tertiary,
        ),
        Gap(30.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            DataItem(
              model: Data.projects[3],
              showSkill: true,
              color: AppColor.tertiary,
            ),
            DataItem(
              model: Data.projects[4],
              showSkill: true,
              color: AppColor.tertiary,
            ),
          ],
        ),
        Gap(30.sp),
        DataItem(
          model: Data.projects[5],
          showSkill: true,
          color: AppColor.tertiary,
        ),
        Gap(30.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            DataItem(
              model: Data.projects[6],
              showSkill: true,
              color: AppColor.tertiary,
            ),
            DataItem(
              model: Data.projects[7],
              showSkill: true,
              color: AppColor.tertiary,
            ),
          ],
        ),
        Gap(30.sp),
        DataItem(
          model: Data.projects[8],
          showSkill: true,
          color: AppColor.tertiary,
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
        ConnectButton(
          icon: AppConstants.githubAvatar,
          link: AppConstants.githubLink,
          size: Size(screenSize.width / 8, screenSize.width / 8),
        ),
        Gap(30.sp),
      ],
    );
  }

  Widget projectItem(Model model, Size screenSize) {
    bool hover = false;
    return StatefulBuilder(builder: (_, setState) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          splashColor: Colors.transparent,
          onHover: (hovering) => setState(() {
            hover = hovering;
          }),
          onTap: () => launchUrlString(model.link),
          child: Container(
            width: screenSize.width / 2.4,
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
              color: AppColor.box,
              borderRadius: BorderRadius.circular(10.sp),
              boxShadow: hover
                  ? [
                      BoxShadow(
                        color: AppColor.tertiary,
                        spreadRadius: 1.sp,
                        blurRadius: 30.sp,
                      ),
                    ]
                  : [],
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
                      '${DateFormat('MMMM yyyy').format(model.from)} - ${DateFormat('MMMM yyyy').format(model.to)}',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor.withOpacity(0.6),
                        fontSize: 15.sp,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Gap(5.sp),
                    Html(
                      data: '<p style="font-size:${20.sp};text-align: center">'
                          '${model.description.join('<br><br>')}'
                          '</p>',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
