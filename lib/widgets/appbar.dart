import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/data/data.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/widgets/nav_item.dart';
import 'package:resize/resize.dart';

class CustomAppbar {
  static AppBar appbar(
    BuildContext ctx,
    int page,
  ) =>
      AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 100.sp,
        title: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(ctx).size.width,
          height: 100.sp,
          padding: EdgeInsets.only(
              top: 20.sp,
              right: MediaQuery.of(ctx).size.width * 0.05,
              left: MediaQuery.of(ctx).size.width * 0.05,
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
                  child: GestureDetector(
                    onTap: () => Get.offAll(() => const HomeScreen()),
                    child: CircleAvatar(
                      radius: 40.sp,
                      foregroundImage: const AssetImage(
                        AppConstants.avatar,
                      ),
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
                  page: page,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      );
}
