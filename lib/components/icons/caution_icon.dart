import 'package:flutter/material.dart';

// McCaution Icon
class McCautionIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McCautionIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McCautionIconPainter(color: iconColor),
    );
  }
}

class _McCautionIconPainter extends CustomPainter {
  final Color color;

  _McCautionIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0;

    final fillPaint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    // Circle
    canvas.drawCircle(
      Offset(12 * scaleX, 12 * scaleY),
      10 * scaleX,
      strokePaint,
    );

    // Exclamation dot
    canvas.drawCircle(Offset(12 * scaleX, 16 * scaleY), 1 * scaleX, fillPaint);

    // Exclamation line
    final rect = Rect.fromLTWH(11 * scaleX, 7 * scaleY, 2 * scaleX, 6 * scaleY);
    canvas.drawRect(rect, fillPaint);
  }

  @override
  bool shouldRepaint(_McCautionIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
