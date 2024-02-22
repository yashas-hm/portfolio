import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:resize/resize.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.advancedDrawerController,
    this.preferredSize = const Size.fromHeight(80.0),
  }) : super(key: key);

  @override
  final Size preferredSize;

  final AdvancedDrawerController advancedDrawerController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      toolbarHeight: 80.sp,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      leading: ValueListenableBuilder<AdvancedDrawerValue>(
        valueListenable: advancedDrawerController,
        builder: (_, value, __) {
          return GestureDetector(
            onTap: () => value.visible
                ? advancedDrawerController.hideDrawer()
                : advancedDrawerController.showDrawer(),
            child: AnimatedSwitcher(
              duration: const Duration(microseconds: 500),
              child: Padding(
                padding: EdgeInsets.only(left: 15.sp),
                child: Icon(
                  key: ValueKey<bool>(value.visible),
                  value.visible ? Icons.clear : Icons.menu,
                  size: 25.sp,
                ),
              ),
            ),
          );
        },
      ),
      title: Container(
        alignment: Alignment.centerRight,
        width: MediaQuery.of(context).size.width,
        height: 70.sp,
        padding: EdgeInsets.all(10.sp),
        child: MouseRegion(
          opaque: false,
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => Get.find<NavController>().updateIndex(AppConstants.homeIndex),
            child: Container(
              height: 60.sp,
              width: 60.sp,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              child: Image.asset(AppConstants.avatar),
            ),
          ),
        ),
      ),
    );
  }
}
