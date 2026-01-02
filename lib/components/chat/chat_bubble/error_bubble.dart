part of '../chat_component.dart';

class ErrorBubble extends StatelessWidget {
  const ErrorBubble({
    super.key,
    required this.text,
    required this.onRegenerate,
  });

  final String text;
  final VoidCallback onRegenerate;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isMobileView = context.isMobile || context.width < context.height;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onRegenerate,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: context.width * (isMobileView ? 0.60 : 0.35),
          ),
          margin: EdgeInsets.only(bottom: Sizes.spacingRegular),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            spacing: Sizes.spacingSmall,
            children: [
              Container(
                padding: Sizes.paddingRegular,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Sizes.spacingSmall),
                    topRight: Radius.circular(Sizes.spacingSmall),
                    bottomRight: Radius.circular(Sizes.spacingSmall),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      KnownColors.red600,
                      KnownColors.red100,
                      KnownColors.red600,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Text(
                  text,
                  style: context.isMobile
                      ? Styles.smallText(textColor: colors.onPrimary)
                      : Styles.regularText(textColor: colors.onPrimary),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: Sizes.spacingSmall,
                children: [
                  Text(
                    'Regenerate',
                    style: context.isMobile
                        ? Styles.extraSmallText(textColor: colors.textSecondary)
                        : Styles.smallText(textColor: colors.textSecondary),
                  ),
                  Icon(
                    FontAwesomeIcons.arrowRotateRight,
                    color: colors.textSecondary,
                    size: context.isMobile ? Sizes.iconXXS : Sizes.iconXS,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
