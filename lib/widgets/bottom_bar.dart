import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/widgets/desktop/bottom_bar.dart' as desktop;
import 'package:portfolio/widgets/mobile/bottom_bar.dart' as mobile;

class BottomBar extends ConsumerWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider);

    return context.isMobile
        ? mobile.CustomBottomBar(
            noConnection: pageIndex == homeIndex,
          )
        : desktop.CustomBottomBar(
            noConnection: pageIndex == homeIndex,
          );
  }
}
