import 'package:flutter/material.dart';

// McChevronDown Icon
class McChevronDownIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McChevronDownIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McChevronDownIconPainter(color: iconColor),
    );
  }
}

class _McChevronDownIconPainter extends CustomPainter {
  final Color color;

  _McChevronDownIconPainter({required this.color});

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
    path.moveTo(4.5 * scaleX, 7.99999 * scaleY);
    path.lineTo(11.2929 * scaleX, 14.7929 * scaleY);
    path.cubicTo(
      11.6834 * scaleX,
      15.1834 * scaleY,
      12.3166 * scaleX,
      15.1834 * scaleY,
      12.7071 * scaleX,
      14.7929 * scaleY,
    );
    path.lineTo(19.5 * scaleX, 7.99999 * scaleY);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_McChevronDownIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
