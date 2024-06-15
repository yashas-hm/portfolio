import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/core/utilities/utils.dart';
import 'package:portfolio/screens/desktop/contact_screen.dart' as desktop;
import 'package:portfolio/screens/mobile/contact_screen.dart' as mobile;
import 'package:portfolio/widgets/custom_scaffold.dart';

class ContactScreen extends ConsumerWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      indexCheck(contactMeIndex, ref);
    });

    return CustomScaffold(
      child: context.isMobile
          ? const mobile.ContactScreen()
          : const desktop.ContactScreen(),
    );
  }
}
