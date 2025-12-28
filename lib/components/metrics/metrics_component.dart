import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/data/metrics.dart';
import 'package:portfolio/model/metric.dart';
import 'package:portfolio/providers/ui_provider.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/widgets/new_widgets/gradient_text.dart';

part 'metric_container.dart';

class MetricsComponent extends ConsumerWidget {
  const MetricsComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Engineering ',
                    style: Styles.headlineTextBold(
                      textColor: theme.colors.textColor,
                      isMobile: context.isMobile,
                    ),
                  ),
                  GradientText(
                    text: 'Impact',
                    textStyle: Styles.headlineTextBold(
                      isMobile: context.isMobile,
                    ),
                  ),
                  Text(
                    '.',
                    style: Styles.headlineTextBold(
                      textColor: theme.colors.textColor,
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
              'Beyond clean code, I build scalable, efficient systems that drive measurable product growth with AI-native architectures.',
              style: Styles.subText(
                textColor: theme.colors.textSecondary,
                isMobile: context.isMobile,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Gap(Sizes.spacingLarge),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.spacingLarge),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              runAlignment: WrapAlignment.spaceEvenly,
              runSpacing: Sizes.spacingLarge,
              spacing: Sizes.spacingLarge,
              children: Metrics.all
                  .map((impact) => MetricContainer(impact: impact))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
