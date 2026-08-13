import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/data/contributions.dart';
import 'package:portfolio/model/contribution.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/utilities/utils.dart';
import 'package:portfolio/widgets/sequential_animator.dart';
import 'package:portfolio/widgets/text/gradient_text.dart';
import 'package:portfolio/widgets/text/subtext.dart';

part 'contribution_item.dart';

class ContributionsComponent extends StatelessWidget {
  const ContributionsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final totalIssues =
        Contributions.all.fold(0, (sum, c) => sum + c.entries.length);
    final totalMerged =
        Contributions.all.fold(0, (sum, c) => sum + c.mergedCount);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.spacingXXL),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: context.width * 0.9,
            child: GradientText(
              text: 'Open Source *Contributions*',
              textStyle: Styles.headlineTextBold(
                textColor: colors.textColor,
                isMobile: context.isMobile,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Gap(Sizes.spacingMedium),
          Subtext(
            'Bugs squashed, features shipped, PRs merged across Flutter and beyond.',
          ),
          Gap(Sizes.spacingXL),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: Sizes.spacingLarge,
            children: [
              _StatChip(
                label: '$totalIssues Issues',
                color: colors.primaryColor,
              ),
              _StatChip(
                label: '$totalMerged PRs Merged',
                color: KnownColors.purple500,
              ),
            ],
          ),
          Gap(Sizes.spacingXXL),
          Container(
            alignment: Alignment.center,
            width: context.width * 0.9,
            child: SequentialAnimator(
              delay: 200.milliseconds,
              itemDuration: 150.milliseconds,
              curve: Curves.easeOut,
              animationBuilder: (child, animation) => ScaleTransition(
                scale: Tween<double>(begin: 0, end: 1).animate(animation),
                child: child,
              ),
              builder: (children) => Wrap(
                alignment: WrapAlignment.center,
                spacing: Sizes.spacingLarge,
                runSpacing: Sizes.spacingLarge,
                children: children,
              ),
              children: Contributions.all
                  .map((c) => ContributionCard(contribution: c))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.spacingMedium,
        vertical: Sizes.spacingSmall,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        border: Border.all(color: color, width: 0.5),
        borderRadius: Sizes.borderRadiusSmall,
      ),
      child: Text(label, style: Styles.smallTextBold(textColor: color)),
    );
  }
}
