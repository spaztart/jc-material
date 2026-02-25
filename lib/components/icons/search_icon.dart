import 'package:flutter/material.dart';

/// Search / magnifying glass icon
/// Used for search functionality
class McSearchIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McSearchIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McSearchIconPainter(color: iconColor),
    );
  }
}

class _McSearchIconPainter extends CustomPainter {
  final Color color;

  _McSearchIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    // Scaled to fill 2-22 in 24x24 viewBox (same as other icons like McRecordIcon)
    // Transform: new = (original/2 - 6.01) * 1.764 + 2
    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final path = Path();

    // Outer path - magnifying glass with handle
    path.moveTo(5.44 * scaleX, 5.44 * scaleY);
    path.cubicTo(
      8.90 * scaleX,
      2 * scaleY,
      14.47 * scaleX,
      2 * scaleY,
      17.93 * scaleX,
      5.44 * scaleY,
    );
    path.cubicTo(
      21.16 * scaleX,
      8.69 * scaleY,
      21.35 * scaleX,
      13.80 * scaleY,
      18.51 * scaleX,
      17.26 * scaleY,
    );
    path.lineTo(22 * scaleX, 20.77 * scaleY);
    path.lineTo(20.77 * scaleX, 22 * scaleY);
    path.lineTo(17.26 * scaleX, 18.51 * scaleY);
    path.cubicTo(
      13.80 * scaleX,
      21.35 * scaleY,
      8.69 * scaleX,
      21.16 * scaleY,
      5.44 * scaleX,
      17.93 * scaleY,
    );
    path.cubicTo(
      2 * scaleX,
      14.47 * scaleY,
      2 * scaleX,
      8.90 * scaleY,
      5.44 * scaleX,
      5.44 * scaleY,
    );
    path.close();

    // Inner path - lens cutout
    path.moveTo(16.68 * scaleX, 6.69 * scaleY);
    path.cubicTo(
      13.93 * scaleX,
      3.94 * scaleY,
      9.44 * scaleX,
      3.94 * scaleY,
      6.69 * scaleX,
      6.69 * scaleY,
    );
    path.cubicTo(
      3.94 * scaleX,
      9.44 * scaleY,
      3.94 * scaleX,
      13.93 * scaleY,
      6.69 * scaleX,
      16.68 * scaleY,
    );
    path.cubicTo(
      9.44 * scaleX,
      19.43 * scaleY,
      13.93 * scaleX,
      19.43 * scaleY,
      16.68 * scaleX,
      16.68 * scaleY,
    );
    path.cubicTo(
      19.43 * scaleX,
      13.93 * scaleY,
      19.43 * scaleX,
      9.44 * scaleY,
      16.68 * scaleX,
      6.69 * scaleY,
    );
    path.close();

    // Use even-odd fill to create the cutout effect
    path.fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_McSearchIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
