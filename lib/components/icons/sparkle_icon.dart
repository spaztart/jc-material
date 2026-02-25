import 'package:flutter/material.dart';

/// McAfee Sparkle Icon - AI sparkle icon
class McSparkleIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McSparkleIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;

    return CustomPaint(
      size: Size(size, size),
      painter: _McSparkleIconPainter(color: iconColor),
    );
  }
}

class _McSparkleIconPainter extends CustomPainter {
  final Color color;

  _McSparkleIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    final scaleX = size.width / 24;
    final scaleY = size.height / 24;

    final path = Path();

    // Large sparkle
    path.moveTo(9.09439 * scaleX, 6.70061 * scaleY);
    path.lineTo(14.3214 * scaleX, 9.17896 * scaleY);
    path.lineTo(9.09439 * scaleX, 11.6588 * scaleY);
    path.lineTo(7.16069 * scaleX, 18.3579 * scaleY);
    path.lineTo(5.227 * scaleX, 11.6588 * scaleY);
    path.lineTo(0 * scaleX, 9.17896 * scaleY);
    path.lineTo(5.227 * scaleX, 6.70061 * scaleY);
    path.lineTo(7.16069 * scaleX, 0 * scaleY);
    path.lineTo(9.09439 * scaleX, 6.70061 * scaleY);
    path.close();

    // Small sparkle
    path.moveTo(21.1844 * scaleX, 17.005 * scaleY);
    path.lineTo(24 * scaleX, 18.4917 * scaleY);
    path.lineTo(21.1844 * scaleX, 19.9799 * scaleY);
    path.lineTo(20.1433 * scaleX, 24 * scaleY);
    path.lineTo(19.1022 * scaleX, 19.9799 * scaleY);
    path.lineTo(16.288 * scaleX, 18.4917 * scaleY);
    path.lineTo(19.1022 * scaleX, 17.005 * scaleY);
    path.lineTo(20.1433 * scaleX, 12.9849 * scaleY);
    path.lineTo(21.1844 * scaleX, 17.005 * scaleY);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_McSparkleIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
