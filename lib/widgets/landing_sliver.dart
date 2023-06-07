import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/data/data.dart';
import 'package:portfolio/widgets/connect_button.dart';
import 'package:portfolio/widgets/nav_item.dart';
import 'package:resize/resize.dart';

class LandingSliver extends StatelessWidget {
  const LandingSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SliverAppBar(
      pinned: true,
      centerTitle: true,
      automaticallyImplyLeading: false,
      expandedHeight: screenSize.height,
      collapsedHeight: 100.sp,
      toolbarHeight: 100.sp,
      title: Container(
        alignment: Alignment.center,
        width: screenSize.width,
        height: 100.sp,
        padding: EdgeInsets.only(
            top: 20.sp,
            right: screenSize.width * 0.05,
            left: screenSize.width * 0.05,
            bottom: 0.sp),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: 8.sp),
                child: CircleAvatar(
                  radius: 40.sp,
                  foregroundImage: const AssetImage(
                    AppConstants.avatar,
                  ),
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemExtent: 190.sp,
              shrinkWrap: true,
              itemCount: Data.navItems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) => NavItem(
                index: index,
                page: 0,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.05,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: screenSize.height,
                  width: screenSize.width * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Hi there, I\'m\nYashas H Majmudar',
                        style: TextStyle(
                          color: AppColor.bgLight,
                          fontFamily: 'noto',
                          fontSize: 60.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Software Developer',
                        style: TextStyle(
                          fontFamily: 'noto',
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColor.secondary,
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Text(
                        'Connect with me at:',
                        style: TextStyle(
                          fontFamily: 'noto',
                          fontSize: 30.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColor.bgLight,
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const ConnectButton(
                            animation: AppConstants.githubAnim,
                            link: AppConstants.githubLink,
                          ),
                          SizedBox(
                            width: 30.sp,
                          ),
                          const ConnectButton(
                            animation: AppConstants.linkedinAnim,
                            link: AppConstants.linkedinLink,
                          ),
                          SizedBox(
                            width: 30.sp,
                          ),
                          const ConnectButton(
                            animation: AppConstants.instaAnim,
                            link: AppConstants.instaLink,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: screenSize.height / 3,
                  foregroundImage: const AssetImage(
                    AppConstants.photo,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
