import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constants/portfolio_constants.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/utilities/utils.dart';
import 'package:portfolio/widgets/custom_scaffold.dart';

part 'web/web_contributions_screen.dart';
part 'mobile/mobile_contributions_screen.dart';

class ContributionsScreen extends ConsumerWidget {
  const ContributionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      indexCheck(contactMeIndex, ref);
    });

    return CustomScaffold(
      child: context.isMobile
          ? const MobileContributionsScreen()
          : const WebContributionsScreen(),
    );
  }
}
