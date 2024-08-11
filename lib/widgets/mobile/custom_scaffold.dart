import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/widgets/bottom_bar.dart';
import 'package:portfolio/widgets/mobile/appbar.dart';
import 'package:portfolio/widgets/mobile/nav_item.dart';

class CustomScaffold extends ConsumerWidget {
  CustomScaffold({
    super.key,
    required this.child,
  });

  final Widget child;
  final advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final pageIndex = ref.watch(pageIndexProvider);

    return AdvancedDrawer(
      controller: advancedDrawerController,
      animationDuration: 600.milliseconds,
      backdropColor: Theme.of(context).colorScheme.secondary,
      animationCurve: Curves.easeInOut,
      drawer: NavItem(
        advancedDrawerController: advancedDrawerController,
        initialIndex: currentIndex,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: customAppBar(
          context,
          advancedDrawerController,
        ),
        body: SizedBox(
          height: context.height,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                child,
                if (pageIndex != homeIndex) const BottomBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
