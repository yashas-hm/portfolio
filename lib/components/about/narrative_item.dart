part of 'about_component.dart';

class NarrativeItem extends StatelessWidget {
  const NarrativeItem({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isMobileView = context.isMobile || context.width < context.height;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: context.width * 0.9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: Sizes.spacingXL,
        children: [
          SizedBox(
            width: context.width * 0.9,
            child: Wrap(
              alignment:
                  isMobileView ? WrapAlignment.center : WrapAlignment.start,
              runAlignment: WrapAlignment.center,
              children: [
                Text(
                  'Engineering ',
                  style: Styles.extraLargeTextBold(
                    textColor: colors.textColor,
                  ),
                ),
                GradientText(
                  text: 'Philosophy',
                  textStyle: Styles.extraLargeTextBold(),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: isMobileView
                  ? WrapAlignment.center
                  : WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.start,
              runSpacing: Sizes.spacingLarge,
              spacing: Sizes.spacingLarge,
              children: Narratives.all
                  .map((narrative) => _NarrativeCard(narrative: narrative))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _NarrativeCard extends StatelessWidget {
  const _NarrativeCard({required this.narrative});

  final Narrative narrative;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return ClipRRect(
      borderRadius: Sizes.borderRadiusRegular,
      child: Container(
        height: context.height / 3.5,
        width: context.isMobile ? context.width : context.width / 5,
        constraints: BoxConstraints(
          minWidth: 250,
          minHeight: 300,
        ),
        decoration: BoxDecoration(
          color: colors.surfaceColor,
          borderRadius: Sizes.borderRadiusRegular,
          border: Border.all(color: colors.borderColor),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                narrative.baseIcon,
                size: Sizes.iconHuge * 1.5,
                color: colors.textColor.withValues(alpha: 0.1),
              ),
            ),
            Padding(
              padding: Sizes.paddingLarge,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: narrative.color),
                      borderRadius: Sizes.borderRadiusSmall,
                      color: narrative.color.backgroundColor,
                    ),
                    padding: Sizes.paddingRegular,
                    child: Icon(
                      narrative.icon,
                      size: Sizes.iconRegularMedium,
                      color: narrative.color,
                    ),
                  ),
                  Gap(Sizes.spacingLarge),
                  Text(
                    narrative.headline,
                    style: Styles.regularTextBold(),
                  ),
                  Gap(Sizes.spacingRegular),
                  Expanded(
                    child: AutoSizeText.rich(
                      style: Styles.smallText(
                        textColor: colors.textSecondary,
                      ),
                      minFontSize: 10,
                      maxFontSize: 14,
                      stepGranularity: 0.1,
                      TextSpan(
                        children: narrative.description.toMarkdownSpans(
                          normalStyle: Styles.smallRegularText(
                            textColor: colors.textSecondary,
                          ),
                          boldStyle: Styles.smallRegularTextBold(
                            textColor: colors.textColor.withValues(alpha: 0.8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
