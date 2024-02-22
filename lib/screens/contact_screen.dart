import 'package:flutter/material.dart';
import 'package:portfolio/screens/desktop/contact_screen.dart' as desktop;
import 'package:portfolio/screens/mobile/contact_screen.dart' as mobile;
import 'package:portfolio/widgets/custom_scaffold.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return CustomScaffold(
      child: screenSize.height > screenSize.width
          ? const mobile.ContactScreen()
          : const desktop.ContactScreen(),
    );
  }
}