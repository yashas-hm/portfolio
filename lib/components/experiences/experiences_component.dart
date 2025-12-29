import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/components/skills/skills_component.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/data/experiences.dart';
import 'package:portfolio/model/experience.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/utilities/utils.dart';
import 'package:portfolio/widgets/new_widgets/bounce_animator.dart';
import 'package:portfolio/widgets/new_widgets/gradient_text.dart';
import 'package:portfolio/widgets/new_widgets/sequential_animator.dart';
import 'package:portfolio/components/experiences/timeline_container.dart';

part 'experience_item.dart';

class ExperiencesComponent extends StatelessWidget {
  const ExperiencesComponent({super.key});

  static const int topK = 3;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final experiences = Experiences.sortedExperiences;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: context.width * 0.9,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GradientText(
                  text: 'Career ',
                  textStyle: Styles.headlineTextBold(
                    isMobile: context.isMobile,
                  ),
                ),
                Text(
                  'Path',
                  style: Styles.headlineTextBold(
                    textColor: colors.textColor,
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
            'A timeline of my professional journey in software engineering, focusing on scalable architecture, mobile development, and full-stack solutions.',
            style: Styles.subText(
              textColor: colors.textSecondary,
              isMobile: context.isMobile,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Gap(Sizes.spacingLarge),
        SizedBox(
          width: context.width * (context.isMobile ? 0.9 : 0.6),
          child: ListView.builder(
            // TODO: Reinstate
            // physics: const BouncingScrollPhysics(
            //   parent: AlwaysScrollableScrollPhysics(),
            // ),
            /// TODO: Remove when moving to separate page
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: experiences.length,
            padding: EdgeInsets.zero,
            itemBuilder: (_, index) {
              final experience = ExperienceItem(
                experience: experiences[index],
                collapsed: index >= topK,
              );
              if (index == topK) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TimelineContainer(
                      showContainer: false,
                      child: Text(
                        'Previous Work',
                        style: Styles.largeTextBold(
                          textColor: colors.textSecondary,
                        ),
                      ),
                    ),
                    experience,
                  ],
                );
              } else {
                return experience;
              }
            },
          ),
        )
      ],
    );
  }
}
