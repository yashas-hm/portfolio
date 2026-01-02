part of 'base_page.dart';

class GlobalFooter extends StatelessWidget {
  const GlobalFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: context.width,
      color: colors.surfaceColor,
      padding: Sizes.paddingRegular,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: context.isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: Sizes.spacingRegular,
        children: [
          Text(
            '// Connect',
            style: Styles.smallRegularTextBold(textColor: colors.primaryColor),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: context.isMobile
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: Sizes.spacingLarge,
            children: [
              Links.linkedin,
              Links.github,
              Links.medium,
            ].map((link) {
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => Utils.safelyLaunchUrl(link.url, context),
                  child: Icon(
                    link.icon,
                    size: Sizes.iconLarge,
                    color: colors.onPrimary.withValues(alpha: 0.8),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: context.isMobile
                  ? WrapAlignment.center
                  : WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: Sizes.spacingSmallRegular,
              spacing: Sizes.spacingSmall,
              textDirection: TextDirection.rtl,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Built with ',
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: SvgPicture.asset(
                            LogoAssets.flutterLogo,
                            height: Sizes.iconSmall,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        TextSpan(
                          text: ' Flutter',
                          style: Styles.smallTextBold(
                            textColor: colors.textColor,
                          ),
                        ),
                        TextSpan(
                          text: '  |  ',
                        ),
                        TextSpan(
                          text: 'Deployed on ',
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: SvgPicture.asset(
                            LogoAssets.vercelLogo,
                            height: Sizes.iconSmall,
                            fit: BoxFit.fitHeight,
                            colorFilter: ColorFilter.mode(
                              colors.textColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: ' Vercel',
                          style: Styles.smallTextBold(
                            textColor: colors.textColor,
                          ),
                        ),
                      ],
                      style: Styles.smallText(textColor: colors.textColor),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: Sizes.spacingSmall,
                    children: [
                      Icon(
                        FontAwesomeIcons.copyright,
                        color: colors.textColor,
                        size: Sizes.iconXS,
                      ),
                      Text(
                        'Designed & Built by Yashas H Majmudar · ${DateTime.now().year}',
                        style: Styles.smallText(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
