import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/constants.dart' show KnownColors;
import 'package:portfolio/constants/legacy_constants/portfolio_constants.dart';
import 'package:portfolio/utilities/dialog_utils.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/utilities/utils.dart';
import 'package:portfolio/widgets/custom_scaffold.dart';
import 'package:resize/resize.dart';

part 'mobile/mobile_contact_screen.dart';
part 'web/web_contact_screen.dart';

class ContactScreen extends ConsumerWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScaffold(
      child: context.isMobile
          ? const MobileContactScreen()
          : const WebContactScreen(),
    );
  }
}
