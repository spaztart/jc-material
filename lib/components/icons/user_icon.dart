import 'package:flutter/material.dart';

// McUser Icon
class McUserIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McUserIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McUserIconPainter(color: iconColor),
    );
  }
}

class _McUserIconPainter extends CustomPainter {
  final Color color;

  _McUserIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final path = Path();
    // Body/clothing area
    path.moveTo(14.667 * scaleX, 14 * scaleY);
    path.cubicTo(
      18.1645 * scaleX,
      14.0002 * scaleY,
      20.9998 * scaleX,
      16.8355 * scaleY,
      21 * scaleX,
      20.333 * scaleY,
    );
    path.lineTo(21 * scaleX, 20.667 * scaleY);
    path.cubicTo(
      20.9998 * scaleX,
      21.4031 * scaleY,
      20.4031 * scaleX,
      21.9998 * scaleY,
      19.667 * scaleX,
      22 * scaleY,
    );
    path.lineTo(4.33301 * scaleX, 22 * scaleY);
    path.cubicTo(
      3.59688 * scaleX,
      21.9998 * scaleY,
      3.00018 * scaleX,
      21.4031 * scaleY,
      3 * scaleX,
      20.667 * scaleY,
    );
    path.lineTo(3 * scaleX, 20.333 * scaleY);
    path.cubicTo(
      3.00018 * scaleX,
      16.8355 * scaleY,
      5.83546 * scaleX,
      14.0002 * scaleY,
      9.33301 * scaleX,
      14 * scaleY,
    );
    path.close();

    path.moveTo(9.33301 * scaleX, 16 * scaleY);
    path.cubicTo(
      7.05213 * scaleX,
      16.0002 * scaleY,
      5.18492 * scaleX,
      17.7627 * scaleY,
      5.01465 * scaleX,
      20 * scaleY,
    );
    path.lineTo(18.9854 * scaleX, 20 * scaleY);
    path.cubicTo(
      18.8151 * scaleX,
      17.7627 * scaleY,
      16.9479 * scaleX,
      16.0002 * scaleY,
      14.667 * scaleX,
      16 * scaleY,
    );
    path.close();

    // Head/face circle
    path.moveTo(12.167 * scaleX, 1.5 * scaleY);
    path.cubicTo(
      15.4805 * scaleX,
      1.5002 * scaleY,
      18.167 * scaleX,
      4.18641 * scaleY,
      18.167 * scaleX,
      7.5 * scaleY,
    );
    path.cubicTo(
      18.167 * scaleX,
      10.8136 * scaleY,
      15.4805 * scaleX,
      13.4998 * scaleY,
      12.167 * scaleX,
      13.5 * scaleY,
    );
    path.cubicTo(
      8.85328 * scaleX,
      13.5 * scaleY,
      6.16699 * scaleX,
      10.8137 * scaleY,
      6.16699 * scaleX,
      7.5 * scaleY,
    );
    path.cubicTo(
      6.16699 * scaleX,
      4.18629 * scaleY,
      8.85328 * scaleX,
      1.5 * scaleY,
      12.167 * scaleX,
      1.5 * scaleY,
    );
    path.close();

    path.moveTo(12.167 * scaleX, 3.5 * scaleY);
    path.cubicTo(
      9.95785 * scaleX,
      3.5 * scaleY,
      8.16699 * scaleX,
      5.29086 * scaleY,
      8.16699 * scaleX,
      7.5 * scaleY,
    );
    path.cubicTo(
      8.16699 * scaleX,
      9.70914 * scaleY,
      9.95785 * scaleX,
      11.5 * scaleY,
      12.167 * scaleX,
      11.5 * scaleY,
    );
    path.cubicTo(
      14.376 * scaleX,
      11.4998 * scaleY,
      16.167 * scaleX,
      9.70902 * scaleY,
      16.167 * scaleX,
      7.5 * scaleY,
    );
    path.cubicTo(
      16.167 * scaleX,
      5.29098 * scaleY,
      14.376 * scaleX,
      3.5002 * scaleY,
      12.167 * scaleX,
      3.5 * scaleY,
    );
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_McUserIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
