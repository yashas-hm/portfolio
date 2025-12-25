import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/model/chat_model.dart';
import 'package:portfolio/widgets/chat_bubble.dart';
import 'package:resize/resize.dart';

Widget typerWidget({
  required List<String> textList,
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
  Duration pauseDuration = const Duration(milliseconds: 1500),
}) {
  final textWidgets = <TypewriterAnimatedText>[];
  for (var text in textList) {
    textWidgets.add(
      TypewriterAnimatedText(
        text,
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
  return AnimatedTextKit(
    pause: pauseDuration,
    animatedTexts: textWidgets,
    repeatForever: true,
    displayFullTextOnTap: false,
  );
}

OutlineInputBorder outlineBorder(BuildContext context) => OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.tertiary,
        width: 1.sp,
      ),
      borderRadius: BorderRadius.circular(13.sp),
    );
