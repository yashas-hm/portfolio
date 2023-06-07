import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:resize/resize.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap:() {
                scrollController.animateTo(
                  scrollController.offset + screenSize.height,
                  duration: const Duration(milliseconds: 650),
                  curve: Curves.easeIn,
                );
              },
        child: Container(
          height: 120.sp,
          width: 80.sp,
          margin: EdgeInsets.only(bottom: 10.sp),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: 15.sp,
                ),
                decoration: BoxDecoration(
                  color: AppColor.bgLight,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(120.sp),
                    top: Radius.circular(60.sp),
                  ),
                ),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 5.sp),
                child: Text(
                  'MORE',
                  style: TextStyle(
                    color: AppColor.bgDark,
                    fontWeight: FontWeight.w700,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.sp),
                child: Lottie.asset(
                  AppConstants.downAnim,
                  height: 1000.sp,
                  width: 1000.sp,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
