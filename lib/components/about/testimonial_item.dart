part of 'about_component.dart';

class TestimonialItem extends StatefulWidget {
  const TestimonialItem({super.key});

  @override
  State<TestimonialItem> createState() => _TestimonialItemState();
}

class _TestimonialItemState extends State<TestimonialItem> {
  final SlidingCarouselController _controller = SlidingCarouselController();

  List<Testimonial> get _testimonials => Testimonials.all;

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
                  text: '*Professional* Trust',
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
            itemCount: _testimonials.length,
            maxVisibleCount: context.isMobile ? 1 : 2,
            height: context.height / (context.isMobile ? 2.5 : 4),
            minHeight: 250,
            minItemWidth: context.isMobile ? null : 400,
            itemBuilder: (context, index) => _TestimonialCard(
              testimonial: _testimonials[index],
            ),
          ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  const _TestimonialCard({required this.testimonial});

  final Testimonial testimonial;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: Sizes.paddingLarge,
      decoration: BoxDecoration(
        color: colors.surfaceColor,
        borderRadius: Sizes.borderRadiusRegular,
        border: Border.all(color: colors.borderColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: Sizes.spacingRegular,
        children: [
          Icon(
            FontAwesomeIcons.quoteLeft,
            size: Sizes.iconLarge,
            color: KnownColors.purple500,
          ),
          Gap(Sizes.spacingSmall),
          Expanded(
            child: AutoSizeText(
              testimonial.message,
              style: Styles.regularText(),
              minFontSize: 10,
              maxFontSize: 14,
              stepGranularity: 0.1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: Sizes.iconRegular,
                backgroundColor: colors.primaryColor.withValues(alpha: 0.1),
                child: Text(
                  testimonial.name[0],
                  style: Styles.regularTextBold(textColor: colors.primaryColor),
                ),
              ),
              Gap(Sizes.spacingRegular),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      testimonial.name,
                      style: Styles.smallTextBold(),
                    ),
                    Text(
                      testimonial.designation,
                      style: Styles.extraSmallText(
                        textColor: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
