import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/model/data.dart';
import 'package:portfolio/core/model/model.dart';
import 'package:portfolio/core/helpers/app_helpers.dart';
import 'package:portfolio/screens/desktop/data_item.dart';
import 'package:resize/resize.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Leadership Experience',
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
            DataItem(
              model: Data.por[0],
              showSkill: true,
              color: AppColor.primary,
            ),
            DataItem(
              model: Data.por[1],
              showSkill: true,
              color: AppColor.primary,
            ),
          ],
        ),
        Gap(20.sp),
        DataItem(
          model: Data.por[2],
          showSkill: true,
          color: AppColor.primary,
        ),
        Gap(20.sp),
        Text(
          'Achievements',
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
            AppHelper.achievementItem(
              Data.techAchievements,
              screenSize,
              AppConstants.tech,
            ),
            AppHelper.achievementItem(
              Data.culAchievements,
              screenSize,
              AppConstants.cul,
            ),
          ],
        ),
        Gap(20.sp),
      ],
    );
  }

  Widget achievementItem(Model model, Size screenSize, String logo) {
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
                width: screenSize.width / 2.4,
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
                        height: 60.sp,
                        width: 60.sp,
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
