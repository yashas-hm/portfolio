part of '../chat_component.dart';

class HumanChatBubble extends StatelessWidget {
  const HumanChatBubble({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isMobileView = context.isMobile || context.width < context.height;

    return Container(
      constraints: BoxConstraints(
        maxWidth: context.width * (isMobileView ? 0.60 : 0.35),
      ),
      margin: EdgeInsets.only(bottom: Sizes.spacingRegular),
      padding: Sizes.paddingRegular,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizes.spacingSmall),
          topRight: Radius.circular(Sizes.spacingSmall),
          bottomLeft: Radius.circular(Sizes.spacingSmall),
        ),
        gradient: LinearGradient(
          colors: [
            KnownColors.blue700,
            KnownColors.blue300,
            KnownColors.blue700
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
    );
  }
}
