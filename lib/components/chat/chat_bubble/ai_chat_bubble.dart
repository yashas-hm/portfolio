part of '../chat_component.dart';

class AiChatBubble extends StatelessWidget {
  const AiChatBubble({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      constraints: BoxConstraints(
        maxWidth: context.width * (context.isMobile ? 0.60 : 0.35),
      ),
      margin: EdgeInsets.only(bottom: Sizes.spacingRegular),
      padding: Sizes.paddingRegular,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.spacingSmall),
          topRight: Radius.circular(Sizes.spacingSmall),
          bottomRight: Radius.circular(Sizes.spacingSmall),
        ),
        color: colors.secondarySurface,
      ),
      child: MarkdownBody(
        data: text,
        selectable: true,
        onTapLink: (_, href, title) => Utils.safelyLaunchUrl(href, context),
        styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
          p: context.isMobile ? Styles.smallText() : Styles.regularText(),
          strong: context.isMobile
              ? Styles.smallTextBold()
              : Styles.regularTextBold(),
          em: (context.isMobile ? Styles.smallText() : Styles.regularText())
              .copyWith(fontStyle: FontStyle.italic),
          listBullet:
              context.isMobile ? Styles.smallText() : Styles.regularText(),
          a: (context.isMobile ? Styles.smallText() : Styles.regularText())
              .copyWith(
            decoration: TextDecoration.underline,
            color: KnownColors.blue600,
          ),
        ),
      ),
    );
  }
}
