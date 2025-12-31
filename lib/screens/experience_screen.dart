import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/legacy_constants/portfolio_constants.dart';
import 'package:portfolio/constants/legacy_constants/portfolio_data.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/utilities/utils.dart';
import 'package:portfolio/widgets/custom_scaffold.dart';
import 'package:portfolio/widgets/mobile/mobile_experience_item.dart';
import 'package:portfolio/widgets/web/web_experience_item.dart';
import 'package:resize/resize.dart';

part 'mobile/mobile_experience_screen.dart';
part 'web/web_experience_screen.dart';

class ExperienceScreen extends ConsumerWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return CustomScaffold(
      child: context.isMobile
          ? const MobileExperienceScreen()
          : const WebExperienceScreen(),
    );
  }
}
