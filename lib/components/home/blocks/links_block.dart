part of '../home_component.dart';

class LinksBlock extends StatelessWidget {
  const LinksBlock({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    bool willWrap = (width * 2) * 0.95 > context.width;

    final height = max<double>(200, this.height / 2.5);
    final maxWidth =
        width + Sizes.spacingLarge + (width * (willWrap ? 1 : 0.6));
    final boxSize = context.isMobile
        ? ((context.width * 0.9) - Sizes.spacingLarge) / 2
        : height;
    final blockWidth = maxWidth -
        (context.isMobile ? 0 : (boxSize * 2 + Sizes.spacingLarge * 2));

    return Wrap(
      textDirection: TextDirection.rtl,
      runAlignment: WrapAlignment.center,
      alignment: WrapAlignment.center,
      spacing: Sizes.spacingLarge,
      runSpacing: Sizes.spacingLarge,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => AppNavigator.push(Routes.skills),
            child: Container(
              height: height,
              width: willWrap ? width : blockWidth,
              constraints: context.isMobile
                  ? BoxConstraints(
                      minHeight: 250,
                    )
                  : null,
              decoration: BoxDecoration(
                color: colors.surfaceColor,
                borderRadius: Sizes.borderRadiusRegular,
                border: Border.all(color: colors.borderColor),
              ),
              padding: Sizes.paddingLarge,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Sizes.spacingRegular,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: Sizes.spacingRegular,
                    children: [
                      Expanded(
                        child: Text(
                          'Core Stack',
                          style: Styles.regularTextBold(),
                        ),
                      ),
                      Text(
                        'View All ->',
                        style: Styles.smallText(textColor: colors.primaryColor),
                      ),
                    ],
                  ),
                  Divider(
                    color: colors.borderColor,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: SequentialAnimator(
                        delay: 400.milliseconds,
                        itemDuration: 200.milliseconds,
                        curve: Curves.bounceInOut,
                        animationBuilder: (child, animation) => ScaleTransition(
                          scale: Tween<double>(begin: 0, end: 1)
                              .animate(animation),
                          child: child,
                        ),
                        builder: (children) => Wrap(
                          alignment: WrapAlignment.start,
                          runAlignment: WrapAlignment.start,
                          spacing: Sizes.spacingMediumSmall,
                          runSpacing: Sizes.spacingMediumSmall,
                          children: children,
                        ),
                        children: Skills.coreStack
                            .map((skill) => SkillChip(
                                  skill: skill,
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: Sizes.spacingLarge,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => AppNavigator.push(Routes.talks),
                child: Container(
                  height: boxSize,
                  width: boxSize,
                  decoration: BoxDecoration(
                    color: colors.surfaceColor,
                    borderRadius: Sizes.borderRadiusRegular,
                    border: Border.all(color: colors.borderColor),
                  ),
                  padding: Sizes.paddingRegular,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: KnownColors.purple500),
                                borderRadius: Sizes.borderRadiusSmall,
                                color: KnownColors.purple500.backgroundColor,
                              ),
                              padding: Sizes.paddingSmall,
                              child: Icon(
                                FontAwesomeIcons.microphoneLines,
                                size: Sizes.iconMedium,
                                color: KnownColors.purple500,
                              ),
                            ),
                            Icon(
                              FontAwesomeIcons.arrowUpRightFromSquare,
                              size: Sizes.iconRegular,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Talks',
                        style: Styles.regularTextBold(),
                      ),
                      Text(
                        DataConstants.latestTalk.name,
                        style:
                            Styles.smallText(textColor: colors.textSecondary),
                      ),
                      Text(
                        DataConstants.latestTalk.host,
                        style: Styles.extraSmallText(
                            textColor: colors.textSecondary),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => AppNavigator.push(Routes.contributions),
                child: Container(
                  height: boxSize,
                  width: boxSize,
                  decoration: BoxDecoration(
                    color: colors.surfaceColor,
                    borderRadius: Sizes.borderRadiusRegular,
                    border: Border.all(color: colors.borderColor),
                  ),
                  padding: Sizes.paddingRegular,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: KnownColors.green600),
                                borderRadius: Sizes.borderRadiusSmall,
                                color: KnownColors.green600.backgroundColor,
                              ),
                              padding: Sizes.paddingSmall,
                              child: Icon(
                                FontAwesomeIcons.codeBranch,
                                size: Sizes.iconMedium,
                                color: KnownColors.green600,
                              ),
                            ),
                            Icon(
                              FontAwesomeIcons.arrowUpRightFromSquare,
                              size: Sizes.iconRegular,
                            ),
                          ],
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Top Contributions',
                          style: Styles.regularTextBold(),
                        ),
                      ),
                      Text(
                        DataConstants.topContributions,
                        style: Styles.extraSmallText(
                          textColor: colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
