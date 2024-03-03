import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowMouse extends StatefulWidget {
  const FollowMouse({super.key});

  @override
  State<FollowMouse> createState() => _FollowMouseState();
}

class _FollowMouseState extends State<FollowMouse> {
  RxDouble x = 0.0.obs;
  RxDouble y = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return MouseRegion(
      opaque: false,
      onHover: (event) {
        x.value = event.position.dx;
        y.value = event.position.dy;
      },
      child: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: Stack(
          children: [
            Obx(
              () => AnimatedPositioned(
                duration: 100.milliseconds,
                top: y.value - (screenSize.width / 4),
                left: x.value - (screenSize.width / 4),
                child: Container(
                  height: screenSize.width / 2,
                  width: screenSize.width / 2,
                  clipBehavior: Clip.none,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(radius: 0.5, colors: [
                      const Color(0xFF00BBFF).withOpacity(0.25),
                      Colors.transparent
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
