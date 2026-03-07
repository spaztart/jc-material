import 'package:flutter/material.dart';

/// McAfee Reply Reverse Icon - arrow pointing left with tail
class McReplyReverseIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McReplyReverseIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;

    return CustomPaint(
      size: Size(size, size),
      painter: _McReplyReverseIconPainter(color: iconColor),
    );
  }
}

class _McReplyReverseIconPainter extends CustomPainter {
  final Color color;

  _McReplyReverseIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final path = Path();

    path.moveTo(5 * scaleX, 5 * scaleY);
    path.lineTo(5 * scaleX, 9 * scaleY);
    path.cubicTo(
      5 * scaleX,
      9.83333 * scaleY,
      5.29167 * scaleX,
      10.5417 * scaleY,
      5.875 * scaleX,
      11.125 * scaleY,
    );
    path.cubicTo(
      6.45833 * scaleX,
      11.7083 * scaleY,
      7.16667 * scaleX,
      12 * scaleY,
      8 * scaleX,
      12 * scaleY,
    );
    path.lineTo(17.175 * scaleX, 12 * scaleY);
    path.lineTo(13.575 * scaleX, 8.4 * scaleY);
    path.lineTo(15 * scaleX, 7 * scaleY);
    path.lineTo(21 * scaleX, 13 * scaleY);
    path.lineTo(15 * scaleX, 19 * scaleY);
    path.lineTo(13.575 * scaleX, 17.6 * scaleY);
    path.lineTo(17.175 * scaleX, 14 * scaleY);
    path.lineTo(8 * scaleX, 14 * scaleY);
    path.cubicTo(
      6.61667 * scaleX,
      14 * scaleY,
      5.4375 * scaleX,
      13.5125 * scaleY,
      4.4625 * scaleX,
      12.5375 * scaleY,
    );
    path.cubicTo(
      3.4875 * scaleX,
      11.5625 * scaleY,
      3 * scaleX,
      10.3833 * scaleY,
      3 * scaleX,
      9 * scaleY,
    );
    path.lineTo(3 * scaleX, 5 * scaleY);
    path.lineTo(5 * scaleX, 5 * scaleY);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_McReplyReverseIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
