import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/utilities/extensions.dart';

class WindowContainer extends StatelessWidget {
  const WindowContainer({
    super.key,
    required this.content,
    required this.headline,
    required this.headlineIcon,
    required this.bottomText,
  });

  final Widget content;
  final String headline;
  final IconData headlineIcon;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AnimatedSize(
      duration: 200.milliseconds,
      child: Container(
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
                                headlineIcon,
                                size: Sizes.iconRegular,
                                color: colors.textSecondary,
                              ),
                              Text(
                                headline,
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
                child: Align(
                  alignment: Alignment.center,
                  child: content,
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
                          'echo "$bottomText"',
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
      ),
    );
  }
}
