part of 'metrics_component.dart';

class MetricContainer extends StatelessWidget {
  const MetricContainer({super.key, required this.impact});

  final Metric impact;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      height: context.height / 4,
      width: context.isMobile ? context.width : context.width / 5,
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
                        style: Styles.emphasisText(),
                      ),
                      Gap(Sizes.spacingSmall),
                      Baseline(
                        baseline: Styles.emphasisText().fontSize!,
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
              Expanded(
                child: Container(),
              ),
              Divider(
                color: colors.borderColor,
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
