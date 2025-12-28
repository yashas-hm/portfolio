import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/widgets/new_widgets/gradient_text.dart';
import 'package:portfolio/widgets/new_widgets/sequential_animator.dart';
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'The ',
                  style: Styles.headlineTextBold(
                    textColor: theme.colors.textColor,
                    isMobile: context.isMobile,
                  ),
                ),
                GradientText(
                  text: 'Tech Stack',
                  textStyle: Styles.headlineTextBold(
                    isMobile: context.isMobile,
                  ),
                ),
                Text(
                  ' Terminal',
                  style: Styles.headlineTextBold(
                    textColor: theme.colors.textColor,
                    isMobile: context.isMobile,
                  ),
                ),
              ],
            ),
          ),
        ),
        Gap(Sizes.spacingMedium),
        SizedBox(
          width: context.width * (context.isMobile ? 0.9 : 0.4),
          child: Text(
            'The complete toolset deployed to build low-latency systems and production-grade AI architectures.',
            style: Styles.subText(
              isMobile: context.isMobile,
              textColor: theme.colors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        // Container(
        //   width: context.width * (context.isMobile ? 0.9 : 0.4),
        //   padding: Sizes.paddingRegular,
        //   decoration: BoxDecoration(
        //     color: theme.colors.backgroundColor.withValues(alpha: 0.5),
        //     borderRadius: Sizes.borderRadiusSmall,
        //     border: Border.all(color: theme.colors.borderColor),
        //   ),
        //   child: RichText(
        //     text: TextSpan(
        //       children: [
        //         TextSpan(
        //           text: '> BOOT_SEQUENCE: ',
        //           style: Styles.mediumTextBold(
        //             textColor: KnownColors.green100,
        //             isMobile: context.isMobile,
        //           ),
        //         ),
        //         TextSpan(
        //           text:
        //               'Languages compiled. Frontend rendered. Backend online. '
        //               'Databases connected. DevOps active. AI synchronized. '
        //               'Cloud scaled. IoT linked.',
        //           style: Styles.mediumText(
        //             textColor: theme.colors.textColor,
        //             isMobile: context.isMobile,
        //           ),
        //         ),
        //         TextSpan(
        //           text: ' _',
        //           style: Styles.mediumText(
        //             textColor: KnownColors.green100,
        //             isMobile: context.isMobile,
        //           ),
        //         ),
        //       ],
        //     ),
        //     textAlign: TextAlign.center,
        //   ),
        // ),
        Gap(Sizes.spacingLarge),
        SkillsWindow(),
      ],
    );
  }
}
