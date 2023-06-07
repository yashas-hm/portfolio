import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:resize/resize.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ConnectButton extends StatelessWidget {
  const ConnectButton({Key? key, required this.animation, required this.link,}) : super(key: key);

  final String animation;

  final String link;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await launchUrlString(link),
      child: Container(
        height:60.sp,
        width:60.sp,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.primaryLight,
        ),
        padding: EdgeInsets.all(3.sp),
        child: Lottie.asset(animation),
      ),
    );
  }
}
