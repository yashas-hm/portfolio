import 'package:flutter/material.dart';
import 'package:portfolio/utilities/extensions.dart';

class BounceAnimator extends StatefulWidget {
  const BounceAnimator({
    super.key,
    required this.child,
    this.repeatDelay = const Duration(milliseconds: 800),
  });

  final Widget child;
  final Duration repeatDelay;

  @override
  State<BounceAnimator> createState() => _BounceAnimatorState();
}

class _BounceAnimatorState extends State<BounceAnimator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: 400.milliseconds,
    );
    _startBounceLoop();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startBounceLoop() async {
    while (mounted) {
      await _animationController.forward();
      await _animationController.reverse();
      await Future.delayed(widget.repeatDelay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset.zero,
        end: Offset(0, -0.2),
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeIn,
        ),
      ),
      child: widget.child,
    );
  }
}
