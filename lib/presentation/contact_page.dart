import 'package:flutter/material.dart';
import 'package:portfolio/components/base_page/base_page.dart';
import 'package:portfolio/components/contact/contact_component.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      content: ContactComponent(),
    );
  }
}
