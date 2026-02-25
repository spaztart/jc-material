import 'package:flutter/material.dart';

// McRunAScan Icon
class McRunAScanIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McRunAScanIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McRunAScanIconPainter(color: iconColor),
    );
  }
}

class _McRunAScanIconPainter extends CustomPainter {
  final Color color;

  _McRunAScanIconPainter({required this.color});

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

    // Shield
    final path = Path();
    path.moveTo(3.5 * scaleX, 5.64022 * scaleY);
    path.lineTo(12 * scaleX, 3 * scaleY);
    path.lineTo(20.5 * scaleX, 5.64022 * scaleY);
    path.lineTo(20.5 * scaleX, 14.8425 * scaleY);
    path.cubicTo(
      20.5 * scaleX,
      16.6303 * scaleY,
      19.5455 * scaleX,
      18.282 * scaleY,
      17.9965 * scaleX,
      19.1746 * scaleY,
    );
    path.lineTo(14.4965 * scaleX, 21.1916 * scaleY);
    path.cubicTo(
      12.9513 * scaleX,
      22.0821 * scaleY,
      11.0487 * scaleX,
      22.0821 * scaleY,
      9.5035 * scaleX,
      21.1916 * scaleY,
    );
    path.lineTo(6.00349 * scaleX, 19.1746 * scaleY);
    path.cubicTo(
      4.45452 * scaleX,
      18.282 * scaleY,
      3.5 * scaleX,
      16.6303 * scaleY,
      3.5 * scaleX,
      14.8425 * scaleY,
    );
    path.close();
    canvas.drawPath(path, paint);

    // Magnifying glass line
    final path2 = Path();
    path2.moveTo(14.9004 * scaleX, 14.8198 * scaleY);
    path2.lineTo(17.1504 * scaleX, 17.0698 * scaleY);
    canvas.drawPath(path2, paint);

    // Magnifying glass circle
    canvas.drawCircle(Offset(12 * scaleX, 11.9199 * scaleY), 4 * scaleX, paint);
  }

  @override
  bool shouldRepaint(_McRunAScanIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
