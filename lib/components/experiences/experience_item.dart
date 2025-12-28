part of 'experiences_component.dart';

class ExperienceItem extends ConsumerWidget {
  const ExperienceItem({
    super.key,
    required this.experience,
    this.collapsed = true,
  });

  final Experience experience;
  final bool collapsed;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

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
                        color: theme.colors.textColor.withValues(alpha: 0.05),
                        borderRadius: Sizes.borderRadiusSmall,
                        border: Border.all(color: theme.colors.borderColor),
                      ),
                      child: Icon(
                        experience.icon,
                        size: Sizes.iconRegular,
                        color: theme.colors.primaryColor,
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
                              textColor: theme.colors.primaryColor),
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
                            style:
                            Styles.extraSmallText(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: theme.colors.textColor.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(Sizes.iconHuge),
                    border: Border.all(color: theme.colors.borderColor),
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
          ...experience.descriptions
              .map(
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
                    color: theme.colors.primaryColor,
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
            delay: Duration(milliseconds: 400),
            itemDuration: const Duration(milliseconds: 200),
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
