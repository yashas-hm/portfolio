import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/model/achievement_model.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:resize/resize.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
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
            width: context.width / 1.6,
            padding: EdgeInsets.symmetric(
              horizontal: 25.sp,
              vertical: 20.sp,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(13.sp),
            ),
            alignment: Alignment.center,
            child: Html(
              data:
                  '<p style="font-size:${18.sp};text-align: center">$about</p>',
            ),
          ),
          Gap(30.sp),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.width / 2.5,
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
                      itemCount: techAchievementsList.length,
                      itemBuilder: (ctx, index) => achievements(
                        context,
                        techAchievementsList[index],
                        context.screenSize,
                        index != 0 ? 30.sp : 0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.width / 2.5,
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
                      itemCount: culAchievementsList.length,
                      itemBuilder: (ctx, index) => achievements(
                        context,
                        culAchievementsList[index],
                        context.screenSize,
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
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 18.sp,
            ),
          ),
          Gap(30.sp),
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
      width: context.width / 2.5,
      margin: EdgeInsets.only(top: upperMargin),
      constraints: BoxConstraints(maxHeight: context.height / 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.sp),
        color: Theme.of(context).colorScheme.secondary,
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
              color: Theme.of(context).colorScheme.primary,
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
                    color: Theme.of(context).colorScheme.primary,
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
