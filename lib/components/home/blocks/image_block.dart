part of '../home_component.dart';

class ImageBlock extends StatelessWidget {
  const ImageBlock({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final minHeight = max<double>(context.isMobile ? 300 : 0, height);

    return ClipRRect(
      borderRadius: Sizes.borderRadiusRegular,
      child: Container(
        height: height,
        width: width,
        constraints: BoxConstraints(
          minHeight: minHeight,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            _GIFImage(minHeight, width),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
                child: Container(
                  color: KnownColors.transparent,
                ),
              ),
            ),
            Padding(
              padding: Sizes.paddingLarge,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Sizes.spacingSmallRegular,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            'Hello 👋🏻, I\'m\nYashas H Majmudar',
                            style: Styles.headlineTextBold(
                              isMobile: context.isMobile,
                            ),
                          ),
                        ),
                        Wrap(
                          alignment: WrapAlignment.start,
                          runAlignment: WrapAlignment.start,
                          spacing: 0,
                          runSpacing: 0,
                          children: [
                            Text(
                              'Architecting ',
                              style: Styles.extraExtraLargeText(),
                            ),
                            ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                colors: const [
                                  KnownColors.blue700,
                                  KnownColors.blue300,
                                  KnownColors.blue700,
                                ],
                              ).createShader(bounds),
                              blendMode: BlendMode.srcIn,
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: DataConstants.introTyperText
                                    .map(
                                      (text) => TypewriterAnimatedText(
                                        text,
                                        textStyle: Styles.extraExtraLargeText(
                                          textColor: KnownColors.white,
                                        ),
                                      ),
                                    )
                                    .toList(),
                                pause: 1.5.seconds,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Let\'s Connect 🤝🏻',
                    style: Styles.regularText(),
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
                          onTap: () => Utils.safelyLaunchUrl(link.url, context),
                          child: Icon(
                            link.icon,
                            size: Sizes.iconXL,
                            color: colors.textColor.withValues(alpha: 0.8),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _GIFImage extends StatelessWidget {
  const _GIFImage(this.height, this.width);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: 500.milliseconds,
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: ThemeRepository.instance.state,
        builder: (_, themeMode, __) {
          return themeMode.isDarkMode
              ? Image.asset(
                  key: const ValueKey<String>('night'),
                  ImageAssets.darkGIFImage,
                  fit: BoxFit.fill,
                  height: height,
                  width: width,
                )
              : Image.asset(
                  key: const ValueKey<String>('day'),
                  ImageAssets.lightGIFImage,
                  fit: BoxFit.fill,
                  height: height,
                  width: width,
                );
        },
      ),
    );
  }
}
