import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/widgets/rain.dart';
import 'package:portfolio/widgets/redirect_text.dart';
import 'package:resize/resize.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.bgDark,
      body: ParallaxRain(
        child: Container(
          padding: EdgeInsets.all(20.sp),
          height: screenSize.height,
          width: screenSize.width,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 40.sp,
                  foregroundImage: const AssetImage(
                    AppConstants.avatar,
                  ),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Flexible(
                child: Container(
                  width: screenSize.width,
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.sp),
                    color: AppColor.bgLight,
                  ),
                  child: Text(
                    AppConstants.mobileText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: AppColor.bgDark,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              RedirectText(
                text: 'Resume →',
                function: () => launchUrlString(AppConstants.resumeLink),
                fontSize: 22.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
