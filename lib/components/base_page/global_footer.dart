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
            style: Styles.smallRegularTextBold(
              textColor: colors.primaryColor,
            ),
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
                    color: colors.textColor.withValues(alpha: 0.8),
                  ),
                ),
              );
            }).toList(),
          ),
          Gap(Sizes.spacingSmall),
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

class SliverStretchingFooter extends SingleChildRenderObjectWidget {
  const SliverStretchingFooter({
    super.key,
    required Widget child,
    required this.stretchColor,
  }) : super(child: child);

  final Color stretchColor;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderSliverStretchingFooter(stretchColor: stretchColor);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderSliverStretchingFooter renderObject,
  ) {
    renderObject.stretchColor = stretchColor;
  }
}

class RenderSliverStretchingFooter extends RenderSliverSingleBoxAdapter {
  RenderSliverStretchingFooter({required Color stretchColor})
      : _stretchColor = stretchColor;

  Color _stretchColor;

  Color get stretchColor => _stretchColor;

  set stretchColor(Color value) {
    if (_stretchColor == value) return;
    _stretchColor = value;
    markNeedsPaint();
  }

  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }

    child!.layout(constraints.asBoxConstraints(), parentUsesSize: true);
    final childHeight = child!.size.height;

    final paintedChildHeight =
        calculatePaintOffset(constraints, from: 0, to: childHeight);
    final cacheExtent =
        calculateCacheOffset(constraints, from: 0, to: childHeight);

    // Calculate overscroll stretch at bottom
    final overscroll = constraints.remainingPaintExtent > childHeight
        ? constraints.remainingPaintExtent - childHeight
        : 0.0;

    geometry = SliverGeometry(
      scrollExtent: childHeight,
      paintExtent: paintedChildHeight + overscroll,
      maxPaintExtent: childHeight + overscroll,
      layoutExtent: paintedChildHeight,
      cacheExtent: cacheExtent,
      hasVisualOverflow: true,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null || !geometry!.visible) return;

    final childHeight = child!.size.height;
    final overscroll = constraints.remainingPaintExtent > childHeight
        ? constraints.remainingPaintExtent - childHeight
        : 0.0;

    // Paint stretch area at top first
    if (overscroll > 0) {
      final stretchRect = Rect.fromLTWH(
        offset.dx,
        offset.dy,
        constraints.crossAxisExtent,
        overscroll,
      );
      context.canvas.drawRect(stretchRect, Paint()..color = stretchColor);
    }

    // Paint child below the stretch area (footer stays at bottom)
    context.paintChild(child!, offset + Offset(0, overscroll));
  }
}
