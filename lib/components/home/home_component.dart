import 'dart:math';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/components/chat/chat_component.dart';
import 'package:portfolio/components/skills/skills_component.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/data/data_constants.dart';
import 'package:portfolio/data/links.dart';
import 'package:portfolio/data/metrics.dart';
import 'package:portfolio/data/skills.dart';
import 'package:portfolio/model/metric.dart';
import 'package:portfolio/navigation/navigation.dart';
import 'package:portfolio/repositories/chat_repository.dart';
import 'package:portfolio/repositories/theme_repository.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/utilities/utils.dart';
import 'package:portfolio/widgets//text/subtext.dart';
import 'package:portfolio/widgets/sequential_animator.dart';
import 'package:portfolio/widgets/text/gradient_text.dart';

part 'blocks/chat_block.dart';
part 'blocks/image_block.dart';
part 'blocks/links_block.dart';
part 'metrics_item.dart';

class HomeComponent extends StatelessWidget {
  const HomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final width = min<double>(600.0, context.width * 0.9);
    final height = width * (3 / 4);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: context.width * 0.9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: Sizes.spacingLarge,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.start,
            spacing: Sizes.spacingLarge,
            runSpacing: Sizes.spacingLarge,
            children: [
              ImageBlock(
                width: width,
                height: height,
              ),
              ChatBlock(
                width: width,
                height: height,
              ),
            ],
          ),
          LinksBlock(
            height: height,
            width: width,
          ),
          MetricsItem(),
        ],
      ),
    );
  }
}
