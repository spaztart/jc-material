import 'package:flutter/material.dart';

/// McAfee Chat Icon - chat bubble with plus sign
class McChatIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McChatIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;

    return CustomPaint(
      size: Size(size, size),
      painter: _McChatIconPainter(color: iconColor),
    );
  }
}

class _McChatIconPainter extends CustomPainter {
  final Color color;

  _McChatIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final path = Path();

    path.moveTo(2 * scaleX, 20 * scaleY);
    path.lineTo(2 * scaleX, 5 * scaleY);
    path.cubicTo(
      2 * scaleX,
      4.45 * scaleY,
      2.19583 * scaleX,
      3.97917 * scaleY,
      2.5875 * scaleX,
      3.5875 * scaleY,
    );
    path.cubicTo(
      2.97917 * scaleX,
      3.19583 * scaleY,
      3.45 * scaleX,
      3 * scaleY,
      4 * scaleX,
      3 * scaleY,
    );
    path.lineTo(16 * scaleX, 3 * scaleY);
    path.cubicTo(
      16.55 * scaleX,
      3 * scaleY,
      17.0208 * scaleX,
      3.19583 * scaleY,
      17.4125 * scaleX,
      3.5875 * scaleY,
    );
    path.cubicTo(
      17.8042 * scaleX,
      3.97917 * scaleY,
      18 * scaleX,
      4.45 * scaleY,
      18 * scaleX,
      5 * scaleY,
    );
    path.lineTo(18 * scaleX, 10.075 * scaleY);
    path.cubicTo(
      17.8333 * scaleX,
      10.0417 * scaleY,
      17.6667 * scaleX,
      10.0208 * scaleY,
      17.5 * scaleX,
      10.0125 * scaleY,
    );
    path.cubicTo(
      17.3333 * scaleX,
      10.0042 * scaleY,
      17.1667 * scaleX,
      10 * scaleY,
      17 * scaleX,
      10 * scaleY,
    );
    path.cubicTo(
      16.8333 * scaleX,
      10 * scaleY,
      16.6667 * scaleX,
      10.0042 * scaleY,
      16.5 * scaleX,
      10.0125 * scaleY,
    );
    path.cubicTo(
      16.3333 * scaleX,
      10.0208 * scaleY,
      16.1667 * scaleX,
      10.0417 * scaleY,
      16 * scaleX,
      10.075 * scaleY,
    );
    path.lineTo(16 * scaleX, 5 * scaleY);
    path.lineTo(4 * scaleX, 5 * scaleY);
    path.lineTo(4 * scaleX, 15 * scaleY);
    path.lineTo(11.075 * scaleX, 15 * scaleY);
    path.cubicTo(
      11.0417 * scaleX,
      15.1667 * scaleY,
      11.0208 * scaleX,
      15.3333 * scaleY,
      11.0125 * scaleX,
      15.5 * scaleY,
    );
    path.cubicTo(
      11.0042 * scaleX,
      15.6667 * scaleY,
      11 * scaleX,
      15.8333 * scaleY,
      11 * scaleX,
      16 * scaleY,
    );
    path.cubicTo(
      11 * scaleX,
      16.1667 * scaleY,
      11.0042 * scaleX,
      16.3333 * scaleY,
      11.0125 * scaleX,
      16.5 * scaleY,
    );
    path.cubicTo(
      11.0208 * scaleX,
      16.6667 * scaleY,
      11.0417 * scaleX,
      16.8333 * scaleY,
      11.075 * scaleX,
      17 * scaleY,
    );
    path.lineTo(5 * scaleX, 17 * scaleY);
    path.lineTo(2 * scaleX, 20 * scaleY);
    path.close();

    path.moveTo(6 * scaleX, 9 * scaleY);
    path.lineTo(14 * scaleX, 9 * scaleY);
    path.lineTo(14 * scaleX, 7 * scaleY);
    path.lineTo(6 * scaleX, 7 * scaleY);
    path.lineTo(6 * scaleX, 9 * scaleY);
    path.close();

    path.moveTo(6 * scaleX, 13 * scaleY);
    path.lineTo(11 * scaleX, 13 * scaleY);
    path.lineTo(11 * scaleX, 11 * scaleY);
    path.lineTo(6 * scaleX, 11 * scaleY);
    path.lineTo(6 * scaleX, 13 * scaleY);
    path.close();

    path.moveTo(16 * scaleX, 20 * scaleY);
    path.lineTo(16 * scaleX, 17 * scaleY);
    path.lineTo(13 * scaleX, 17 * scaleY);
    path.lineTo(13 * scaleX, 15 * scaleY);
    path.lineTo(16 * scaleX, 15 * scaleY);
    path.lineTo(16 * scaleX, 12 * scaleY);
    path.lineTo(18 * scaleX, 12 * scaleY);
    path.lineTo(18 * scaleX, 15 * scaleY);
    path.lineTo(21 * scaleX, 15 * scaleY);
    path.lineTo(21 * scaleX, 17 * scaleY);
    path.lineTo(18 * scaleX, 17 * scaleY);
    path.lineTo(18 * scaleX, 20 * scaleY);
    path.lineTo(16 * scaleX, 20 * scaleY);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_McChatIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
