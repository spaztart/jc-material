import 'package:flutter/material.dart';

// McListMode Icon
class McListModeIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McListModeIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McListModeIconPainter(color: iconColor),
    );
  }
}

class _McListModeIconPainter extends CustomPainter {
  final Color color;

  _McListModeIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    final strokePaint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0
          ..strokeCap = StrokeCap.square;

    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    // Dots
    canvas.drawCircle(Offset(6 * scaleX, 18 * scaleY), 1.5 * scaleX, fillPaint);
    canvas.drawCircle(Offset(6 * scaleX, 12 * scaleY), 1.5 * scaleX, fillPaint);
    canvas.drawCircle(Offset(6 * scaleX, 6 * scaleY), 1.5 * scaleX, fillPaint);

    // Lines
    final path1 = Path();
    path1.moveTo(12 * scaleX, 18 * scaleY);
    path1.lineTo(18 * scaleX, 18 * scaleY);
    canvas.drawPath(path1, strokePaint);

    final path2 = Path();
    path2.moveTo(12 * scaleX, 12 * scaleY);
    path2.lineTo(18 * scaleX, 12 * scaleY);
    canvas.drawPath(path2, strokePaint);

    final path3 = Path();
    path3.moveTo(12 * scaleX, 6 * scaleY);
    path3.lineTo(18 * scaleX, 6 * scaleY);
    canvas.drawPath(path3, strokePaint);
  }

  @override
  bool shouldRepaint(_McListModeIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
