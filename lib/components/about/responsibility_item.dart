import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/data/responsibilities.dart';
import 'package:portfolio/model/responsibility.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/widgets/arrow_controller.dart';
import 'package:portfolio/widgets/sliding_carousel.dart';
import 'package:portfolio/widgets/text/gradient_text.dart';

class ResponsibilityItem extends StatefulWidget {
  const ResponsibilityItem({super.key});

  @override
  State<ResponsibilityItem> createState() => _ResponsibilityItemState();
}

class _ResponsibilityItemState extends State<ResponsibilityItem> {
  final SlidingCarouselController _controller = SlidingCarouselController();

  List<Responsibility> get _responsibilities => Responsibilities.all;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: context.width * 0.9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: Sizes.spacingXL,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: Sizes.spacingLarge,
            children: [
              Flexible(
                child: GradientText(
                  text: 'Collaborative *Leadership*',
                  textStyle: Styles.extraLargeTextBold(
                    textColor: context.colors.textColor,
                  ),
                ),
              ),
              if (_controller.showArrows)
                ArrowController(
                  backward: _controller.canGoBack ? _controller.goBack : null,
                  forward:
                      _controller.canGoForward ? _controller.goForward : null,
                ),
            ],
          ),
          // Testimonial carousel
          SlidingCarousel(
            controller: _controller,
            itemCount: _responsibilities.length,
            maxVisibleCount: context.isMobile ? 1 : 3,
            height: context.height / (context.isMobile ? 3.5 : 4.5),
            minHeight: 200,
            minItemWidth: context.isMobile ? null : 350,
            itemBuilder: (context, index) => _ResponsibilityCard(
              responsibility: _responsibilities[index],
            ),
          ),
        ],
      ),
    );
  }
}

class _ResponsibilityCard extends StatelessWidget {
  const _ResponsibilityCard({required this.responsibility});

  final Responsibility responsibility;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: Sizes.paddingLarge,
      decoration: BoxDecoration(
        color: colors.surfaceColor,
        borderRadius: Sizes.borderRadiusRegular,
        border: Border.all(color: responsibility.color),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: Sizes.spacingRegular,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: Sizes.spacingSmall,
                  children: [
                    Text(
                      responsibility.role,
                      style: Styles.mediumTextBold(),
                    ),
                    Text(
                      responsibility.destination,
                      style: Styles.smallText(textColor: responsibility.color),
                    ),
                  ],
                ),
              ),
              Icon(
                responsibility.icon,
                size: Sizes.iconLarge,
                color: responsibility.color,
              ),
            ],
          ),
          Expanded(
            child: AutoSizeText(
              responsibility.description,
              style: Styles.smallRegularText(textColor: colors.textSecondary),
              minFontSize: 10,
              stepGranularity: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
