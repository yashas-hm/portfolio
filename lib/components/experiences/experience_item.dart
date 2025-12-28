part of 'experiences_component.dart';

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({
    super.key,
    required this.experience,
    this.collapsed = true,
  });

  final Experience experience;
  final bool collapsed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return TimelineContainer(
      present: experience.present,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Sizes.spacingMedium,
        children: [
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              runSpacing: Sizes.spacingRegular,
              spacing: Sizes.spacingRegular,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: Sizes.spacingLarge,
                  children: [
                    Container(
                      padding: Sizes.paddingMedium,
                      decoration: BoxDecoration(
                        color: colors.textColor.withValues(alpha: 0.05),
                        borderRadius: Sizes.borderRadiusSmall,
                        border: Border.all(color: colors.borderColor),
                      ),
                      child: Icon(
                        experience.icon,
                        size: Sizes.iconRegular,
                        color: colors.primaryColor,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          experience.role,
                          style: Styles.mediumTextBold(),
                        ),
                        Text(
                          experience.company,
                          style: Styles.smallTextBold(
                              textColor: colors.primaryColor),
                        ),
                        Gap(Sizes.spacingSmall),
                        Container(
                          padding: Sizes.paddingXS,
                          decoration: BoxDecoration(
                            borderRadius: Sizes.borderRadiusXS,
                            color: experience.type.color.backgroundColor,
                            border: Border.all(color: experience.type.color),
                          ),
                          child: Text(
                            experience.type.value,
                            style: Styles.extraSmallText(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: colors.textColor.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(Sizes.iconHuge),
                    border: Border.all(color: colors.borderColor),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: Sizes.spacingSmall,
                      horizontal: Sizes.spacingRegular),
                  child: Text(
                    Utils.convertToTimeline(experience),
                    style: Styles.extraSmallText(),
                  ),
                ),
              ],
            ),
          ),
          Gap(Sizes.spacingRegular),
          ...experience.descriptions.map(
            (description) => Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              spacing: Sizes.spacingMedium,
              children: [
                Baseline(
                  baseline: Styles.regularText().fontSize!,
                  baselineType: TextBaseline.alphabetic,
                  child: Icon(
                    description.icon,
                    size: Sizes.iconSmall,
                    color: colors.primaryColor,
                  ),
                ),
                Expanded(
                  child: Text(
                    description.description,
                    style: Styles.regularText(),
                  ),
                ),
              ],
            ),
          ),
          Gap(Sizes.spacingRegular),
          SequentialAnimator(
            delay: 400.milliseconds,
            itemDuration: 200.milliseconds,
            curve: Curves.bounceInOut,
            animationBuilder: (child, animation) => ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(animation),
              child: child,
            ),
            builder: (children) => Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              spacing: Sizes.spacingMediumSmall,
              runSpacing: Sizes.spacingMediumSmall,
              children: children,
            ),
            children: experience.skills
                .map((skill) => SkillChip(skill: skill))
                .toList(),
          ),
        ],
      ),
    );
  }
}
