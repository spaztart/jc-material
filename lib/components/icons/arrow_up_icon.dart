import 'package:flutter/material.dart';

/// McAfee Arrow Up Icon - circular icon with up arrow
class McArrowUpIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McArrowUpIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;

    return CustomPaint(
      size: Size(size, size),
      painter: _McArrowUpIconPainter(color: iconColor),
    );
  }
}

class _McArrowUpIconPainter extends CustomPainter {
  final Color color;

  _McArrowUpIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final path = Path();

    path.moveTo(12 * scaleX, 2 * scaleY);
    path.cubicTo(
      17.5228 * scaleX,
      2 * scaleY,
      22 * scaleX,
      6.47715 * scaleY,
      22 * scaleX,
      12 * scaleY,
    );
    path.cubicTo(
      22 * scaleX,
      17.5228 * scaleY,
      17.5228 * scaleX,
      22 * scaleY,
      12 * scaleX,
      22 * scaleY,
    );
    path.cubicTo(
      6.47715 * scaleX,
      22 * scaleY,
      2 * scaleX,
      17.5228 * scaleY,
      2 * scaleX,
      12 * scaleY,
    );
    path.cubicTo(
      2 * scaleX,
      6.47715 * scaleY,
      6.47715 * scaleX,
      2 * scaleY,
      12 * scaleX,
      2 * scaleY,
    );
    path.close();

    path.moveTo(5.33333 * scaleX, 12 * scaleY);
    path.lineTo(6.50033 * scaleX, 13.1873 * scaleY);
    path.lineTo(11.1667 * scaleX, 8.521 * scaleY);
    path.lineTo(11.1667 * scaleX, 18.6667 * scaleY);
    path.lineTo(12.8333 * scaleX, 18.6667 * scaleY);
    path.lineTo(12.8333 * scaleX, 8.521 * scaleY);
    path.lineTo(17.4997 * scaleX, 13.1873 * scaleY);
    path.lineTo(18.6667 * scaleX, 12 * scaleY);
    path.lineTo(12 * scaleX, 5.33333 * scaleY);
    path.lineTo(5.33333 * scaleX, 12 * scaleY);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_McArrowUpIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
