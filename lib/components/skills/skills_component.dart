import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/data/skills.dart';
import 'package:portfolio/model/skill.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/widgets/sequential_animator.dart';
import 'package:portfolio/widgets/text/gradient_text.dart';
import 'package:portfolio/widgets/text/subtext.dart';
import 'package:portfolio/widgets/window_container.dart';

part 'skill_chip.dart';
part 'skill_item.dart';
part 'skills_window.dart';

class SkillsComponent extends StatelessWidget {
  const SkillsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: context.width * 0.9,
          child: GradientText(
            text: 'The *Tech Stack* Terminal',
            textStyle: Styles.headlineTextBold(
              textColor: colors.textColor,
              isMobile: context.isMobile,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Gap(Sizes.spacingMedium),
        Subtext(
          'The complete toolset deployed to build low-latency systems and production-grade AI architectures.',
        ),
        Gap(Sizes.spacingXXL),
        SkillsWindow(),
      ],
    );
  }
}
