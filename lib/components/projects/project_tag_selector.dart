part of 'projects_component.dart';

class ProjectTagSelector extends StatelessWidget {
  const ProjectTagSelector({
    super.key,
    required this.selectedTag,
    required this.onChanged,
  });

  final ProjectTag selectedTag;
  final Function(ProjectTag) onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: context.width * 0.9,
      constraints: BoxConstraints(minWidth: 400),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: Sizes.spacingMedium,
        runSpacing: Sizes.spacingMedium,
        children: ProjectTag.values
            .map(
              (tag) => MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => onChanged(tag),
                  child: AnimatedContainer(
                    duration: 400.milliseconds,
                    decoration: BoxDecoration(
                      borderRadius: selectedTag == tag
                          ? Sizes.borderRadiusRegular
                          : Sizes.borderRadiusSmall,
                      border: selectedTag == tag
                          ? null
                          : Border.all(color: colors.borderColor),
                      color: selectedTag == tag
                          ? colors.primaryColor
                          : colors.secondarySurface,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.spacingRegular,
                      vertical: Sizes.spacingSmall,
                    ),
                    child: Text(
                      tag.value,
                      style: selectedTag == tag
                          ? Styles.smallTextBold(textColor: colors.onPrimary)
                          : Styles.smallText(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
