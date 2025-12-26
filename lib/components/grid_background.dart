import 'package:flutter/material.dart';

class GridBackground extends StatelessWidget {
  const GridBackground({
    super.key,
    this.horizontalSpacing = 50,
    this.verticalSpacing = 50,
    this.strokeWidth = 0.5,
    this.color,
  });

  final double horizontalSpacing;
  final double verticalSpacing;
  final double strokeWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GridPainter(
        horizontalSpacing: horizontalSpacing,
        verticalSpacing: verticalSpacing,
        strokeWidth: strokeWidth,
        color: color ?? Theme.of(context).primaryColor.withValues(alpha: 0.2),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  _GridPainter({
    required this.horizontalSpacing,
    required this.verticalSpacing,
    required this.strokeWidth,
    required this.color,
  });

  final double horizontalSpacing;
  final double verticalSpacing;
  final double strokeWidth;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Draw vertical lines
    for (double x = 0; x <= size.width; x += horizontalSpacing) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    // Draw horizontal lines
    for (double y = 0; y <= size.height; y += verticalSpacing) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_GridPainter oldDelegate) {
    return oldDelegate.horizontalSpacing != horizontalSpacing ||
        oldDelegate.verticalSpacing != verticalSpacing ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.color != color;
  }
}
