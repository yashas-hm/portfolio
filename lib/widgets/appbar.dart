import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:portfolio/widgets/desktop/appbar.dart' as desktop;
import 'package:portfolio/widgets/mobile/appbar.dart' as mobile;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.preferredSize = const Size.fromHeight(80),
    this.advancedDrawerController,
  });

  @override
  final Size preferredSize;

  final AdvancedDrawerController? advancedDrawerController;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return screenSize.height > screenSize.width
        ? mobile.CustomAppBar(
            advancedDrawerController: advancedDrawerController!,
          )
        : const desktop.CustomAppBar();
  }
}
