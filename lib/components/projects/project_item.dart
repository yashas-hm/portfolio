part of 'projects_component.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final height = context.height / (context.isMobile ? 2 : 2.5);

    return Container(
      height: height,
      width: context.isMobile ? context.width * 0.8 : context.width / 5,
      clipBehavior: Clip.hardEdge,
      constraints: BoxConstraints(minHeight: height),
      decoration: BoxDecoration(
        color: colors.surfaceColor,
        borderRadius: Sizes.borderRadiusRegular,
        border: Border.all(color: colors.borderColor),
      ),
      child: ClipRRect(
        borderRadius: Sizes.borderRadiusRegular,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCachedImage(
              height: height / 2.5,
              width: double.infinity,
              imageUrl: project.imageUrl,
            ),
            Expanded(
              child: Container(
                padding: Sizes.paddingLarge,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: Sizes.spacingSmallRegular,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: Sizes.spacingRegular,
                      children: [
                        Flexible(
                          child: FittedBox(
                            child: Text(
                              project.name,
                              style: Styles.largeTextBold(),
                            ),
                          ),
                        ),
                        Container(
                          padding: Sizes.paddingXS,
                          decoration: BoxDecoration(
                            borderRadius: Sizes.borderRadiusXS,
                            color: project.tag.color.backgroundColor,
                            border: Border.all(
                              width: 0.3,
                              color: project.tag.color,
                            ),
                          ),
                          child: Text(
                            project.tag.value,
                            style: Styles.extraSmallText(),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: AutoSizeText(
                        project.description,
                        style: Styles.regularText(
                          textColor: colors.textSecondary,
                        ),
                        maxFontSize: 14,
                        minFontSize: 10,
                        stepGranularity: 0.1,
                      ),
                    ),
                    SequentialAnimator(
                      delay: 400.milliseconds,
                      itemDuration: 200.milliseconds,
                      curve: Curves.bounceInOut,
                      animationBuilder: (child, animation) => ScaleTransition(
                        scale:
                            Tween<double>(begin: 0, end: 1).animate(animation),
                        child: child,
                      ),
                      builder: (children) => Wrap(
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.start,
                        spacing: Sizes.spacingMediumSmall,
                        runSpacing: Sizes.spacingMediumSmall,
                        children: children,
                      ),
                      children: project.skills
                          .map((skill) => SkillChip(
                                skill: skill,
                                compact: true,
                              ))
                          .toList(),
                    ),
                    Divider(
                      color: colors.borderColor,
                      height: 1,
                    ),
                    Row(
                      spacing: Sizes.spacingLarge,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: project.links
                          .map(
                            (link) => MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () =>
                                    Utils.safelyLaunchUrl(link.url, context),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: Sizes.spacingSmallRegular,
                                  children: [
                                    Icon(
                                      link.icon,
                                      size: Sizes.iconXS,
                                    ),
                                    Text(
                                      link.urlText,
                                      style: Styles.smallText(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedProjectItem extends StatelessWidget {
  const AnimatedProjectItem({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: 300.milliseconds,
      builder: (_, value, child) => Transform.scale(
        scale: value,
        child: Opacity(
          opacity: value,
          child: child,
        ),
      ),
      child: ProjectItem(project: project),
    );
  }
}
