import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/widgets/desktop/bottom_bar.dart' as desktop;
import 'package:portfolio/widgets/mobile/bottom_bar.dart' as mobile;

class BottomBar extends ConsumerWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final pageIndex = ref.watch(pageIndexProvider);

    return screenSize.height > screenSize.width
        ? mobile.CustomBottomBar(
            noConnection: pageIndex == AppConstants.homeIndex,
          )
        : desktop.CustomBottomBar(
            noConnection: pageIndex == AppConstants.homeIndex,
          );
  }
}
