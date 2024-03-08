import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/widgets/bottom_bar.dart';
import 'package:portfolio/widgets/desktop/appbar.dart';
import 'package:portfolio/widgets/desktop/follow_mouse.dart';
import 'package:resize/resize.dart';

class CustomScaffold extends ConsumerWidget {
  const CustomScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final pageIndex = ref.watch(pageIndexProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        preferredSize: Size.fromHeight(70.sp),
      ),
      body: Stack(
        children: [
          if (pageIndex == AppConstants.homeIndex) const FollowMouse(),
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
                    if (pageIndex != AppConstants.homeIndex) const BottomBar(),
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
