import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SequentialAnimator extends StatefulWidget {
  const SequentialAnimator({
    super.key,
    required this.children,
    this.builder,
    this.animationBuilder,
    this.itemDuration,
    this.totalDuration,
    this.overlap = 0.3,
    this.curve = Curves.easeInOut,
    this.delay = const Duration(milliseconds: 0),
  })  : assert(
          overlap >= 0 && overlap <= 1,
          'overlap must be in range [0.0, 1.0]',
        ),
        assert(
          (totalDuration == null) != (itemDuration == null),
          'Provide exactly one: totalDuration or itemDuration',
        );

  final Duration? totalDuration;
  final Duration? itemDuration;
  final Duration delay;
  final Curve curve;
  final double overlap;
  final List<Widget> children;
  final Widget Function(List<Widget> children)? builder;
  final Widget Function(Widget child, Animation<double> animation)?
      animationBuilder;

  bool needsUpdate(SequentialAnimator oldWidget) =>
      totalDuration != oldWidget.totalDuration ||
      itemDuration != oldWidget.itemDuration ||
      curve != oldWidget.curve ||
      overlap != oldWidget.overlap ||
      children.length != oldWidget.children.length;

  @override
  State<SequentialAnimator> createState() => _SequentialAnimatorState();
}

class _SequentialAnimatorState extends State<SequentialAnimator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: duration);

    SchedulerBinding.instance.addPostFrameCallback((_) =>
        Future.delayed(widget.delay, () {
          if (mounted) _animationController.forward();
        }));

    super.initState();
  }

  Duration get duration {
    Duration duration;

    if (widget.totalDuration != null) {
      duration = widget.totalDuration!;
    } else if (widget.itemDuration != null) {
      duration = Duration(
          milliseconds:
              widget.itemDuration!.inMilliseconds * widget.children.length);
    } else {
      duration = Duration(milliseconds: 800);
    }

    return duration;
  }

  @override
  void didUpdateWidget(covariant SequentialAnimator oldWidget) {
    if (widget.needsUpdate(oldWidget)) {
      _animationController
        ..stop()
        ..duration = duration
        ..reset()
        ..forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Animation<double> getAnimation(int index) {
    final segmentSize = 1 / widget.children.length;
    final step = segmentSize * (1 - widget.overlap);
    final start = index * step;
    final end = (start + segmentSize).clamp(0.0, 1.0);
    return CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        start,
        end,
        curve: widget.curve,
      ),
    );
  }

  List<Widget> get animatorWrappedChildren {
    final children = <Widget>[];

    for (int index = 0; index < widget.children.length; index++) {
      final animation = getAnimation(index);

      if (widget.animationBuilder != null) {
        children.add(widget.animationBuilder!(
          widget.children[index],
          animation,
        ));
      } else {
        children.add(ScaleTransition(
          scale: Tween<double>(begin: 0, end: 1).animate(animation),
          child: widget.children[index],
        ));
      }
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder != null
        ? widget.builder!(animatorWrappedChildren)
        : Wrap(children: animatorWrappedChildren);
  }
}
