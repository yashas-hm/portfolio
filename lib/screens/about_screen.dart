import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:marqueer/marqueer.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/helpers/app_helpers.dart';
import 'package:portfolio/core/model/data.dart';
import 'package:portfolio/screens/desktop/about_screen.dart' as desktop;
import 'package:portfolio/screens/mobile/about_screen.dart' as mobile;
import 'package:portfolio/widgets/custom_scaffold.dart';
import 'package:resize/resize.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      AppHelper.indexCheck(AppConstants.aboutIndex);
    });

    return CustomScaffold(
      child: screenSize.height > screenSize.width
          ? const mobile.AboutScreen()
          : const desktop.AboutScreen(),
    );

    return CustomScaffold(
      child: Container(
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
            Gap(30.sp),
            Container(
              width: screenSize.width * 0.8,
              decoration: BoxDecoration(
                color: AppColor.box,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              alignment: Alignment.center,
              child: SelectionArea(
                child: Html(
                  data:
                      '<p style="font-size:${20.sp};text-align: center">${Data.about}</p>',
                ),
              ),
            ),
            Gap(30.sp),
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
                  children: AppHelper.marqueeImgChildrenFromMap(
                    Data.softSkills,
                    screenSize,
                  ),
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
                  children: AppHelper.marqueeImgChildrenFromMap(
                    Data.projectSkills,
                    screenSize,
                  ),
                ),
              ),
            ),
            Gap(30.sp),
            screenSize.height > screenSize.width
                ? const mobile.AboutScreen()
                : const desktop.AboutScreen(),
          ],
        ),
      ),
    );
  }
}
