import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/constants.dart';

class SlidingCarouselController extends ChangeNotifier {
  int _currentIndex = 0;
  int _itemCount = 0;
  int _visibleCount = 1;
  ScrollController? _scrollController;
  double _itemWidth = 0;
  double _spacing = 0;
  bool _isDisposed = false;

  int get currentIndex => _currentIndex;

  bool get canGoBack => _currentIndex > 0;

  bool get canGoForward => _currentIndex < _itemCount - _visibleCount;

  bool get showArrows => _itemCount > _visibleCount;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  void _attach({
    required ScrollController scrollController,
    required int itemCount,
    required int visibleCount,
    required double itemWidth,
    required double spacing,
  }) {
    final hasChanged = _scrollController != scrollController ||
        _itemCount != itemCount ||
        _visibleCount != visibleCount ||
        _itemWidth != itemWidth ||
        _spacing != spacing;

    _scrollController = scrollController;
    _itemCount = itemCount;
    _visibleCount = visibleCount;
    _itemWidth = itemWidth;
    _spacing = spacing;

    if (hasChanged && !_isDisposed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_isDisposed) {
          notifyListeners();
        }
      });
    }
  }

  void goBack() {
    if (canGoBack) {
      _currentIndex--;
      _scrollToIndex();
      notifyListeners();
    }
  }

  void goForward() {
    if (canGoForward) {
      _currentIndex++;
      _scrollToIndex();
      notifyListeners();
    }
  }

  void _scrollToIndex() {
    if (_scrollController == null || !_scrollController!.hasClients) return;

    _scrollController!.animateTo(
      _currentIndex * (_itemWidth + _spacing),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

class SlidingCarousel extends StatefulWidget {
  const SlidingCarousel({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.controller,
    this.maxVisibleCount = 1,
    this.spacing,
    this.height,
    this.minHeight,
    this.minItemWidth,
    this.physics,
  });

  final int itemCount;

  final Widget Function(BuildContext context, int index) itemBuilder;

  final SlidingCarouselController controller;

  final int maxVisibleCount;

  final double? spacing;

  final double? height;

  final double? minHeight;

  final double? minItemWidth;

  final ScrollPhysics? physics;

  @override
  State<SlidingCarousel> createState() => _SlidingCarouselState();
}

class _SlidingCarouselState extends State<SlidingCarousel> {
  late final ScrollController _scrollController;

  double get _spacing => widget.spacing ?? Sizes.spacingLarge;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final containerWidth = constraints.maxWidth;
        var itemWidth =
            (containerWidth - _spacing * (widget.maxVisibleCount - 1)) /
                widget.maxVisibleCount;

        // Apply minimum item width if specified
        if (widget.minItemWidth != null) {
          itemWidth = math.max(itemWidth, widget.minItemWidth!);
        }

        // Calculate actual visible count based on final item width
        final actualVisibleCount = math
            .max(
              1,
              ((containerWidth + _spacing) / (itemWidth + _spacing)).floor(),
            )
            .clamp(1, widget.maxVisibleCount);

        // Calculate height with minimum
        final height = widget.minHeight != null && widget.height != null
            ? math.max(widget.height!, widget.minHeight!)
            : widget.height ?? widget.minHeight;

        // Attach controller with current layout info
        widget.controller._attach(
          scrollController: _scrollController,
          itemCount: widget.itemCount,
          visibleCount: actualVisibleCount,
          itemWidth: itemWidth,
          spacing: _spacing,
        );

        final enableScrolling = widget.itemCount > actualVisibleCount;

        return SizedBox(
          height: height,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            physics: widget.physics ??
                (enableScrolling
                    ? const ClampingScrollPhysics()
                    : const NeverScrollableScrollPhysics()),
            itemCount: widget.itemCount,
            separatorBuilder: (_, __) => Gap(_spacing),
            itemBuilder: (context, index) {
              return SizedBox(
                width: itemWidth,
                child: widget.itemBuilder(context, index),
              );
            },
          ),
        );
      },
    );
  }
}
