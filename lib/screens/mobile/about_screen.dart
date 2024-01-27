import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/data/data.dart';
import 'package:portfolio/core/data/model.dart';
import 'package:portfolio/screens/mobile/data_item.dart';
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
        DataItem(model: Data.por[0], showSkill: true,),
        Gap(20.sp),
        DataItem(model: Data.por[1], showSkill: true,),
        Gap(20.sp),
        DataItem(model: Data.por[2], showSkill: true,),
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
        achievementItem(
          Data.techAchievements,
          screenSize,
          AppConstants.tech,
        ),
        Gap(20.sp),
        achievementItem(
          Data.culAchievements,
          screenSize,
          AppConstants.cul,
        ),
        Gap(20.sp),
      ],
    );
  }

  Widget achievementItem(Model model, Size screenSize, String logo) =>
      GestureDetector(
        onTap: () {},
        child: Container(
          width: screenSize.width / 1.2,
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
                    data: '<p style="font-size:${20.sp};text-align: center">'
                        '${model.description.join('<br><br>')}'
                        '</p>',
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 50.sp,
                  width: 50.sp,
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
      );
}
