import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:portfolio/components/base_page/base_page.dart';
import 'package:portfolio/constants/legacy_constants/portfolio_constants.dart';
import 'package:portfolio/constants/legacy_constants/portfolio_data.dart';
import 'package:portfolio/screens/mobile/mobile_home_screen.dart' as mobile;
import 'package:portfolio/screens/web/web_home_screen.dart' as web;
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/widgets/custom_scaffold.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: context.isMobile
          ? const mobile.MobileHomeScreen()
          : const web.WebHomeScreen(),
    );
    // return BasePage(content: Placeholder());
    // return SkillsPage();
  }
}
