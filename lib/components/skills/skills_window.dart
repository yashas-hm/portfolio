part of 'skills_component.dart';

class SkillsWindow extends StatelessWidget {
  const SkillsWindow({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      constraints: BoxConstraints(maxWidth: context.width * 0.9),
      decoration: BoxDecoration(
        borderRadius: Sizes.borderRadiusRegular,
        color: colors.backgroundColor.withValues(alpha: 0.5),
        border: Border.all(
          color: colors.borderColor,
        ),
      ),
      child: ClipRRect(
        borderRadius: Sizes.borderRadiusRegular,
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: colors.secondarySurface,
              ),
              padding: Sizes.paddingRegular,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: Sizes.spacingSmall,
                children: [
                  Container(
                    height: Sizes.spacingRegular,
                    width: Sizes.spacingRegular,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: KnownColors.red400,
                    ),
                  ),
                  Container(
                    height: Sizes.spacingRegular,
                    width: Sizes.spacingRegular,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: KnownColors.amber400,
                    ),
                  ),
                  Container(
                    height: Sizes.spacingRegular,
                    width: Sizes.spacingRegular,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: KnownColors.green400,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: colors.backgroundColor,
                          border:
                              Border.all(color: colors.secondaryBorderColor),
                          borderRadius: Sizes.borderRadiusSmall,
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: Sizes.spacingRegular,
                          children: [
                            Icon(
                              FontAwesomeIcons.solidFolder,
                              size: Sizes.iconRegular,
                              color: colors.textSecondary,
                            ),
                            Text(
                              '~/portfolio/skills',
                              style: Styles.regularText(
                                textColor: colors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: Container(
                padding: Sizes.paddingLarge,
                alignment: Alignment.center,
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  runAlignment: WrapAlignment.spaceEvenly,
                  runSpacing: Sizes.spacingLarge,
                  spacing: Sizes.spacingLarge,
                  children: SkillGroups.all
                      .map((skillGroup) => SkillsContainer(
                            skillGroup: skillGroup,
                          ))
                      .toList(),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: colors.secondarySurface,
              ),
              padding: Sizes.paddingRegular,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: Sizes.spacingSmall,
                children: [
                  Icon(
                    FontAwesomeIcons.arrowRight,
                    color: KnownColors.green500,
                    size: Sizes.spacingRegular,
                  ),
                  Text(
                    '~',
                    style: Styles.regularText(
                      textColor: colors.primaryColor,
                    ),
                  ),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'echo "Stack Initialized Successfully."',
                        style: context.isMobile
                            ? Styles.smallText(
                                textColor:
                                    colors.textColor.withValues(alpha: 0.7),
                              )
                            : Styles.regularText(
                                textColor:
                                    colors.textColor.withValues(alpha: 0.7),
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
