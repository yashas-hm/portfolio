import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/widgets/desktop/bottom_bar.dart' as desktop;
import 'package:portfolio/widgets/mobile/bottom_bar.dart' as mobile;

class BottomBar extends StatelessWidget {
  BottomBar({
    super.key,
  });

  final ctr = Get.find<NavController>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return screenSize.height > screenSize.width
        ? mobile.CustomBottomBar(
            noConnection: ctr.pageIndex == AppConstants.homeIndex,
          )
        : desktop.CustomBottomBar(
            noConnection: ctr.pageIndex == AppConstants.homeIndex,
          );
  }
}
