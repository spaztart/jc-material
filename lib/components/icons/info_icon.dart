import 'package:flutter/material.dart';

// McInfo Icon
class McInfoIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McInfoIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McInfoIconPainter(color: iconColor),
    );
  }
}

class _McInfoIconPainter extends CustomPainter {
  final Color color;

  _McInfoIconPainter({required this.color});

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

    // Vertical line (i stem)
    final rect = Rect.fromLTWH(
      11 * scaleX,
      11 * scaleY,
      2 * scaleX,
      6 * scaleY,
    );
    canvas.drawRect(rect, fillPaint);

    // Dot (i dot)
    canvas.drawCircle(Offset(12 * scaleX, 8 * scaleY), 1 * scaleX, fillPaint);
  }

  @override
  bool shouldRepaint(_McInfoIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
