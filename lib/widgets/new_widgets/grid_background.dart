import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:portfolio/utilities/extensions.dart';

class GridBackground extends StatefulWidget {
  const GridBackground({
    super.key,
    this.horizontalSpacing = 50,
    this.verticalSpacing = 50,
    this.strokeWidth = 1,
    this.color,
    this.runnerColor,
    this.enableRunners = true,
  });

  final double horizontalSpacing;
  final double verticalSpacing;
  final double strokeWidth;
  final Color? color;
  final Color? runnerColor;
  final bool enableRunners;

  @override
  State<GridBackground> createState() => _GridBackgroundState();
}

class _GridBackgroundState extends State<GridBackground>
    with TickerProviderStateMixin {
  late AnimationController _horizontalController;
  late AnimationController _verticalController;

  final Random _random = Random();

  int _horizontalLineIndex = 0;
  int _verticalLineIndex = 0;
  bool _horizontalReverse = false;
  bool _verticalReverse = false;

  @override
  void initState() {
    super.initState();

    _horizontalController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..addStatusListener(_onHorizontalStatus);

    _verticalController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    )..addStatusListener(_onVerticalStatus);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (widget.enableRunners) {
        _startHorizontalRunner();
        Future.delayed(
          const Duration(milliseconds: 1500),
          _startVerticalRunner,
        );
      }
    });
  }

  void _onHorizontalStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      Future.delayed(Duration(milliseconds: 500 + _random.nextInt(2000)), () {
        if (mounted) _startHorizontalRunner();
      });
    }
  }

  void _onVerticalStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      Future.delayed(Duration(milliseconds: 500 + _random.nextInt(2000)), () {
        if (mounted) _startVerticalRunner();
      });
    }
  }

  void _startHorizontalRunner() {
    if (!mounted) return;

    final lineCount = (context.height / widget.verticalSpacing).floor();
    setState(() {
      _horizontalLineIndex = _random.nextInt(lineCount.clamp(1, 100));
      _horizontalReverse = _random.nextBool();
    });

    _horizontalController
      ..reset()
      ..forward();
  }

  void _startVerticalRunner() {
    if (!mounted) return;

    final lineCount = (context.width / widget.horizontalSpacing).floor();
    setState(() {
      _verticalLineIndex = _random.nextInt(lineCount.clamp(1, 100));
      _verticalReverse = _random.nextBool();
    });

    _verticalController
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    _horizontalController.dispose();
    _verticalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gridColor =
        widget.color ?? Theme.of(context).primaryColor.withValues(alpha: 0.2);
    final runnerColor = widget.runnerColor ?? Theme.of(context).primaryColor;

    return AnimatedBuilder(
      animation: Listenable.merge([
        _horizontalController,
        _verticalController,
      ]),
      builder: (context, child) {
        return CustomPaint(
          size: context.screenSize,
          painter: _GridPainter(
            horizontalSpacing: widget.horizontalSpacing,
            verticalSpacing: widget.verticalSpacing,
            strokeWidth: widget.strokeWidth,
            color: gridColor,
            runnerColor: runnerColor,
            horizontalProgress: _horizontalController.value,
            verticalProgress: _verticalController.value,
            horizontalLineIndex: _horizontalLineIndex,
            verticalLineIndex: _verticalLineIndex,
            horizontalReverse: _horizontalReverse,
            verticalReverse: _verticalReverse,
            enableRunners: widget.enableRunners,
          ),
        );
      },
    );
  }
}

class _GridPainter extends CustomPainter {
  _GridPainter({
    required this.horizontalSpacing,
    required this.verticalSpacing,
    required this.strokeWidth,
    required this.color,
    required this.runnerColor,
    required this.horizontalProgress,
    required this.verticalProgress,
    required this.horizontalLineIndex,
    required this.verticalLineIndex,
    required this.horizontalReverse,
    required this.verticalReverse,
    required this.enableRunners,
  });

