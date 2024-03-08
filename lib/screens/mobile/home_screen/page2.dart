import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:resize/resize.dart';

class Page2 extends ConsumerWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(15.sp),
        Text(
          'About Me',
          style: TextStyle(
            fontSize: 18.sp,
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
            color: AppColor.box,
            borderRadius: BorderRadius.circular(13.sp),
          ),
          alignment: Alignment.center,
          child: AutoSizeText(
            PortfolioData.aboutBrief,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
        ),
        Gap(15.sp),
        RichText(
          text: TextSpan(
            text: 'Times I put the ',
            children: [
              TextSpan(
                text: '"Leader Hat"',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColor.primary,
                  fontFamily: 'space_grotesk',
                ),
              ),
              TextSpan(
                text: '!',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.textColor,
                  fontFamily: 'space_grotesk',
                ),
              ),
            ],
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.textColor,
              fontFamily: 'space_grotesk',
            ),
          ),
        ),
        Gap(15.sp),
        ...buildChildren(screenSize),
        Gap(15.sp),
        GestureDetector(
          onTap: () => updateIndex(
            context,
            ref,
            AppConstants.aboutIndex,
            force: true,
          ),
          child: SizedBox(
            width: screenSize.width / 1.2,
            child: Text(
              'Care to indulge me in another round of self-glorification? 🤔\n(Read More)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColor.textColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> buildChildren(Size screenSize) {
    final list = <Widget>[];

    for (var index = 0; index < PortfolioData.por.length; index++) {
      list.add(Container(
        width: screenSize.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.sp),
          color: AppColor.box,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 15.sp,
          vertical: 10.sp,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              PortfolioData.por[index].designation,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.primary,
              ),
            ),
            Text(
              PortfolioData.por[index].referer,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(15.sp),
            Text(
              PortfolioData.por[index].description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ));

      if (index != PortfolioData.por.length - 1) {
        list.add(Gap(15.sp));
      }
    }

    return list;
  }
}
