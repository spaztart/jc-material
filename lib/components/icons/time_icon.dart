import 'package:flutter/material.dart';

// McTime Icon
class McTimeIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McTimeIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McTimeIconPainter(color: iconColor),
    );
  }
}

class _McTimeIconPainter extends CustomPainter {
  final Color color;

  _McTimeIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round;

    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    // Circle
    canvas.drawCircle(Offset(12 * scaleX, 12 * scaleY), 10 * scaleX, paint);

    // Clock hands
    final path = Path();
    path.moveTo(11 * scaleX, 7 * scaleY);
    path.lineTo(11 * scaleX, 11 * scaleY);
    path.cubicTo(
      11 * scaleX,
      12.1046 * scaleY,
      11.8954 * scaleX,
      13 * scaleY,
      13 * scaleX,
      13 * scaleY,
    );
    path.lineTo(17 * scaleX, 13 * scaleY);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_McTimeIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
