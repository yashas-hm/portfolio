part of 'home_component.dart';

class MetricsItem extends StatelessWidget {
  const MetricsItem({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SizedBox(
      width: context.width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: context.width * 0.9,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: GradientText(
                text: 'Engineering *Impact*.',
                textStyle: Styles.headlineTextBold(
                  textColor: colors.textColor,
                  isMobile: context.isMobile,
                ),
              ),
            ),
          ),
          Gap(Sizes.spacingMedium),
          Subtext(
            'Beyond clean code, I build scalable, efficient systems that drive measurable product growth with AI-native architectures.',
          ),
          Gap(Sizes.spacingXL),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            runAlignment: WrapAlignment.start,
            runSpacing: Sizes.spacingLarge,
            spacing: Sizes.spacingLarge,
            children: Metrics.all
                .map((impact) => _MetricCard(impact: impact))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.impact});

  final Metric impact;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      height: 300,
      width: context.isMobile ? context.width : context.width / 5.5,
      constraints: BoxConstraints(
        minWidth: 250,
      ),
      decoration: BoxDecoration(
        color: colors.surfaceColor,
        borderRadius: Sizes.borderRadiusRegular,
        border: Border.all(color: colors.borderColor),
      ),
      padding: Sizes.paddingLarge,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              impact.impactIcon,
              size: Sizes.iconHuge,
              color: colors.textSecondary.withValues(alpha: 0.1),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                impact.name,
                style: Styles.smallText(),
              ),
              Gap(Sizes.spacingSmall),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        impact.metric,
                        style: Styles.emphasisText(isMobile: context.isMobile),
                      ),
                      Gap(Sizes.spacingSmall),
                      Baseline(
                        baseline:
                            Styles.emphasisText(isMobile: context.isMobile)
                                .fontSize!,
                        baselineType: TextBaseline.alphabetic,
                        child: Icon(
                          impact.metricSuffixIcon,
                          size: Sizes.iconMedium,
                          color: colors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Gap(Sizes.spacingLarge),
                  Icon(
                    impact.suffixIcon,
                    size: Sizes.iconLarge,
                    color: KnownColors.green500,
                  ),
                ],
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Divider(
                    color: colors.borderColor,
                  ),
                ),
              ),
              Gap(Sizes.spacingRegular),
              Text(
                impact.details,
                style: Styles.regularText(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
