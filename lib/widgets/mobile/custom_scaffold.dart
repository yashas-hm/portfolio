import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/widgets/bottom_bar.dart';
import 'package:portfolio/widgets/mobile/appbar.dart';
import 'package:portfolio/widgets/mobile/nav_item.dart';
import 'package:resize/resize.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold({
    super.key,
    required this.child,
  });

  final Widget child;
  final advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final ctr = Get.find<NavController>();

    return AdvancedDrawer(
      controller: advancedDrawerController,
      animationDuration: 600.milliseconds,
      animationCurve: Curves.easeInOut,
      backdropColor: AppColor.background,
      drawer: Obx(
        () => NavItem(
          advancedDrawerController: advancedDrawerController,
          initialIndex: Get.find<NavController>().currentIndex.value,
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
            advancedDrawerController: advancedDrawerController,
            preferredSize: Size.fromHeight(70.sp)),
        body: SizedBox(
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
    );
  }
}
