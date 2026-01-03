part of '../about_component.dart';

class DisplayImage extends StatelessWidget {
  const DisplayImage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final isMobileView = context.isMobile || context.height < context.width;
    final maxScreenSide = max<double>(context.height, context.width);
    final initialSize = (maxScreenSide * (isMobileView ? 0.3 : 0.4));
    final size = min<double>(350.0, initialSize);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ValueListenableBuilder(
          valueListenable: ThemeRepository.instance.state,
          builder: (_, state, __) => SvgPicture.asset(
            ImageAssets.displayImagePop,
            fit: BoxFit.fill,
            height: size,
            width: size,
            colorFilter: ColorFilter.mode(
              colors.textColor.withValues(
                alpha: state.isDarkMode ? 1 : 0.3,
              ),
              BlendMode.srcIn,
            ),
          ),
        ),
        SvgPicture.asset(
          ImageAssets.displayImageAnnotation,
          fit: BoxFit.fill,
          height: size,
          width: size,
          colorFilter: ColorFilter.mode(
            colors.textColor,
            BlendMode.srcIn,
          ),
        ),
        Image.asset(
          ImageAssets.displayImage,
          fit: BoxFit.fill,
          height: size,
          width: size,
        ),
      ],
    );
  }
}
