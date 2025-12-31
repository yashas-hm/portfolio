import 'package:day_night_themed_switcher/day_night_themed_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/data/links.dart';
import 'package:portfolio/navigation/navigation.dart';
import 'package:portfolio/repositories/theme_repository.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/utilities/utils.dart';
import 'package:portfolio/widgets/new_widgets/grid_background.dart';
import 'package:portfolio/widgets/new_widgets/hover_glow_text.dart';

part 'global_footer.dart';
part 'navbar.dart';

class BasePage extends StatelessWidget {
  const BasePage({
    super.key,
    required this.content,
    this.singlePageContent = false,
  });

  final Widget content;
  final bool singlePageContent;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      appBar: Navbar(),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            Positioned.fill(
              child: GridBackground(
                color: colors.textColor.withValues(alpha: 0.2),
                strokeWidth: 0.5,
                horizontalSpacing: 45,
                verticalSpacing: 45,
                runnerColor: colors.primaryColor,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics().applyTo(
                  ClampingScrollPhysics(),
                ),
                clipBehavior: Clip.none,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Container(
                        alignment: singlePageContent
                            ? Alignment.center
                            : Alignment.topCenter,
                        padding: EdgeInsets.only(
                          top: Sizes.navBarHeight,
                        ),
                        constraints: BoxConstraints(
                          minHeight: context.height,
                        ),
                        child: content,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
