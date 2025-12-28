part of 'skills_component.dart';

class SkillsContainer extends StatelessWidget {
  const SkillsContainer({super.key, required this.skillGroup});

  final SkillGroup skillGroup;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      height: context.isMobile ? null : context.height / 4,
      width: context.isMobile ? context.width : context.width / 5,
      constraints: BoxConstraints(minHeight: context.height / 4),
      decoration: BoxDecoration(
        color: colors.surfaceColor,
        borderRadius: Sizes.borderRadiusRegular,
        border: Border.all(color: colors.borderColor),
      ),
      padding: Sizes.paddingLarge,
      child: Stack(
        children: [
          _randomlyPositionedIcon(colors),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Sizes.spacingLarge,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: Sizes.spacingMedium,
                children: [
                  Icon(
                    skillGroup.groupIcon,
                    color: colors.primaryColor,
                    size: Sizes.iconMedium,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      skillGroup.groupName,
                      style: Styles.mediumTextBold(),
                    ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: colors.borderColor,
                ),
              ),
              SequentialAnimator(
                delay: 400.milliseconds,
                itemDuration: 200.milliseconds,
                curve: Curves.bounceInOut,
                animationBuilder: (child, animation) => ScaleTransition(
                  scale: Tween<double>(begin: 0, end: 1).animate(animation),
                  child: child,
                ),
                builder: (children) => Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  spacing: Sizes.spacingMediumSmall,
                  runSpacing: Sizes.spacingMediumSmall,
                  children: children,
                ),
                children: skillGroup.skills
                    .map((skill) => SkillChip(skill: skill))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Positioned _randomlyPositionedIcon(ThemeColors colors) {
    final r = Random(skillGroup.hashCode);
    double v() => 5 + r.nextDouble() * 10;
    final useTop = r.nextBool();
    return Positioned(
      top: useTop ? v() : null,
      bottom: useTop ? null : v(),
      right: v(),
      child: Icon(
        skillGroup.groupIcon,
        size: Sizes.iconHuge,
        color: colors.primaryColor.withValues(alpha: 0.3),
      ),
    );
  }
}
