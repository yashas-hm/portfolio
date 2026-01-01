part of '../about_component.dart';

class SkillCarousel extends StatelessWidget {
  const SkillCarousel({super.key});

  static const double _shadeWidth = 60;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final skills = SkillGroups.allSkills
        .map((skill) => CarouselItem(skill: skill))
        .toList();

    return SizedBox(
      height: Sizes.spacingXXL,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: colors.borderColor,
                ),
              ),
              color: colors.surfaceColor.withValues(alpha: 0.8),
            ),
            padding: EdgeInsets.symmetric(
              vertical: Sizes.spacingMedium,
            ),
            child: AutoScroll(
              speed: 40,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: skills,
              ),
            ),
          ),
          // Left gradient fade
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: _shadeWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    colors.backgroundColor,
                    colors.backgroundColor.withValues(alpha: 0),
                  ],
                ),
              ),
            ),
          ),
          // Right gradient fade
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: _shadeWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    colors.backgroundColor,
                    colors.backgroundColor.withValues(alpha: 0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  const CarouselItem({super.key, required this.skill});

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.spacingLarge),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: Sizes.spacingSmallRegular,
        children: [
          if (skill.icon != null)
            SvgPicture.asset(
              skill.icon!,
              height: Sizes.iconRegular,
              width: Sizes.iconRegular,
              colorFilter: skill.overrideLogoColor
                  ? ColorFilter.mode(
                      colors.textSecondary,
                      BlendMode.srcIn,
                    )
                  : null,
            ),
          Text(
            skill.name,
            style: Styles.smallText(),
          ),
        ],
      ),
    );
  }
}
