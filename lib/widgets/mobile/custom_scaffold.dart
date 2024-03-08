import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/helpers/app_utils.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/widgets/bottom_bar.dart';
import 'package:portfolio/widgets/mobile/appbar.dart';
import 'package:portfolio/widgets/mobile/nav_item.dart';
import 'package:resize/resize.dart';

class CustomScaffold extends ConsumerWidget {
  CustomScaffold({
    super.key,
    required this.child,
  });

  final Widget child;
  final advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final currentIndex = ref.watch(currentIndexProvider);
    final pageIndex = ref.watch(pageIndexProvider);

    return AdvancedDrawer(
      controller: advancedDrawerController,
      animationDuration: 600.milliseconds,
      animationCurve: Curves.easeInOut,
      backdropColor: AppColor.background,
      drawer: NavItem(
        advancedDrawerController: advancedDrawerController,
        initialIndex: currentIndex,
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
                //TODO: check if child being rebuilt
                child,
                if (pageIndex != AppConstants.homeIndex) const BottomBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
