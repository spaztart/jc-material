import 'package:flutter/material.dart';

// McX Icon
class McXIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McXIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McXIconPainter(color: iconColor),
    );
  }
}

class _McXIconPainter extends CustomPainter {
  final Color color;

  _McXIconPainter({required this.color});

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

    // First diagonal line (top-left to bottom-right)
    final path1 = Path();
    path1.moveTo(6 * scaleX, 6 * scaleY);
    path1.lineTo(18 * scaleX, 18 * scaleY);
    canvas.drawPath(path1, paint);

    // Second diagonal line (top-right to bottom-left)
    final path2 = Path();
    path2.moveTo(18 * scaleX, 6 * scaleY);
    path2.lineTo(6 * scaleX, 18 * scaleY);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(_McXIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
