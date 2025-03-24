import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/providers/ui_provider.dart';

class FollowMouse extends ConsumerWidget {
  const FollowMouse({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double x = ref.watch(xProvider);
    double y = ref.watch(yProvider);

    return MouseRegion(
      opaque: false,
      onHover: (event) {
        ref.read(xProvider.notifier).state = event.position.dx;
        ref.read(yProvider.notifier).state = event.position.dy;
      },
      child: SizedBox(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: 100.milliseconds,
              top: y - (context.width / 4),
              left: x - (context.width / 4),
              child: Container(
                height: context.width / 2,
                width: context.width / 2,
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    radius: 0.5,
                    colors: [
                      Theme.of(context).primaryColor.withValues(alpha:0.30),
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
