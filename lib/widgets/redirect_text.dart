import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/color_constants.dart';
class RedirectText extends StatefulWidget {
  const RedirectText({
    super.key,
    required this.text,
    required this.function,
    this.fontSize = 20,
  });

  final double fontSize;
  final String text;
  final Function() function;

  @override
  State<RedirectText> createState() => _RedirectTextState();
}

class _RedirectTextState extends State<RedirectText> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        hover = true;
      }),
      onExit: (_) => setState(() {
        hover = false;
      }),
      child: GestureDetector(
        onTap: widget.function,
        child: Text(
          widget.text,
          style: TextStyle(
            color: hover ? AppColor.primaryLight : AppColor.bgLight,
            fontSize: widget.fontSize,
          ),
        ),
      ),
    );
  }
}
