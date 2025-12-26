import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constants/portfolio_constants.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/widgets/bottom_bar.dart';
import 'package:portfolio/widgets/mobile/mobile_appbar.dart';
import 'package:portfolio/widgets/mobile/mobile_nav_item.dart';
import 'package:portfolio/widgets/web/follow_mouse.dart';
import 'package:portfolio/widgets/web/web_appbar.dart';

part 'mobile/mobile_scaffold.dart';
part 'web/web_scaffold.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return context.isMobile
        ? MobileScaffold(
            child: child,
          )
        : WebScaffold(
            child: child,
          );
  }
}
