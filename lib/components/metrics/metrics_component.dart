import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/data/metrics.dart';
import 'package:portfolio/model/metric.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/widgets/new_widgets/gradient_text.dart';

part 'metric_item.dart';

class MetricsComponent extends StatelessWidget {
  const MetricsComponent({super.key});

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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Engineering ',
                    style: Styles.headlineTextBold(
                      textColor: colors.textColor,
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
              'Beyond clean code, I build scalable, efficient systems that drive measurable product growth with AI-native architectures.',
              style: Styles.subText(
                textColor: colors.textSecondary,
                isMobile: context.isMobile,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Gap(Sizes.spacingXXL),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.spacingLarge),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              runAlignment: WrapAlignment.spaceEvenly,
              runSpacing: Sizes.spacingLarge,
              spacing: Sizes.spacingLarge,
              children: Metrics.all
                  .map((impact) => MetricItem(impact: impact))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
