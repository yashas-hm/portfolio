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
    return Image.network(
      imageUrl,
      height: height,
      width: width,
      color: Colors.transparent,
      fit: BoxFit.fill,
      errorBuilder: (ctx, _, __) => Image.asset(
        AppConstants.defaultImage,
        height: height,
        width: width,
        fit: BoxFit.fill,
      ),
    );
  }
}
