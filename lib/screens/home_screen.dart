import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/screens/web/web_home_screen.dart' as web;
import 'package:portfolio/screens/mobile/mobile_home_screen.dart' as mobile;
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
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final settings = ModalRoute.of(context)?.settings;
      if (settings != null && settings.name == resumeRoute) {
        launchUrlString(resumeLink);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: context.isMobile
          ? const mobile.MobileHomeScreen()
          : const web.WebHomeScreen(),
    );
  }
}
