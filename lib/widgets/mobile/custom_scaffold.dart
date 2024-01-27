import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/data/data.dart';
import 'package:portfolio/core/helpers/app_helpers.dart';
import 'package:portfolio/widgets/appbar.dart';
import 'package:portfolio/widgets/bottom_bar.dart';
import 'package:portfolio/widgets/mobile/nav_item.dart';
import 'package:resize/resize.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold({super.key});

  final advancedDrawerController = AdvancedDrawerController();
  final ctr = Get.find<NavController>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return AdvancedDrawer(
      controller: advancedDrawerController,
      backdropColor: AppColor.background,
      drawer: NavItem(advancedDrawerController: advancedDrawerController, initialIndex: 0,),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          advancedDrawerController: advancedDrawerController,
          preferredSize: Size.fromHeight(80.sp),
        ),
        body: SizedBox(
          height: screenSize.height,
          child: SingleChildScrollView(
            controller: ctr.scrollCtr,
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () => AppHelper.getScreen(),
                ),
                BottomBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
