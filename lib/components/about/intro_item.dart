part of 'about_component.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SizedBox(
      width: context.width * (context.isMobile ? 0.9 : 0.6),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: Sizes.spacingXXL,
        runSpacing: Sizes.spacingXL,
        children: [
          DisplayImage(),
          Container(
            constraints: BoxConstraints(
              maxWidth: context.width * (context.isMobile ? 0.9 : 0.3),
            ),
            child: Column(
              crossAxisAlignment: context.isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              spacing: Sizes.spacingSmall,
              children: [
                Text(
                  About.role,
                  style: Styles.smallTextBold(
                    textColor: colors.primaryColor,
                  ),
                ),
                Wrap(
                  alignment: context.isMobile
                      ? WrapAlignment.center
                      : WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  children: [
                    Text(
                      'Architecting ',
                      style: Styles.headlineTextBold(
                        textColor: colors.textColor,
                        isMobile: context.isMobile,
                      ),
                    ),
                    GradientText(
                      text: 'Intelligent',
                      textStyle: Styles.headlineTextBold(
                        isMobile: context.isMobile,
                      ),
                    ),
                    Text(
                      ' Systems.',
                      style: Styles.headlineTextBold(
                        textColor: colors.textColor,
                        isMobile: context.isMobile,
                      ),
                    ),
                  ],
                ),
                Text(
                  About.summary,
                  style: Styles.subText(
                    textColor: colors.textSecondary,
                    isMobile: context.isMobile,
                  ),
                  textAlign:
                      context.isMobile ? TextAlign.center : TextAlign.start,
                ),
                Gap(Sizes.spacingLarge),
                SkillCarousel(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
