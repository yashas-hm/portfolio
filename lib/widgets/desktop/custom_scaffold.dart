import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/widgets/bottom_bar.dart';
import 'package:portfolio/widgets/desktop/appbar.dart';
import 'package:portfolio/widgets/desktop/follow_mouse.dart';
import 'package:resize/resize.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final ctr = Get.find<NavController>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        preferredSize: Size.fromHeight(80.sp),
      ),
      body: Stack(
        children: [
          if (ctr.pageIndex == AppConstants.homeIndex) const FollowMouse(),
          MouseRegion(
            opaque: false,
            child: SizedBox(
              height: screenSize.height,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    child,
                    if (ctr.pageIndex != AppConstants.homeIndex) BottomBar(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
