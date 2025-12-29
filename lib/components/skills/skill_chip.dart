part of 'skills_component.dart';

class SkillChip extends StatelessWidget {
  const SkillChip({super.key, required this.skill, this.compact = false});

  final Skill skill;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        color: skill.backgroundColor,
        borderRadius: compact ? Sizes.borderRadiusXS : Sizes.borderRadiusSmall,
        border: Border.all(
          width: 0.3,
          color: skill.color,
        ),
      ),
      padding: compact
          ? Sizes.paddingXS
          : EdgeInsets.symmetric(
              horizontal: Sizes.spacingSmallRegular,
              vertical: Sizes.spacingXS,
            ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: compact ? Sizes.spacingXS : Sizes.spacingSmall,
        children: [
          if (skill.icon != null)
            SvgPicture.asset(
              skill.icon!,
              height: compact ? Sizes.iconXS : Sizes.iconSmall,
              width: compact ? Sizes.iconXS : Sizes.iconSmall,
              colorFilter: skill.overrideLogoColor
                  ? ColorFilter.mode(
                      colors.textColor,
                      BlendMode.srcIn,
                    )
                  : null,
            ),
          Text(
            skill.name,
            style:
                compact ? Styles.extraSmallTextThin() : Styles.smallTextThin(),
          ),
        ],
      ),
    );
  }
}
