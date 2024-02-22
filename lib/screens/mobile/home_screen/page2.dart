import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/model/data.dart';
import 'package:resize/resize.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(10.sp),
          Text(
            'About Me',
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(40.sp),
          Container(
            width: screenSize.width / 2,
            padding: EdgeInsets.symmetric(
              horizontal: 25.sp,
              vertical: 20.sp,
            ),
            decoration: BoxDecoration(
              color: AppColor.box,
              borderRadius: BorderRadius.circular(13.sp),
            ),
            alignment: Alignment.center,
            child: AutoSizeText(
              Data.smallAbout,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ),
          Gap(30.sp),
          RichText(
            text: TextSpan(
              text: 'Times I put the ',
              children: [
                TextSpan(
                  text: '"Leader Hat"',
                  style: TextStyle(
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColor.secondary,
                    fontFamily: 'space_grotesk',
                  ),
                ),
                TextSpan(
                  text: '!',
                  style: TextStyle(
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textColor,
                    fontFamily: 'space_grotesk',
                  ),
                ),
              ],
              style: TextStyle(
                fontSize: 23.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.textColor,
                fontFamily: 'space_grotesk',
              ),
            ),
          ),
          Gap(30.sp),
        ],
      ),
    );
  }

  Widget leaderShipBox(){
    return Container(

    );
  }
}
