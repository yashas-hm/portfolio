part of 'skills_component.dart';

class SkillChip extends StatelessWidget {
  const SkillChip({super.key, required this.skill});

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        color: skill.backgroundColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 0.3,
          color: skill.color,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.spacingRegular,
        vertical: Sizes.spacingSmall,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (skill.icon != null) ...[
            SvgPicture.asset(
              skill.icon!,
              height: Sizes.iconSmall,
              width: Sizes.iconSmall,
              colorFilter: skill.overrideLogoColor
                  ? ColorFilter.mode(
                      colors.textColor,
                      BlendMode.srcIn,
                    )
                  : null,
            ),
            Gap(Sizes.spacingSmall),
          ],
          Text(
            skill.name,
            style: Styles.smallTextThin(),
          ),
        ],
      ),
    );
  }
}
