import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:resize/resize.dart';

class SkillsItem extends StatelessWidget {
  const SkillsItem({
    Key? key,
    required this.item,
    required this.skillName,
    this.inverted = false,
  }) : super(key: key);

  final List<String> item;
  final String skillName;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height,
      width: screenSize.width,
      margin: EdgeInsets.only(
        right: inverted ? 0.sp : 80.sp,
        left: !inverted ? 0.sp : 80.sp,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:
            inverted ? body(screenSize).reversed.toList() : body(screenSize),
      ),
    );
  }

  List<Widget> body(Size screenSize) => [
        SizedBox(
          width: screenSize.height,
          height: screenSize.height,
          child: Stack(
            children: [
              Lottie.asset(
                AppConstants.bgAnim,
                width: screenSize.height * 2,
                height: screenSize.height * 2,
                fit: BoxFit.cover,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  width: screenSize.height / 2.8,
                  height: screenSize.height / 2.8,
                  alignment: Alignment.center,
                  child: Text(
                    skillName,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 5,
                    style: TextStyle(
                      fontSize: 55.sp,
                      color: AppColor.bgLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: screenSize.height / 1.6,
            width: double.infinity,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30.sp,
                  crossAxisSpacing: 50.sp,
                  childAspectRatio: 16 / 3),
              itemCount: item.length,
              itemBuilder: (ctx, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.sp),
                  color: AppColor.primaryLight,
                ),
                alignment: Alignment.center,
                child: Text(
                  item[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.sp,
                    color: AppColor.bgDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        )
      ];
}
