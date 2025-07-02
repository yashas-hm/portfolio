part of '../about_screen.dart';

class MobileAboutScreen extends StatelessWidget {
  const MobileAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width / 1.2,
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
            width: context.width / 1.2,
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
    double upperMargin,
  ) {
    return Container(
      margin: EdgeInsets.only(top: upperMargin),
      constraints: BoxConstraints(maxHeight: context.height / 8),
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
