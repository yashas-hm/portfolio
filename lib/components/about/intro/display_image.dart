part of '../about_component.dart';

class DisplayImage extends StatelessWidget {
  const DisplayImage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SizedBox(
      height: context.height * (context.isMobile ? 0.3 : 0.4),
      width: context.height * (context.isMobile ? 0.3 : 0.4),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ValueListenableBuilder(
            valueListenable: ThemeRepository.instance.state,
            builder: (_, state, __) => SvgPicture.asset(
              ImageAssets.displayImagePop,
              fit: BoxFit.fill,
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
            colorFilter: ColorFilter.mode(
              colors.textColor,
              BlendMode.srcIn,
            ),
          ),
          Image.asset(
            ImageAssets.displayImage,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
