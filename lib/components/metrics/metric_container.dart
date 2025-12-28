part of 'metrics_component.dart';

class MetricContainer extends ConsumerWidget {
  const MetricContainer({super.key, required this.impact});

  final Metric impact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Container(
      height: context.height / 4,
      width: context.isMobile ? context.width : context.width / 5,
      decoration: BoxDecoration(
        color: theme.colors.surfaceColor,
        borderRadius: Sizes.borderRadiusRegular,
        border: Border.all(color: theme.colors.borderColor),
      ),
      padding: Sizes.paddingLarge,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              impact.impactIcon,
              size: Sizes.iconHuge,
              color: theme.colors.textSecondary.withValues(alpha: 0.1),
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
                          color: theme.colors.primaryColor,
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
                color: theme.colors.borderColor,
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
