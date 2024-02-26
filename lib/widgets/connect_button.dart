import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resize/resize.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.icon,
    required this.link,
    this.size,
    this.color,
  }) : super(key: key);

  final String icon;

  final String link;

  final Size? size;

  final ColorFilter? color;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async => await launchUrlString(link),
        child: SvgPicture.asset(
          icon,
          fit: BoxFit.fill,
          colorFilter: color,
          height: size?.height ?? 60.sp,
          width: size?.width ?? 60.sp,
        ),
      ),
    );
  }
}
