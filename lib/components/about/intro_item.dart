part of 'about_component.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isMobileView = context.isMobile || context.width < context.height;

    return SizedBox(
      width: context.width * 0.9,
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: Sizes.spacingXXL,
        runSpacing: Sizes.spacingXXL,
        children: [
          DisplayImage(),
          Container(
            width: context.width * (context.isMobile ? 0.9 : 0.3),
            constraints: BoxConstraints(
              minWidth: 500,
            ),
            child: Column(
              crossAxisAlignment: isMobileView
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              spacing: Sizes.spacingSmall,
              children: [
                Text(
                  DataConstants.role,
                  style: Styles.smallTextBold(
                    textColor: colors.primaryColor,
                  ),
                ),
                GradientText(
                  text: 'Architecting *Intelligent* Systems.',
                  textStyle: Styles.headlineTextBold(
                    textColor: colors.textColor,
                    isMobile: context.isMobile,
                  ),
                  textAlign: isMobileView ? TextAlign.center : TextAlign.start,
                ),
                Text(
                  DataConstants.summary,
                  style: Styles.subText(
                    textColor: colors.textSecondary,
                    isMobile: context.isMobile,
                  ),
                  textAlign: isMobileView ? TextAlign.center : TextAlign.start,
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
