import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// A simple auto-scrolling widget that scrolls content continuously.
/// Content is duplicated for seamless looping.
class AutoScroll extends StatefulWidget {
  const AutoScroll({
    super.key,
    required this.child,
    this.speed = 30.0,
    this.scrollDirection = Axis.horizontal,
  });

  /// The content to scroll
  final Widget child;

  /// Scroll speed in pixels per second
  final double speed;

  /// Direction of scroll
  final Axis scrollDirection;

  @override
  State<AutoScroll> createState() => _AutoScrollState();
}

class _AutoScrollState extends State<AutoScroll>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  final _scrollController = ScrollController();
  final _contentKey = GlobalKey();
  double _contentSize = 0;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick)..start();
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureContent());
  }

  void _measureContent() {
    final box = _contentKey.currentContext?.findRenderObject() as RenderBox?;
    if (box != null) {
      _contentSize = widget.scrollDirection == Axis.horizontal
          ? box.size.width / 2
          : box.size.height / 2;
    }
  }

  void _onTick(Duration elapsed) {
    if (!_scrollController.hasClients || _contentSize <= 0) {
      _measureContent();
      return;
    }

    final totalSeconds = elapsed.inMicroseconds / 1000000.0;
    final position = (widget.speed * totalSeconds) % _contentSize;
    _scrollController.jumpTo(position);
  }

  @override
  void dispose() {
    _ticker.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: widget.scrollDirection,
      controller: _scrollController,
      physics: const NeverScrollableScrollPhysics(),
      child: widget.scrollDirection == Axis.horizontal
          ? Row(
              key: _contentKey,
              mainAxisSize: MainAxisSize.min,
              children: [widget.child, widget.child],
            )
          : Column(
              key: _contentKey,
              mainAxisSize: MainAxisSize.min,
              children: [widget.child, widget.child],
            ),
    );
  }
}
