import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/constants/app_constants.dart';

class DayNightSwitch extends StatefulWidget {
  const DayNightSwitch({
    super.key,
    this.initiallyDark = false,
    this.duration = const Duration(milliseconds: 600),
    this.size = 30,
    required this.onChange,
  });

  final double size;

  final bool initiallyDark;

  final Duration duration;

  final Function(bool) onChange;

  @override
  State createState() => _DayNightSwitchState();
}

class _DayNightSwitchState extends State<DayNightSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnim;
  late double height;
  late double width;

  bool dark = true;

  @override
  void initState() {
    dark = widget.initiallyDark;

    height = widget.size;
    width = widget.size * (7/3);

    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    slideAnim = Tween<Offset>(
      begin: const Offset(1.46, 0),
      end: const Offset(-.16, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.elasticOut,
        reverseCurve: Curves.elasticIn,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => setState(() {
          if (animationController.value == animationController.upperBound) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
          dark = !dark;
          widget.onChange(dark);
        }),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height / 2),
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              AnimatedSwitcher(
                duration: widget.duration,
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                child: dark
                    ? SvgPicture.asset(
                  key: const ValueKey<String>('night'),
                  night,
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                )
                    : SvgPicture.asset(
                  key: const ValueKey<String>('day'),
                  day,
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SlideTransition(
                  position: slideAnim,
                  child: Container(
                    alignment: Alignment.center,
                    height: height,
                    width: height,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: AnimatedSwitcher(
                      duration: widget.duration,
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeOut,
                      child: dark
                          ? SvgPicture.asset(
                        key: const ValueKey<String>('night'),
                        moon,
                        height: height,
                        width: height,
                        fit: BoxFit.fill,
                      )
                          : SvgPicture.asset(
                        key: const ValueKey<String>('day'),
                        sun,
                        height: height,
                        width: height,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height / 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: height / 5,
                      spreadRadius: height / 10,
                      inset: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}