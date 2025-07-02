import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/core/utilities/utils.dart';
import 'package:portfolio/widgets/custom_scaffold.dart';
import 'package:portfolio/widgets/web/web_experience_item.dart';
import 'package:portfolio/widgets/mobile/mobile_experience_item.dart';
import 'package:resize/resize.dart';

part 'web/web_experience_screen.dart';
part 'mobile/mobile_experience_screen.dart';

class ExperienceScreen extends ConsumerWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      indexCheck(experienceIndex, ref);
    });

    return CustomScaffold(
      child: context.isMobile
          ? const MobileExperienceScreen()
          : const WebExperienceScreen(),
    );
  }
}
