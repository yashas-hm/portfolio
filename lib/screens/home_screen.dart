import 'package:flutter/material.dart';
import 'package:portfolio/screens/desktop/home_screen.dart' as desktop;
import 'package:portfolio/screens/mobile/home_screen.dart' as mobile;
import 'package:portfolio/widgets/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return CustomScaffold(
      child: screenSize.height > screenSize.width
          ? const mobile.HomeScreen()
          : const desktop.HomeScreen(),
    );
  }
}
