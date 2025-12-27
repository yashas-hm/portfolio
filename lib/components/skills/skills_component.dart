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

class SkillsComponent extends StatelessWidget {
  const SkillsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: Sizes.spacingLarge,
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
        SkillsWindow(),
      ],
    );
  }
}
