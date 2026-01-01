part of 'contact_component.dart';

class ContactConnections extends StatelessWidget {
  const ContactConnections({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SizedBox(
      width: context.width * (context.isMobile ? 0.9 : 0.25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: Sizes.spacingLarge,
        children: [
          Container(
            padding: Sizes.paddingLarge,
            decoration: BoxDecoration(
              color: colors.surfaceColor,
              borderRadius: Sizes.borderRadiusRegular,
              border: Border.all(color: colors.borderColor),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Sizes.spacingLarge,
              children: [Links.email, Links.location].map((link) {
                final split = link.urlText.split('\n');
                final headline = split[0];
                final text = split[1];

                return MouseRegion(
                  cursor: link.url.isEmpty
                      ? SystemMouseCursors.basic
                      : SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: link.url.isEmpty
                        ? null
                        : () => Utils.safelyLaunchUrl(link.url, context),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: Sizes.spacingMedium,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: colors.borderColor),
                            borderRadius: Sizes.borderRadiusSmall,
                            color: colors.primaryColor.backgroundColor,
                          ),
                          padding: Sizes.paddingRegular,
                          child: Icon(
                            link.icon,
                            size: Sizes.iconRegularMedium,
                            color: colors.primaryColor,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            spacing: Sizes.spacingXS,
                            children: [
                              Text(
                                headline,
                                style: Styles.smallTextBold(),
                              ),
                              SelectableText(
                                text,
                                style: Styles.smallText(
                                  textColor: colors.textSecondary,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          ClipRRect(
            borderRadius: Sizes.borderRadiusRegular,
            child: Container(
              padding: Sizes.paddingLarge,
              decoration: BoxDecoration(
                color: colors.surfaceColor,
                borderRadius: Sizes.borderRadiusRegular,
                border: Border.all(color: colors.borderColor),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    top: 0,
                    child: Icon(
                      FontAwesomeIcons.comments,
                      size: Sizes.iconHuge * 1.5,
                      color: colors.textSecondary.withValues(alpha: 0.5),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: Sizes.spacingLarge,
                    children: [
                      Text(
                        'Social Protocols',
                        style: Styles.mediumTextBold(),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
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
                              onTap: () =>
                                  Utils.safelyLaunchUrl(link.url, context),
                              child: Icon(
                                link.icon,
                                size: Sizes.iconXL,
                                color: colors.textColor.withValues(alpha: 0.8),
                              ),
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
