part of 'experiences_component.dart';

class ExperienceItem extends StatefulWidget {
  const ExperienceItem({
    super.key,
    required this.experience,
    this.collapsed = true,
  });

  final Experience experience;
  final bool collapsed;

  @override
  State<ExperienceItem> createState() => _ExperienceItemState();
}

class _ExperienceItemState extends State<ExperienceItem> {
  bool _collapsed = false;

  @override
  void initState() {
    _collapsed = widget.collapsed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MouseRegion(
      cursor: _collapsed ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: _collapsed ? () => setState(() => _collapsed = false) : null,
        child: TimelineContainer(
          present: widget.experience.present,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.spaceBetween,
                  runSpacing: Sizes.spacingRegular,
                  spacing: Sizes.spacingRegular,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: _collapsed
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: Sizes.spacingLarge,
                      children: [
                        AnimatedContainer(
                          duration: 300.milliseconds,
                          curve: Curves.easeInOut,
                          padding: _collapsed
                              ? EdgeInsets.zero
                              : Sizes.paddingMedium,
                          decoration: BoxDecoration(
                            color: _collapsed
                                ? Colors.transparent
                                : colors.textColor.withValues(alpha: 0.05),
                            borderRadius: Sizes.borderRadiusSmall,
                            border: _collapsed
                                ? null
                                : Border.all(color: colors.borderColor),
                          ),
                          child: Icon(
                            _collapsed
                                ? FontAwesomeIcons.chevronRight
                                : widget.experience.icon,
                            size: _collapsed
                                ? Sizes.iconRegular
                                : Sizes.iconMedium,
                            color: _collapsed
                                ? colors.textSecondary
                                : colors.primaryColor,
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.experience.role,
                                style: Styles.mediumTextBold(),
                              ),
                              Text(
                                widget.experience.company,
                                style: Styles.smallTextBold(
                                  textColor: _collapsed
                                      ? colors.textSecondary
                                      : colors.primaryColor,
                                ),
                              ),
                              Gap(Sizes.spacingSmall),
                              Container(
                                padding: Sizes.paddingXS,
                                decoration: BoxDecoration(
                                  borderRadius: Sizes.borderRadiusXS,
                                  color: widget
                                      .experience.type.color.backgroundColor,
                                  border: Border.all(
                                    width: 0.3,
                                    color: widget.experience.type.color,
                                  ),
                                ),
                                child: Text(
                                  widget.experience.type.value,
                                  style: Styles.extraSmallText(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: colors.textColor.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(Sizes.iconHuge),
                        border: Border.all(color: colors.borderColor),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: Sizes.spacingSmall,
                        horizontal: Sizes.spacingRegular,
                      ),
                      child: Text(
                        Utils.convertToTimeline(widget.experience),
                        style: Styles.extraSmallText(),
                      ),
                    ),
                  ],
                ),
              ),
              if (!_collapsed) ...[
                Gap(Sizes.spacingLarge),
                SequentialAnimator(
                  itemDuration: 200.milliseconds,
                  curve: Curves.bounceInOut,
                  animationBuilder: (child, animation) => FadeTransition(
                    opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                    child: child,
                  ),
                  builder: (children) => Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: Sizes.spacingMedium,
                    children: children,
                  ),
                  children: widget.experience.descriptions
                      .map(
                        (description) => Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          spacing: Sizes.spacingMedium,
                          children: [
                            Baseline(
                              baseline: Styles.regularText().fontSize!,
                              baselineType: TextBaseline.alphabetic,
                              child: Icon(
                                description.icon,
                                size: Sizes.iconSmall,
                                color: colors.primaryColor,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                description.description,
                                style: Styles.regularText(),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                )
              ],
              if (!_collapsed) ...[
                Gap(Sizes.spacingLarge),
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
                  children: widget.experience.skills
                      .map((skill) => SkillChip(skill: skill))
                      .toList(),
                ),
              ],
              // If widget collapsed true means it is collapsible
              if (!_collapsed && widget.collapsed) ...[
                Gap(Sizes.spacingMedium),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => setState(() => _collapsed = true),
                      child: BounceAnimator(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FontAwesomeIcons.chevronUp,
                              size: Sizes.iconSmall,
                              color: colors.textSecondary,
                            ),
                            Text(
                              'Collapse',
                              style: Styles.smallText(
                                  textColor: colors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
