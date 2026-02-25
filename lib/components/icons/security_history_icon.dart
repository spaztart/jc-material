import 'package:flutter/material.dart';

// McSecurityHistory Icon
class McSecurityHistoryIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McSecurityHistoryIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McSecurityHistoryIconPainter(color: iconColor),
    );
  }
}

class _McSecurityHistoryIconPainter extends CustomPainter {
  final Color color;

  _McSecurityHistoryIconPainter({required this.color});

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
    // Shield outline
    path.moveTo(3.5 * scaleX, 5.64022 * scaleY);
    path.lineTo(12 * scaleX, 3 * scaleY);
    path.lineTo(20.5 * scaleX, 5.64022 * scaleY);
    path.lineTo(20.5 * scaleX, 15.4204 * scaleY);
    path.cubicTo(
      20.5 * scaleX,
      16.8506 * scaleY,
      19.7364 * scaleX,
      18.172 * scaleY,
      18.4972 * scaleX,
      18.8861 * scaleY,
    );
    path.lineTo(13.9972 * scaleX, 21.4793 * scaleY);
    path.cubicTo(
      12.761 * scaleX,
      22.1917 * scaleY,
      11.239 * scaleX,
      22.1917 * scaleY,
      10.0028 * scaleX,
      21.4793 * scaleY,
    );
    path.lineTo(5.5028 * scaleX, 18.8861 * scaleY);
    path.cubicTo(
      4.26362 * scaleX,
      18.172 * scaleY,
      3.5 * scaleX,
      16.8506 * scaleY,
      3.5 * scaleX,
      15.4204 * scaleY,
    );
    path.close();

    canvas.drawPath(path, paint);

    // Bar chart lines
    final barPath1 = Path();
    barPath1.moveTo(8 * scaleX, 16 * scaleY);
    barPath1.lineTo(8 * scaleX, 12 * scaleY);
    canvas.drawPath(barPath1, paint);

    final barPath2 = Path();
    barPath2.moveTo(12 * scaleX, 16 * scaleY);
    barPath2.lineTo(12 * scaleX, 10 * scaleY);
    canvas.drawPath(barPath2, paint);

    final barPath3 = Path();
    barPath3.moveTo(16 * scaleX, 16 * scaleY);
    barPath3.lineTo(16 * scaleX, 14 * scaleY);
    canvas.drawPath(barPath3, paint);
  }

  @override
  bool shouldRepaint(_McSecurityHistoryIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
