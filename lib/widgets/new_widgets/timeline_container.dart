import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/providers/ui_provider.dart';
import 'package:portfolio/utilities/extensions.dart';

class TimelineContainer extends StatelessWidget {
  const TimelineContainer({
    super.key,
    required this.child,
    this.showContainer = true,
    this.present = false,
  });

  final Widget child;
  final bool present;
  final bool showContainer;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    return Container(
      width: context.width * (context.isMobile ? 0.9 : 0.6),
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: colors.borderColor,
            width: 1.5,
          ),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (showContainer)
            TimelineIndicator(
              present: present,
            ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: showContainer ? Sizes.spacingRegular : Sizes.spacingXL,
              bottom: showContainer ? Sizes.spacingRegular : Sizes.spacingSmall,
              left: context.isMobile ? Sizes.spacingXL : Sizes.spacingXXL,
            ),
            padding: EdgeInsets.symmetric(
              horizontal:
                  showContainer ? Sizes.spacingLarge : Sizes.spacingSmall,
              vertical: showContainer ? Sizes.spacingLarge : Sizes.spacingSmall,
            ),
            decoration: showContainer
                ? BoxDecoration(
                    borderRadius: Sizes.borderRadiusRegular,
                    border: Border.all(color: colors.borderColor),
                    color: colors.surfaceColor,
                  )
                : null,
            child: child,
          ),
        ],
      ),
    );
  }
}

class TimelineIndicator extends ConsumerWidget {
  const TimelineIndicator({super.key, this.present = false});

  final bool present;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;

    double size = Sizes.iconXXS;

    if (present) {
      size = Sizes.iconXS;
    }

    return Positioned(
      left: -(size / 1.7),
      top: Sizes.spacingXL,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: present
              ? colors.backgroundColor
              : colors.textSecondary,
          boxShadow: [
            if (present)
              BoxShadow(
                color: KnownColors.green100,
                spreadRadius: 2.5,
                blurRadius: 4,
              ),
          ],
        ),
        alignment: Alignment.center,
        child: present
            ? Container(
                height: size / 2,
                width: size / 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: KnownColors.green400,
                ),
              )
            : null,
      ),
    );
  }
}
