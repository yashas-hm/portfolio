import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/helpers/app_helpers.dart';
import 'package:portfolio/widgets/appbar.dart';
import 'package:portfolio/widgets/bottom_bar.dart';
import 'package:resize/resize.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold({super.key});

  final ctr = Get.find<NavController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        preferredSize: Size.fromHeight(80.sp),
      ),
      body: SingleChildScrollView(
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
    );
  }
}
