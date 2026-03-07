import 'package:flutter/material.dart';

// McExternalLink Icon
class McExternalLinkIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McExternalLinkIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McExternalLinkIconPainter(color: iconColor),
    );
  }
}

class _McExternalLinkIconPainter extends CustomPainter {
  final Color color;

  _McExternalLinkIconPainter({required this.color});

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

    // Box
    final path1 = Path();
    path1.moveTo(8 * scaleX, 5 * scaleY);
    path1.lineTo(7 * scaleX, 5 * scaleY);
    path1.cubicTo(
      5.89543 * scaleX,
      5 * scaleY,
      5 * scaleX,
      5.89543 * scaleY,
      5 * scaleX,
      7 * scaleY,
    );
    path1.lineTo(5 * scaleX, 17 * scaleY);
    path1.cubicTo(
      5 * scaleX,
      18.1046 * scaleY,
      5.89543 * scaleX,
      19 * scaleY,
      7 * scaleX,
      19 * scaleY,
    );
    path1.lineTo(17 * scaleX, 19 * scaleY);
    path1.cubicTo(
      18.1046 * scaleX,
      19 * scaleY,
      19 * scaleX,
      18.1046 * scaleY,
      19 * scaleX,
      17 * scaleY,
    );
    path1.lineTo(19 * scaleX, 16 * scaleY);
    canvas.drawPath(path1, paint);

    // Arrow line
    final path2 = Path();
    path2.moveTo(20 * scaleX, 4 * scaleY);
    path2.lineTo(13 * scaleX, 11 * scaleY);
    canvas.drawPath(path2, paint);

    // Arrow shape
    final path3 = Path();
    path3.moveTo(14 * scaleX, 4 * scaleY);
    path3.lineTo(19.75 * scaleX, 4 * scaleY);
    path3.cubicTo(
      19.8881 * scaleX,
      4 * scaleY,
      20 * scaleX,
      4.11193 * scaleY,
      20 * scaleX,
      4.25 * scaleY,
    );
    path3.lineTo(20 * scaleX, 10 * scaleY);
    canvas.drawPath(path3, paint);
  }

  @override
  bool shouldRepaint(_McExternalLinkIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
