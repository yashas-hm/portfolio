import 'package:flutter/material.dart' hide BoxShadow, BoxDecoration;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/constants/app_constants.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({
    super.key,
    this.height = 30,
    this.width = 70,
    this.initiallyDark = false,
    this.duration = const Duration(milliseconds: 600),
    required this.onChange,
  });

  final double height;

  final double width;

  final bool initiallyDark;

  final Duration duration;

  final Function(bool) onChange;

  @override
  State createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnim;
  bool dark = true;

  @override
  void initState() {
    dark = widget.initiallyDark;

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
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.height / 2),
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
                        height: widget.height,
                        width: widget.width,
                        fit: BoxFit.cover,
                      )
                    : SvgPicture.asset(
                        key: const ValueKey<String>('day'),
                        day,
                        height: widget.height,
                        width: widget.width,
                        fit: BoxFit.cover,
                      ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SlideTransition(
                  position: slideAnim,
                  child: Container(
                    alignment: Alignment.center,
                    height: widget.height,
                    width: widget.height,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: AnimatedSwitcher(
                      duration: widget.duration,
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeOut,
                      child: dark
                          ? SvgPicture.asset(
                              key: const ValueKey<String>('night'),
                              moon,
                              height: widget.height,
                              width: widget.height,
                              fit: BoxFit.fill,
                            )
                          : SvgPicture.asset(
                              key: const ValueKey<String>('day'),
                              sun,
                              height: widget.height,
                              width: widget.height,
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                ),
              ),
              Container(
                height: widget.height,
                width: widget.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.height / 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: widget.height / 5,
                      spreadRadius: widget.height / 10,
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
