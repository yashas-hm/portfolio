import 'package:flutter/material.dart';
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
    final screenSize = MediaQuery.of(context).size;

    return screenSize.height > screenSize.width
        ? mobile.CustomScaffold(
            child: child,
          )
        : desktop.CustomScaffold(
            child: child,
          );
  }
}
