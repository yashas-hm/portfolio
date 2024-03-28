import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/model/achievement_model.dart';
import 'package:resize/resize.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width / 1.2,
      padding: EdgeInsets.only(top: 70.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(15.sp),
          Container(
            width: screenSize.width / 1.2,
            padding: EdgeInsets.symmetric(
              horizontal: 15.sp,
              vertical: 10.sp,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(13.sp),
            ),
            alignment: Alignment.center,
            child: Html(
              data:
                  '<p style="font-size:${12.sp};text-align: center">$about</p>',
            ),
          ),
          Gap(12.sp),
          Text(
            'Technical achievements',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(15.sp),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: techAchievementsList.length,
            itemBuilder: (ctx, index) => achievements(
              context,
              techAchievementsList[index],
              screenSize,
              index != 0 ? 15.sp : 0,
            ),
          ),
          Gap(15.sp),
          Text(
            'Cultural achievements',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(15.sp),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: culAchievementsList.length,
            itemBuilder: (ctx, index) => achievements(
              context,
              culAchievementsList[index],
              screenSize,
              index != 0 ? 15.sp : 0,
            ),
          ),
          Gap(15.sp),
          Text(
            'Hey there! Ready to be blown away? Check out my Instagram for some killer singing and guitar skills! 🎶🎸',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 12.sp,
            ),
          ),
          Gap(15.sp),
        ],
      ),
    );
  }

  Widget achievements(
    BuildContext context,
    AchievementModel achievement,
    Size screenSize,
    double upperMargin,
  ) {
    return Container(
      margin: EdgeInsets.only(top: upperMargin),
      constraints: BoxConstraints(maxHeight: screenSize.height / 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.sp),
        color: Theme.of(context).colorScheme.secondary,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.sp,
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
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Gap(15.sp),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  achievement.eventName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Flexible(
                  child: AutoSizeText(
                    achievement.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    minFontSize: 5,
                    stepGranularity: 0.1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
