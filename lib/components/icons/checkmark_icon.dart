import 'package:flutter/material.dart';

// McCheckmark Icon
class McCheckmarkIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McCheckmarkIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McCheckmarkIconPainter(color: iconColor),
    );
  }
}

class _McCheckmarkIconPainter extends CustomPainter {
  final Color color;

  _McCheckmarkIconPainter({required this.color});

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

    final path = Path();
    path.moveTo(20.324 * scaleX, 7.71745 * scaleY);
    path.lineTo(11.1316 * scaleX, 16.9098 * scaleY);
    path.cubicTo(
      10.3505 * scaleX,
      17.6909 * scaleY,
      9.0842 * scaleX,
      17.6909 * scaleY,
      8.30315 * scaleX,
      16.9098 * scaleY,
    );
    path.lineTo(5 * scaleX, 13.6067 * scaleY);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_McCheckmarkIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
