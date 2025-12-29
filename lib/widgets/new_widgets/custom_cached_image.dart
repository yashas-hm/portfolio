import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utilities/extensions.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    super.key,
    required this.height,
    required this.imageUrl,
    this.width,
  });

  final double height;

  final double? width;

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      color: Colors.transparent,
      imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
      errorWidget: (ctx, _, __) => Container(
        height: height,
        width: width,
        color: context.colors.backgroundColor,
      ),
      imageBuilder: (_, image) {
        return Image(
          image: image,
          height: height,
          width: height,
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
        );
      },
      placeholder: (_, __) => Center(
        child: SizedBox(
          height: height / 5,
          width: height / 5,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
              context.colors.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
