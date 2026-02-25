import 'package:flutter/material.dart';

// McCheckmarkCircle Icon
class McCheckmarkCircleIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McCheckmarkCircleIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McCheckmarkCircleIconPainter(color: iconColor),
    );
  }
}

class _McCheckmarkCircleIconPainter extends CustomPainter {
  final Color color;

  _McCheckmarkCircleIconPainter({required this.color});

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

    // Checkmark
    final path = Path();
    path.moveTo(17.6066 * scaleX, 8.94982 * scaleY);
    path.lineTo(11.9497 * scaleX, 14.6067 * scaleY);
    path.cubicTo(
      11.1687 * scaleX,
      15.3877 * scaleY,
      9.90237 * scaleX,
      15.3877 * scaleY,
      9.12132 * scaleX,
      14.6067 * scaleY,
    );
    path.lineTo(7 * scaleX, 12.4854 * scaleY);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_McCheckmarkCircleIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
