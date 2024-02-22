import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/model/data.dart';
import 'package:portfolio/widgets/desktop/nav_item.dart';
import 'package:resize/resize.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.preferredSize = const Size.fromHeight(80.0),
  }) : super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 0.sp,
      centerTitle: false,
      toolbarHeight: 70.sp,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      title: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 60.sp,
        color: Colors.transparent,
        padding: EdgeInsets.all(10.sp),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => Get.find<NavController>()
                    .updateIndex(AppConstants.homeIndex),
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
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemExtent: MediaQuery.of(context).size.width / 18,
              itemCount: Data.navItems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) => NavItem(
                index: index,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
