part of '../home_component.dart';

class ChatBlock extends StatelessWidget {
  const ChatBlock({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    bool willWrap = ((width * 2) * 0.95) > context.width;
    final minHeight =
        max<double>(context.isMobile || willWrap ? 500 : 0, height);

    return SizedBox(
      width: width * (willWrap ? 1 : 0.6),
      height: minHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        spacing: Sizes.spacingLarge,
        children: [
          Expanded(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => AppNavigator.push(Routes.chat),
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: colors.surfaceColor,
                    borderRadius: Sizes.borderRadiusRegular,
                    border: Border.all(color: colors.borderColor),
                  ),
                  padding: Sizes.paddingRegular,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: Sizes.spacingRegular,
                    children: [
                      Row(
                        spacing: Sizes.spacingRegular,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: colors.borderColor),
                              borderRadius: Sizes.borderRadiusXS,
                              color: colors.primaryColor.backgroundColor,
                            ),
                            padding: Sizes.paddingSmall,
                            child: Icon(
                              FontAwesomeIcons.satellite,
                              size: Sizes.iconRegularMedium,
                              color: colors.primaryColor,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'AskYashas',
                              style: Styles.smallTextBold(),
                            ),
                          ),
                          Icon(
                            FontAwesomeIcons.arrowUpRightFromSquare,
                            size: Sizes.iconRegular,
                            color: colors.textColor,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Sizes.spacingSmall),
                                topRight: Radius.circular(Sizes.spacingSmall),
                                bottomRight:
                                    Radius.circular(Sizes.spacingSmall),
                              ),
                              color: colors.secondarySurface,
                            ),
                            padding: Sizes.paddingSmall,
                            child: Text(
                              DataConstants.aiText,
                              style: Styles.smallText(),
                            ),
                          ),
                        ),
                      ),
                      Hero(
                        tag: ChatView.heroTag,
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: Sizes.borderRadiusXS,
                            color: colors.backgroundColor,
                            border: Border.all(color: colors.borderColor),
                          ),
                          padding: Sizes.paddingXS,
                          child: AnimatedTextKit(
                            pause: 800.milliseconds,
                            animatedTexts: DataConstants.recommendations
                                .map(
                                  (text) => TypewriterAnimatedText(
                                    text,
                                    cursor: '|',
                                    textStyle: Styles.smallText().copyWith(
                                      color: colors.textSecondary,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                )
                                .toList(),
                            repeatForever: true,
                            displayFullTextOnTap: false,
                          ),
                        ),
                      ),
                      Wrap(
                        runSpacing: Sizes.spacingXS,
                        spacing: Sizes.spacingXS,
                        children: DataConstants.recommendations
                            .take(3)
                            .map(
                              (text) => MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => _quickChat(text),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: Sizes.borderRadiusRegular,
                                      color: colors.secondarySurface,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: Sizes.spacingXS,
                                      horizontal: Sizes.spacingSmall,
                                    ),
                                    child: Text(
                                      text,
                                      style: Styles.extraSmallText(),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: minHeight * 0.4,
            constraints: context.isMobile || willWrap
                ? BoxConstraints(
                    minHeight: 150,
                  )
                : null,
            decoration: BoxDecoration(
              color: colors.surfaceColor,
              borderRadius: Sizes.borderRadiusRegular,
              border: Border.all(color: colors.borderColor),
            ),
            padding: Sizes.paddingRegular,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Sizes.spacingRegular,
              children: [
                Text(
                  'Explore',
                  style: Styles.smallTextBold(),
                ),
                Expanded(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => AppNavigator.push(Routes.projects),
                      child: Container(
                        decoration: BoxDecoration(
                          color: colors.backgroundColor,
                          borderRadius: Sizes.borderRadiusSmall,
                          border: Border.all(color: colors.borderColor),
                        ),
                        padding: Sizes.paddingRegular,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'View Projects',
                                style: Styles.extraSmallTextBold(),
                              ),
                            ),
                            Icon(
                              FontAwesomeIcons.arrowRight,
                              size: Sizes.iconRegular,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => AppNavigator.push(Routes.experience),
                      child: Container(
                        decoration: BoxDecoration(
                          color: colors.backgroundColor,
                          borderRadius: Sizes.borderRadiusSmall,
                          border: Border.all(color: colors.borderColor),
                        ),
                        padding: Sizes.paddingRegular,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'View Career Path',
                                style: Styles.extraSmallTextBold(),
                              ),
                            ),
                            Icon(
                              FontAwesomeIcons.arrowRight,
                              size: Sizes.iconRegular,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _quickChat(String text) {
    ChatRepository.instance.askQuestion(text);
    AppNavigator.push(Routes.chat);
  }
}