  final double horizontalSpacing;
  final double verticalSpacing;
  final double strokeWidth;
  final Color color;
  final Color runnerColor;
  final double horizontalProgress;
  final double verticalProgress;
  final int horizontalLineIndex;
  final int verticalLineIndex;
  final bool horizontalReverse;
  final bool verticalReverse;
  final bool enableRunners;

  static const double _runnerLength = 100;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final height = size.height;
    final width = size.width;

    for (double x = 0; x <= width; x += horizontalSpacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, height), paint);
    }

    for (double y = 0; y <= height; y += verticalSpacing) {
      canvas.drawLine(Offset(0, y), Offset(width, y), paint);
    }

    if (!enableRunners) return;

    _drawHorizontalRunner(canvas, size);

    _drawVerticalRunner(canvas, size);
  }

  void _drawHorizontalRunner(Canvas canvas, Size size) {
    final y = horizontalLineIndex * verticalSpacing;
    if (y > size.height || y < 0) return;

    final totalDistance = size.width + _runnerLength * 2;

    double headX, tailX;
    if (horizontalReverse) {
      headX =
          (size.width + _runnerLength) - (totalDistance * horizontalProgress);
      tailX = headX + _runnerLength;
    } else {
      headX = -_runnerLength + (totalDistance * horizontalProgress);
      tailX = headX - _runnerLength;
    }

    final leftX = headX < tailX ? headX : tailX;
    final rightX = headX < tailX ? tailX : headX;
    final drawLeft = leftX.clamp(0.0, size.width);
    final drawRight = rightX.clamp(0.0, size.width);

    if (drawRight - drawLeft < 0.5) return;

    final rect = Rect.fromLTRB(leftX, y - 1, rightX, y + 1);
    final gradient = LinearGradient(
      begin: horizontalReverse ? Alignment.centerLeft : Alignment.centerLeft,
      end: horizontalReverse ? Alignment.centerRight : Alignment.centerRight,
      colors: horizontalReverse
          ? [runnerColor, runnerColor.withValues(alpha: 0)]
          : [runnerColor.withValues(alpha: 0), runnerColor],
    );

    final runnerPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(drawLeft, y), Offset(drawRight, y), runnerPaint);
  }

  void _drawVerticalRunner(Canvas canvas, Size size) {
    final x = verticalLineIndex * horizontalSpacing;
    if (x > size.width || x < 0) return;

    final totalDistance = size.height + _runnerLength * 2;

    double headY, tailY;
    if (verticalReverse) {
      headY =
          (size.height + _runnerLength) - (totalDistance * verticalProgress);
      tailY = headY + _runnerLength;
    } else {
      headY = -_runnerLength + (totalDistance * verticalProgress);
      tailY = headY - _runnerLength;
    }

    final topY = headY < tailY ? headY : tailY;
    final bottomY = headY < tailY ? tailY : headY;
    final drawTop = topY.clamp(0.0, size.height);
    final drawBottom = bottomY.clamp(0.0, size.height);

    if (drawBottom - drawTop < 0.5) return;

    final rect = Rect.fromLTRB(x - 1, topY, x + 1, bottomY);
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: verticalReverse
          ? [runnerColor, runnerColor.withValues(alpha: 0)]
          : [runnerColor.withValues(alpha: 0), runnerColor],
    );

    final runnerPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(x, drawTop), Offset(x, drawBottom), runnerPaint);
  }

  @override
  bool shouldRepaint(_GridPainter oldDelegate) {
    return oldDelegate.horizontalSpacing != horizontalSpacing ||
        oldDelegate.verticalSpacing != verticalSpacing ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.color != color ||
        oldDelegate.horizontalProgress != horizontalProgress ||
        oldDelegate.verticalProgress != verticalProgress ||
        oldDelegate.horizontalLineIndex != horizontalLineIndex ||
        oldDelegate.verticalLineIndex != verticalLineIndex;
  }
}
