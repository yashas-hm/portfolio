import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/utilities/utils.dart';
import 'package:portfolio/screens/desktop/contact_screen.dart' as desktop;
import 'package:portfolio/screens/mobile/contact_screen.dart' as mobile;
import 'package:portfolio/widgets/custom_scaffold.dart';

class ContactScreen extends ConsumerWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Utils.indexCheck(AppConstants.contactMeIndex, ref);
    });

    return CustomScaffold(
      child: screenSize.height > screenSize.width
          ? const mobile.ContactScreen()
          : const desktop.ContactScreen(),
    );
  }
}
