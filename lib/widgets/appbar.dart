import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/data/data.dart';
import 'package:portfolio/widgets/nav_item.dart';
import 'package:resize/resize.dart';

class CustomAppbar {
  static final ctr = Get.find<NavController>();

  static AppBar mobileAppBar(ctx, AdvancedDrawerController controller) =>
      AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        toolbarHeight: 80.sp,
        leading: ValueListenableBuilder<AdvancedDrawerValue>(
          valueListenable: controller,
          builder: (_, value, __) {
            return GestureDetector(
              onTap: () => value.visible
                  ? controller.hideDrawer()
                  : controller.showDrawer(),
              child: AnimatedSwitcher(
                duration: const Duration(microseconds: 500),
                child: Icon(
                  value.visible ? Icons.clear : Icons.menu,
                  key: ValueKey<bool>(value.visible),
                ),
              ),
            );
          },
        ),
        title: Container(
          alignment: Alignment.centerRight,
          width: MediaQuery.of(ctx).size.width,
          height: 70.sp,
          padding: EdgeInsets.all(10.sp),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => ctr.page.value = 0,
              child: CircleAvatar(
                radius: 30.sp,
                backgroundImage: const AssetImage(
                  AppConstants.avatar,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      );

  static AppBar appbar(
    BuildContext ctx,
    int page,
  ) =>
      AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        toolbarHeight: 80.sp,
        title: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(ctx).size.width,
          height: 70.sp,
          padding: EdgeInsets.all(10.sp),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => ctr.page.value = 0,
                  child: CircleAvatar(
                    radius: 30.sp,
                    backgroundImage: const AssetImage(
                      AppConstants.avatar,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemExtent: MediaQuery.of(ctx).size.width / 15,
                itemCount: Data.navItems.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) => NavItem(
                  index: index,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      );
}
