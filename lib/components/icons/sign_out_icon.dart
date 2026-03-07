import 'package:flutter/material.dart';

// McSignOut Icon
class McSignOutIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McSignOutIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McSignOutIconPainter(color: iconColor),
    );
  }
}

class _McSignOutIconPainter extends CustomPainter {
  final Color color;

  _McSignOutIconPainter({required this.color});

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

    // Door frame
    final path1 = Path();
    path1.moveTo(13 * scaleX, 3 * scaleY);
    path1.lineTo(5 * scaleX, 3 * scaleY);
    path1.cubicTo(
      3.89543 * scaleX,
      3 * scaleY,
      3 * scaleX,
      3.89543 * scaleY,
      3 * scaleX,
      5 * scaleY,
    );
    path1.lineTo(3 * scaleX, 19 * scaleY);
    path1.cubicTo(
      3 * scaleX,
      20.1046 * scaleY,
      3.89543 * scaleX,
      21 * scaleY,
      5 * scaleX,
      21 * scaleY,
    );
    path1.lineTo(13 * scaleX, 21 * scaleY);
    canvas.drawPath(path1, strokePaint);

    // Arrow and line
    final path2 = Path();
    path2.moveTo(20 * scaleX, 12 * scaleY);
    path2.lineTo(9 * scaleX, 12 * scaleY);
    canvas.drawPath(path2, strokePaint);

    // Arrow head
    final arrowPath = Path();
    arrowPath.moveTo(16.41 * scaleX, 16 * scaleY);
    arrowPath.lineTo(20.41 * scaleX, 12 * scaleY);
    arrowPath.lineTo(16.41 * scaleX, 8 * scaleY);
    canvas.drawPath(arrowPath, strokePaint);
  }

  @override
  bool shouldRepaint(_McSignOutIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
