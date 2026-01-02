import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/utilities/extensions.dart';

class Subtext extends StatelessWidget {
  const Subtext(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * (context.isMobile ? 0.9 : 0.6),
      constraints: BoxConstraints(
        minWidth: 400,
      ),
      child: Text(
        text,
        style: Styles.subText(
          isMobile: context.isMobile,
          textColor: context.colors.textSecondary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
