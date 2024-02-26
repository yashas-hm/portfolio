import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/model/achievement_model.dart';
import 'package:portfolio/core/model/data.dart';
import 'package:portfolio/core/model/model.dart';
import 'package:resize/resize.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      padding: EdgeInsets.only(top: 70.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(30.sp),
          Container(
            width: screenSize.width / 1.6,
            padding: EdgeInsets.symmetric(
              horizontal: 25.sp,
              vertical: 20.sp,
            ),
            decoration: BoxDecoration(
              color: AppColor.box,
              borderRadius: BorderRadius.circular(13.sp),
            ),
            alignment: Alignment.center,
            child: Html(
              data:
                  '<p style="font-size:${18.sp};text-align: center">${Data.about}</p>',
            ),
          ),
          Gap(30.sp),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenSize.width / 2.5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Technical achievements',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(30.sp),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: PortfolioData.techAchievements.length,
                      itemBuilder: (ctx, index) => achievements(
                        PortfolioData.techAchievements[index],
                        screenSize,
                        index != 0 ? 30.sp : 0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenSize.width / 2.5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Cultural achievements',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(30.sp),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: PortfolioData.culAchievements.length,
                      itemBuilder: (ctx, index) => achievements(
                        PortfolioData.culAchievements[index],
                        screenSize,
                        index != 0 ? 30.sp : 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(30.sp),
          Text(
            'Hey there! Ready to be blown away? Check out my Instagram for some killer singing and guitar skills! 🎶🎸',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColor.textColor,
              fontSize: 18.sp,
            ),
          ),
          Gap(30.sp),
          // Gap(20.sp),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     AppHelper.achievementItem(
          //       Data.techAchievements,
          //       screenSize,
          //       AppConstants.tech,
          //     ),
          //     AppHelper.achievementItem(
          //       Data.culAchievements,
          //       screenSize,
          //       AppConstants.cul,
          //     ),
          //   ],
          // ),
          // Gap(20.sp),
        ],
      ),
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

  Widget achievements(
    AchievementModel achievement,
    Size screenSize,
    double upperMargin,
  ) {
    return Container(
      width: screenSize.width / 2.5,
      margin: EdgeInsets.only(top: upperMargin),
      constraints: BoxConstraints(maxHeight: screenSize.height / 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.sp),
        color: AppColor.box,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.sp,
        vertical: 15.sp,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            achievement.position,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.secondary,
            ),
          ),
          Gap(30.sp),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  achievement.eventName,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.secondary,
                  ),
                ),
                Flexible(
                  child: AutoSizeText(
                    achievement.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    minFontSize: 5,
                    stepGranularity: 0.1,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
