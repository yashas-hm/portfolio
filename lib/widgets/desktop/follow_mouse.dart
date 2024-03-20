import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/utilities/extensions.dart';

final StateProvider<double> xProvider = StateProvider((ref) => 0.0);
final StateProvider<double> yProvider = StateProvider((ref) => 0.0);

class FollowMouse extends ConsumerStatefulWidget {
  const FollowMouse({super.key});

  @override
  ConsumerState<FollowMouse> createState() => _FollowMouseState();
}

class _FollowMouseState extends ConsumerState<FollowMouse> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double x = ref.watch(xProvider);
    double y = ref.watch(yProvider);

    return MouseRegion(
      opaque: false,
      onHover: (event) {
        ref.read(xProvider.notifier).state = event.position.dx;
        ref.read(yProvider.notifier).state = event.position.dy;
      },
      child: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: 100.milliseconds,
              top: y - (screenSize.width / 4),
              left: x - (screenSize.width / 4),
              child: Container(
                height: screenSize.width / 2,
                width: screenSize.width / 2,
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    radius: 0.5,
                    colors: [
                      const Color(0xFF00BBFF).withOpacity(0.25),
                      Colors.transparent
                    ],
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
