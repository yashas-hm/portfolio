import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marqueer/marqueer.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/data/data.dart';
import 'package:portfolio/core/data/model.dart';
import 'package:resize/resize.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      padding: EdgeInsets.only(top: 70.sp),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColor.textColor,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(
            height: 30.sp,
          ),
          Container(
            width: screenSize.width / 1.3,
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
              color: AppColor.box,
              borderRadius: BorderRadius.circular(10.sp),
            ),
            alignment: Alignment.center,
            child: SelectableText(
              AppConstants.about,
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 18.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30.sp,
          ),
          SizedBox(
            height: screenSize.height / 10,
            width: screenSize.width,
            child: Marqueer(
              interaction: false,
              padding: EdgeInsets.symmetric(vertical: 10.sp),
              restartAfterInteraction: false,
              direction: MarqueerDirection.ltr,
              pps: 50,
              child: Row(
                children: childrenFromMap(Data.softSkills, screenSize),
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height / 10,
            width: screenSize.width,
            child: Marqueer(
              interaction: false,
              padding: EdgeInsets.symmetric(vertical: 10.sp),
              restartAfterInteraction: false,
              direction: MarqueerDirection.rtl,
              pps: 50,
              child: Row(
                children: childrenFromMap(Data.projectSkills, screenSize),
              ),
            ),
          ),
          SizedBox(
            height: 30.sp,
          ),
          screenSize.height > screenSize.width
              ? mobileBody(screenSize)
              : body(screenSize),
        ],
      ),
    );
  }

  Widget body(Size screenSize) => Column(
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
          SizedBox(
            height: 20.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              porItem(Data.por[0], screenSize),
              porItem(Data.por[1], screenSize),
            ],
          ),
          SizedBox(
            height: 20.sp,
          ),
          porItem(Data.por[2], screenSize),
          SizedBox(
            height: 20.sp,
          ),
          Text(
            'Achievements',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColor.textColor,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              achievementItem(
                Data.techAchievements,
                screenSize,
                AppConstants.tech,
              ),
              achievementItem(
                Data.culAchievements,
                screenSize,
                AppConstants.cul,
              ),
            ],
          ),
          SizedBox(
            height: 20.sp,
          ),
        ],
      );

  Widget mobileBody(Size screenSize) => Column(
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
          SizedBox(
            height: 20.sp,
          ),
          porItemMobile(Data.por[0], screenSize),
          SizedBox(
            height: 20.sp,
          ),
          porItemMobile(Data.por[1], screenSize),
          SizedBox(
            height: 20.sp,
          ),
          porItemMobile(Data.por[2], screenSize),
          SizedBox(
            height: 20.sp,
          ),
          Text(
            'Achievements',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColor.textColor,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),
          achievementItem(
            Data.techAchievements,
            screenSize,
            AppConstants.tech,
          ),
          SizedBox(
            height: 20.sp,
          ),
          achievementItem(
            Data.culAchievements,
            screenSize,
            AppConstants.cul,
          ),
          SizedBox(
            height: 20.sp,
          ),
        ],
      );

  Widget porItem(Model model, Size screenSize) => Container(
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
                  model.role,
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
                  model.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor.withOpacity(0.8),
                    fontSize: 20.sp,
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
                  '${DateFormat('MMMM yyyy').format(model.from)} - ${DateFormat('MMMM yyyy').format(model.to)}',
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
                    height: 40.sp,
                    width: 40.sp,
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
          ],
        ),
      );

  Widget achievementItem(Model model, Size screenSize, String logo) =>
      Container(
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
                  model.role,
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
                  '${DateFormat('MMMM yyyy').format(model.from)} - Present',
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
                SizedBox(
                  width: screenSize.width,
                  child: Text(
                    model.description.join('\n\n'),
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColor.textColor,
                      fontSize: 18.sp,
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
      );

  Widget porItemMobile(Model model, Size screenSize) => Container(
        width: screenSize.height > screenSize.width
            ? screenSize.width / 1.2
            : screenSize.width / 2.4,
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          color: AppColor.box,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        alignment: Alignment.center,
        child: Column(
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
            SizedBox(
              height: 5.sp,
            ),
            Text(
              model.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColor.textColor.withOpacity(0.8),
                fontSize: 20.sp,
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
              '${DateFormat('MMMM yyyy').format(model.from)} - ${DateFormat('MMMM yyyy').format(model.from)}',
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
                height: 40.sp,
                width: 40.sp,
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
      );

  List<Widget> childrenFromMap(
    Map<String, String> data,
    Size screenSize,
  ) {
    final list = <Widget>[];

    for (var item in data.keys) {
      list.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.sp),
          padding: EdgeInsets.symmetric(
            vertical: 3.sp,
            horizontal: 5.sp,
          ),
          height: screenSize.height / 15,
          width: screenSize.height > screenSize.width
              ? screenSize.width / 3
              : screenSize.width / 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            border: Border.all(
              color: AppColor.primary,
              width: 1.sp,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColor.primary,
                blurRadius: 5.sp,
              ),
            ],
            color: AppColor.background,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  data[item]!,
                  fit: BoxFit.cover,
                  height: screenSize.height / 18,
                  width: screenSize.height / 18,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  item,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return list;
  }
}
