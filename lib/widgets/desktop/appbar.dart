import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/data/data.dart';
import 'package:portfolio/widgets/desktop/nav_item.dart';
import 'package:resize/resize.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.preferredSize = const Size.fromHeight(80.0),
  }) : super(key: key);

  @override
  final Size preferredSize;

  static final ctr = Get.find<NavController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 0.sp,
      centerTitle: false,
      toolbarHeight: 80.sp,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      title: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 70.sp,
        color: Colors.transparent,
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
              itemExtent: MediaQuery.of(context).size.width / 15,
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
