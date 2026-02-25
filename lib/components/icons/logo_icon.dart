import 'package:flutter/material.dart';
import 'package:mc_flutter_tokens/mc_tokens.dart';

import 'brand_color.dart';

/// McAfee Logo Icon widget using custom painter
/// This is the square shield logo
class McLogoIcon extends StatelessWidget {
  final double size;
  final BrandColor color;

  const McLogoIcon({
    super.key,
    this.size = 24.0,
    this.color = BrandColor.black,
  });

  @override
  Widget build(BuildContext context) {
    // Use tokens for brand colors
    final Color colorValue;
    if (color == BrandColor.red) {
      // Red: stays red in both modes
      colorValue = context.extendedColors.mcafeeRed;
    } else {
      // Black: uses onSurface which automatically adapts (black in light, white in dark)
      colorValue = Theme.of(context).colorScheme.onSurface;
    }

    return CustomPaint(
      size: Size(size, size * (25.0 / 24.0)), // Maintain aspect ratio
      painter: _McLogoPainter(color: colorValue),
    );
  }
}

class _McLogoPainter extends CustomPainter {
  final Color color;

  _McLogoPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    final scaleX = size.width / 24;
    final scaleY = size.height / 25;

    final path = Path();

    // Scale and translate the path to fit the size
    // Original viewBox: 0 0 24 25
    // Path: M12 4.91324L2 0V19.5274L12 24.4444L22 19.5274V0L12 4.91324Z
    //       M17.9013 16.7477L12 19.6485L6.09878 16.7477V6.80863L12.0001 9.70813L17.9014 6.80863L17.9013 16.7477Z

    path.moveTo(12 * scaleX, 4.91324 * scaleY);
    path.lineTo(2 * scaleX, 0 * scaleY);
    path.lineTo(2 * scaleX, 19.5274 * scaleY);
    path.lineTo(12 * scaleX, 24.4444 * scaleY);
    path.lineTo(22 * scaleX, 19.5274 * scaleY);
    path.lineTo(22 * scaleX, 0 * scaleY);
    path.close();

    path.moveTo(17.9013 * scaleX, 16.7477 * scaleY);
    path.lineTo(12 * scaleX, 19.6485 * scaleY);
    path.lineTo(6.09878 * scaleX, 16.7477 * scaleY);
    path.lineTo(6.09878 * scaleX, 6.80863 * scaleY);
    path.lineTo(12.0001 * scaleX, 9.70813 * scaleY);
    path.lineTo(17.9014 * scaleX, 6.80863 * scaleY);
    path.lineTo(17.9013 * scaleX, 16.7477 * scaleY);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_McLogoPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
