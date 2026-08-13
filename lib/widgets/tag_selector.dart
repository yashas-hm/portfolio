import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/model/tag_item.dart';
import 'package:portfolio/utilities/extensions.dart';

class TagSelector<T extends TagItem> extends StatelessWidget {
  const TagSelector({
    super.key,
    required this.items,
    required this.selectedTag,
    required this.onChanged,
  });

  final List<T> items;
  final T selectedTag;
  final Function(T) onChanged;

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
        children: items
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
