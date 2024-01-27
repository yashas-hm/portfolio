import 'package:flutter/material.dart';

import 'package:portfolio/screens/mobile/home_screen.dart' as mobile;
import 'package:portfolio/screens/desktop/home_screen.dart' as desktop;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return screenSize.height > screenSize.width
        ? const mobile.HomeScreen()
        : const desktop.HomeScreen();
  }
}
