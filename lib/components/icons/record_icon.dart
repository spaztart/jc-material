import 'package:flutter/material.dart';

/// McAfee Record Icon - circular icon with a square in the center
class McRecordIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McRecordIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;

    return CustomPaint(
      size: Size(size, size),
      painter: _McRecordIconPainter(color: iconColor),
    );
  }
}

class _McRecordIconPainter extends CustomPainter {
  final Color color;

  _McRecordIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final path = Path();

    // Circle with square inside
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

    path.moveTo(8.88867 * scaleX, 8 * scaleY);
    path.cubicTo(
      8.64432 * scaleX,
      8.00005 * scaleY,
      8.43476 * scaleX,
      8.08672 * scaleY,
      8.26074 * scaleX,
      8.26074 * scaleY,
    );
    path.cubicTo(
      8.08672 * scaleX,
      8.43476 * scaleY,
      8.00005 * scaleX,
      8.64432 * scaleY,
      8 * scaleX,
      8.88867 * scaleY,
    );
    path.lineTo(8 * scaleX, 15.1113 * scaleY);
    path.cubicTo(
      8.00005 * scaleX,
      15.3557 * scaleY,
      8.08672 * scaleX,
      15.5652 * scaleY,
      8.26074 * scaleX,
      15.7393 * scaleY,
    );
    path.cubicTo(
      8.43476 * scaleX,
      15.9133 * scaleY,
      8.64432 * scaleX,
      15.9999 * scaleY,
      8.88867 * scaleX,
      16 * scaleY,
    );
    path.lineTo(15.1113 * scaleX, 16 * scaleY);
    path.cubicTo(
      15.3557 * scaleX,
      15.9999 * scaleY,
      15.5652 * scaleX,
      15.9133 * scaleY,
      15.7393 * scaleX,
      15.7393 * scaleY,
    );
    path.cubicTo(
      15.9133 * scaleX,
      15.5652 * scaleY,
      15.9999 * scaleX,
      15.3557 * scaleY,
      16 * scaleX,
      15.1113 * scaleY,
    );
    path.lineTo(16 * scaleX, 8.88867 * scaleY);
    path.cubicTo(
      15.9999 * scaleX,
      8.64432 * scaleY,
      15.9133 * scaleX,
      8.43476 * scaleY,
      15.7393 * scaleX,
      8.26074 * scaleY,
    );
    path.cubicTo(
      15.5652 * scaleX,
      8.08672 * scaleY,
      15.3557 * scaleX,
      8.00005 * scaleY,
      15.1113 * scaleX,
      8 * scaleY,
    );
    path.lineTo(8.88867 * scaleX, 8 * scaleY);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_McRecordIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
