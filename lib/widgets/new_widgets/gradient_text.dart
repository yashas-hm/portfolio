import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.text,
    required this.textStyle,
    this.colors = const [
      KnownColors.blue700,
      KnownColors.blue300,
      KnownColors.blue700
    ],
    this.textAlign = TextAlign.start,
  });

  final String text;
  final TextStyle textStyle;
  final List<Color> colors;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: LinearGradient(
        colors: colors,
      ).createShader,
      blendMode: BlendMode.srcIn,
      child: Text(
        text,
        style: textStyle.copyWith(color: KnownColors.white),
      ),
    );
  }
}
