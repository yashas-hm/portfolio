import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:resize/resize.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ConnectButton extends StatelessWidget {
  const ConnectButton({
    Key? key,
    required this.animation,
    required this.link,
    this.size,
  }) : super(key: key);

  final String animation;

  final String link;

  final Size? size;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async => await launchUrlString(link),
        child: Container(
          height: size?.height != null
              ? size!.height
              : screenSize.height > screenSize.width
                  ? screenSize.height / 20
                  : screenSize.width / 25,
          width: size?.width != null
              ? size!.width
              : screenSize.height > screenSize.width
                  ? screenSize.height / 20
                  : screenSize.width / 25,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(
                screenSize.height > screenSize.width ? 10.sp : 20.sp),
            border: Border.all(
              color: AppColor.primary,
              width: 1.sp,
            ),
          ),
          padding: EdgeInsets.all(3.sp),
          child: Lottie.asset(animation),
        ),
      ),
    );
  }
}
