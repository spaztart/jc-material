import 'package:flutter/material.dart';

// McListing Icon
class McListingIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McListingIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McListingIconPainter(color: iconColor),
    );
  }
}

class _McListingIconPainter extends CustomPainter {
  final Color color;

  _McListingIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round;

    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    // Rounded rectangle
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(3 * scaleX, 3 * scaleY, 18 * scaleX, 18 * scaleY),
      Radius.circular(4 * scaleX),
    );
    canvas.drawRRect(rect, strokePaint);

    // Lines
    final path1 = Path();
    path1.moveTo(12 * scaleX, 9 * scaleY);
    path1.lineTo(18 * scaleX, 9 * scaleY);
    canvas.drawPath(path1, strokePaint);

    final path2 = Path();
    path2.moveTo(12 * scaleX, 15 * scaleY);
    path2.lineTo(18 * scaleX, 15 * scaleY);
    canvas.drawPath(path2, strokePaint);

    // Circles
    canvas.drawCircle(Offset(8 * scaleX, 9 * scaleY), 1 * scaleX, strokePaint);
    canvas.drawCircle(Offset(8 * scaleX, 15 * scaleY), 1 * scaleX, strokePaint);
  }

  @override
  bool shouldRepaint(_McListingIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
