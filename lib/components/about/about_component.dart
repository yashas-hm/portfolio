import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/components/about/responsibility_item.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/data/data_constants.dart';
import 'package:portfolio/data/narratives.dart';
import 'package:portfolio/data/skills.dart';
import 'package:portfolio/data/testimonials.dart';
import 'package:portfolio/model/narrative.dart';
import 'package:portfolio/model/skill.dart';
import 'package:portfolio/model/testimonial.dart';
import 'package:portfolio/repositories/theme_repository.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/widgets/new_widgets/arrow_controller.dart';
import 'package:portfolio/widgets/new_widgets/auto_scroll.dart';
import 'package:portfolio/widgets/new_widgets/sliding_carousel.dart';
import 'package:portfolio/widgets/new_widgets/text/gradient_text.dart';

part 'intro/display_image.dart';
part 'intro/skill_carousel.dart';
part 'intro_item.dart';
part 'narrative_item.dart';
part 'testimonial_item.dart';

class AboutComponent extends StatelessWidget {
  const AboutComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Intro(),
        Gap(Sizes.iconHuge),
        NarrativeItem(),
        Gap(Sizes.spacingXXL),
        TestimonialItem(),
        Gap(Sizes.spacingXXL),
        ResponsibilityItem(),
      ],
    );
  }
}
