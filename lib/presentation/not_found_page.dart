import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/components/base_page/base_page.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/navigation/navigation.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/widgets/new_widgets/text/gradient_text.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BasePage(
      singlePageContent: true,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: Sizes.spacingMedium,
        children: [
          SizedBox(
            width: context.width * 0.8,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: GradientText(
                text: '404',
                textStyle: Styles.regularTextBold().copyWith(
                  fontSize: 80,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            width: context.width * 0.9,
            child: Text(
              'Page Not Found',
              style: Styles.headlineTextBold(
                textColor: colors.textColor,
                isMobile: context.isMobile,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: context.width * (context.isMobile ? 0.9 : 0.4),
            child: Text(
              'Oops! Looks like this page took a vacation without telling anyone.',
              style: Styles.subText(
                textColor: colors.textSecondary,
                isMobile: context.isMobile,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Gap(Sizes.spacingRegular),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => AppNavigator.pushReplacement(Routes.home),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.iconHuge),
                  color: colors.textColor,
                ),
                padding: Sizes.paddingRegular,
                child: Text(
                  'Try the homepage?',
                  style: Styles.smallTextBold(
                    textColor: colors.backgroundColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
