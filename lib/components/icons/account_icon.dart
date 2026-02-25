import 'package:flutter/material.dart';

// McAccount Icon
class McAccountIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McAccountIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McAccountIconPainter(color: iconColor),
    );
  }
}

class _McAccountIconPainter extends CustomPainter {
  final Color color;

  _McAccountIconPainter({required this.color});

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

    // Outer circle
    canvas.drawCircle(
      Offset(12 * scaleX, 12 * scaleY),
      10 * scaleX,
      strokePaint,
    );

    // Inner person shape (filled)
    final path = Path();
    // Lower body/clothing
    path.moveTo(14.6667 * scaleX, 17 * scaleY);
    path.cubicTo(
      16.4497 * scaleX,
      17.0001 * scaleY,
      18.0598 * scaleX,
      17.738 * scaleY,
      19.2107 * scaleX,
      18.9238 * scaleY,
    );
    path.cubicTo(
      18.7468 * scaleX,
      19.4068 * scaleY,
      18.2356 * scaleX,
      19.8433 * scaleY,
      17.6833 * scaleX,
      20.2256 * scaleY,
    );
    path.cubicTo(
      16.9036 * scaleX,
      19.4678 * scaleY,
      15.8403 * scaleX,
      19.0001 * scaleY,
      14.6667 * scaleX,
      19 * scaleY,
    );
    path.lineTo(9.33276 * scaleX, 19 * scaleY);
    path.cubicTo(
      8.15891 * scaleX,
      19.0001 * scaleY,
      7.09495 * scaleX,
      19.4674 * scaleY,
      6.31519 * scaleX,
      20.2256 * scaleY,
    );
    path.cubicTo(
      5.76317 * scaleX,
      19.8434 * scaleY,
      5.2525 * scaleX,
      19.4066 * scaleY,
      4.78882 * scaleX,
      18.9238 * scaleY,
    );
    path.cubicTo(
      5.9397 * scaleX,
      17.7379 * scaleY,
      7.54974 * scaleX,
      17.0001 * scaleY,
      9.33276 * scaleX,
      17 * scaleY,
    );
    path.close();

    // Head circle
    path.moveTo(12.167 * scaleX, 4.5 * scaleY);
    path.cubicTo(
      15.4805 * scaleX,
      4.5002 * scaleY,
      18.167 * scaleX,
      7.1864 * scaleY,
      18.167 * scaleX,
      10.5 * scaleY,
    );
    path.cubicTo(
      18.167 * scaleX,
      13.8136 * scaleY,
      15.4805 * scaleX,
      16.4998 * scaleY,
      12.167 * scaleX,
      16.5 * scaleY,
    );
    path.cubicTo(
      8.85328 * scaleX,
      16.4999 * scaleY,
      6.16699 * scaleX,
      13.8136 * scaleY,
      6.16699 * scaleX,
      10.5 * scaleY,
    );
    path.cubicTo(
      6.16699 * scaleX,
      7.18636 * scaleY,
      8.85314 * scaleX,
      4.50012 * scaleY,
      12.167 * scaleX,
      4.5 * scaleY,
    );
    path.close();

    path.moveTo(12.167 * scaleX, 6.5 * scaleY);
    path.cubicTo(
      9.95785 * scaleX,
      6.50012 * scaleY,
      8.16699 * scaleX,
      8.29093 * scaleY,
      8.16699 * scaleX,
      10.5 * scaleY,
    );
    path.cubicTo(
      8.16699 * scaleX,
      12.7091 * scaleY,
      9.95785 * scaleX,
      14.4999 * scaleY,
      12.167 * scaleX,
      14.5 * scaleY,
    );
    path.cubicTo(
      14.3757 * scaleX,
      14.4998 * scaleY,
      16.1667 * scaleX,
      12.709 * scaleY,
      16.1667 * scaleX,
      10.5 * scaleY,
    );
    path.cubicTo(
      16.1667 * scaleX,
      8.29097 * scaleY,
      14.3757 * scaleX,
      6.50018 * scaleY,
      12.167 * scaleX,
      6.5 * scaleY,
    );
    path.close();

    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(_McAccountIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
