part of 'skills_component.dart';

class SkillChip extends ConsumerWidget {
  const SkillChip({super.key, required this.skill});

  final Skill skill;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Container(
      decoration: BoxDecoration(
        color: skill.backgroundColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
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
                      theme.colors.textColor,
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
