import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/portfolio_constants.dart';

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
      fit: BoxFit.fill,
      imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
      errorWidget: (ctx, _, __) => Image.asset(
        defaultImage,
        height: height,
        width: width,
        fit: BoxFit.fill,
      ),
      imageBuilder: (_, image) {
        return Image(
          image: image,
          height: height,
          width: height,
          fit: BoxFit.cover,
        );
      },
      placeholder: (_, __) => Center(
        child: SizedBox(
          height: height / 3,
          width: height / 3,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
              Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ),
      ),
    );
  }
}
