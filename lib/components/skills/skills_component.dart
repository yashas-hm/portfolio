import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/components/sequential_animator.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/data/skills.dart';
import 'package:portfolio/model/skill.dart';
import 'package:portfolio/providers/ui_provider.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/utilities/extensions.dart';

part 'skill_chip.dart';
part 'skills_container.dart';
part 'skills_window.dart';

class SkillsComponent extends ConsumerWidget {
  const SkillsComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: context.width * 0.9,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'The Tech Stack Terminal',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Gap(Sizes.spacingRegular),
        Container(
          width: context.width * (context.isMobile ? 0.9 : 0.4),
          padding: Sizes.paddingRegular,
          decoration: BoxDecoration(
            color: theme.colors.backgroundColor.withValues(alpha: 0.5),
            borderRadius: Sizes.borderRadiusSmall,
            border: Border.all(color: theme.colors.borderColor),
          ),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '> BOOT_SEQUENCE: ',
                  style: Styles.regularTextBold(
                    textColor: KnownColors.green100,
                  ),
                ),
                TextSpan(
                  text:
                      'Languages compiled. Frontend rendered. Backend online. '
                      'Databases connected. DevOps active. AI synchronized. '
                      'Cloud scaled. IoT linked.',
                  style: Styles.regularText(
                    textColor: theme.colors.textColor,
                  ),
                ),
                TextSpan(
                  text: ' _',
                  style: Styles.regularText(
                    textColor: KnownColors.green100,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Gap(Sizes.spacingLarge),
        SkillsWindow(),
      ],
    );
  }
}
