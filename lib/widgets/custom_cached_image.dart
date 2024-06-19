import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_constants.dart';

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
      errorWidget: (ctx, _, __) => Image.asset(
        defaultImage,
        height: height,
        width: width,
        fit: BoxFit.fill,
      ),
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
