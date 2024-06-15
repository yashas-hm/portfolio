import 'package:flutter/material.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/widgets/desktop/custom_scaffold.dart' as desktop;
import 'package:portfolio/widgets/mobile/custom_scaffold.dart' as mobile;

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {

    return context.isMobile
        ? mobile.CustomScaffold(
            child: child,
          )
        : desktop.CustomScaffold(
            child: child,
          );
  }
}
