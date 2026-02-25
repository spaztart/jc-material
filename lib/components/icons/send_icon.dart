import 'package:flutter/material.dart';

/// Send / play forward icon
/// Used for search submit or voice search functionality
class McSendIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McSendIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McSendIconPainter(color: iconColor),
    );
  }
}

class _McSendIconPainter extends CustomPainter {
  final Color color;

  _McSendIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    // Icon is 19x16, centered in 24x24 viewBox
    // Offset: x=2.5, y=4 to center
    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final path = Path();

    // Outer play triangle (19x16 centered in 24x24)
    path.moveTo(2.5 * scaleX, 20 * scaleY);
    path.lineTo(2.5 * scaleX, 4 * scaleY);
    path.lineTo(21.5 * scaleX, 12 * scaleY);
    path.close();

    // Inner arrow shape
    path.moveTo(4.5 * scaleX, 17 * scaleY);
    path.lineTo(16.35 * scaleX, 12 * scaleY);
    path.lineTo(4.5 * scaleX, 7 * scaleY);
    path.lineTo(4.5 * scaleX, 10.5 * scaleY);
    path.lineTo(10.5 * scaleX, 12 * scaleY);
    path.lineTo(4.5 * scaleX, 13.5 * scaleY);
    path.close();

    // Use even-odd fill to create the cutout effect
    path.fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_McSendIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
