import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/utilities/extensions.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.text,
    required this.textStyle,
    this.colors = const [
      KnownColors.blue700,
      KnownColors.blue300,
      KnownColors.blue700,
    ],
    this.textAlign = TextAlign.start,
  });

  final String text;
  final TextStyle textStyle;
  final List<Color> colors;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    final spans = _parseText(context);
    return RichText(
      textAlign: textAlign,
      text: TextSpan(children: spans),
    );
  }

  List<InlineSpan> _parseText(BuildContext context) {
    final spans = <InlineSpan>[];
    final regex = RegExp(r'\*(.+?)\*');
    var lastEnd = 0;

    for (final match in regex.allMatches(text)) {
      // Add normal text before the match
      if (match.start > lastEnd) {
        spans.add(TextSpan(
          text: text.substring(lastEnd, match.start),
          style: textStyle.copyWith(
            color: textStyle.color ?? context.colors.textColor,
          ),
        ));
      }

      // Add gradient text
      spans.add(WidgetSpan(
        alignment: PlaceholderAlignment.baseline,
        baseline: TextBaseline.alphabetic,
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: colors,
          ).createShader(bounds),
          blendMode: BlendMode.srcIn,
          child: Text(
            match.group(1)!,
            style: textStyle.copyWith(color: KnownColors.white),
          ),
        ),
      ));

      lastEnd = match.end;
    }

    // Add remaining text after last match
    if (lastEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastEnd),
        style: textStyle.copyWith(
          color: textStyle.color ?? context.colors.textColor,
        ),
      ));
    }

    return spans;
  }
}
