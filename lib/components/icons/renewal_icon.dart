import 'package:flutter/material.dart';

// McRenewal Icon
class McRenewalIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const McRenewalIcon({super.key, this.size = 24.0, this.color});

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      size: Size(size, size),
      painter: _McRenewalIconPainter(color: iconColor),
    );
  }
}

class _McRenewalIconPainter extends CustomPainter {
  final Color color;

  _McRenewalIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    final scaleX = size.width / 20;
    final scaleY = size.height / 20;

    final path = Path();
    // Top arc
    path.moveTo(11.6836 * scaleX, 18.333 * scaleY);
    path.cubicTo(
      11.1395 * scaleX,
      18.4423 * scaleY,
      10.5763 * scaleX,
      18.5 * scaleY,
      10 * scaleX,
      18.5 * scaleY,
    );
    path.cubicTo(
      9.42369 * scaleX,
      18.5 * scaleY,
      8.86053 * scaleX,
      18.4423 * scaleY,
      8.31641 * scaleX,
      18.333 * scaleY,
    );
    path.lineTo(11.6836 * scaleX, 18.333 * scaleY);
    path.close();

    // Left arc with arrow
    path.moveTo(10 * scaleX, 1.5 * scaleY);
    path.cubicTo(
      12.2409 * scaleX,
      1.5 * scaleY,
      14.2783 * scaleX,
      2.36811 * scaleY,
      15.7969 * scaleX,
      3.78516 * scaleY,
    );
    path.lineTo(17.5 * scaleX, 2.08301 * scaleY);
    path.lineTo(17.5 * scaleX, 6.08301 * scaleY);
    path.cubicTo(
      17.5 * scaleX,
      6.63529 * scaleY,
      17.0523 * scaleX,
      7.08301 * scaleY,
      16.5 * scaleX,
      7.08301 * scaleY,
    );
    path.lineTo(12.5 * scaleX, 7.08301 * scaleY);
    path.lineTo(14.3818 * scaleX, 5.2002 * scaleY);
    path.cubicTo(
      13.2262 * scaleX,
      4.14456 * scaleY,
      11.6886 * scaleX,
      3.5 * scaleY,
      10 * scaleX,
      3.5 * scaleY,
    );
    path.cubicTo(
      6.41015 * scaleX,
      3.5 * scaleY,
      3.5 * scaleX,
      6.41015 * scaleY,
      3.5 * scaleX,
      10 * scaleY,
    );
    path.lineTo(1.66699 * scaleX, 10 * scaleY);
    path.lineTo(1.66699 * scaleX, 11.6836 * scaleY);
    path.cubicTo(
      1.55768 * scaleX,
      11.1395 * scaleY,
      1.5 * scaleX,
      10.5763 * scaleY,
      1.5 * scaleX,
      10 * scaleY,
    );
    path.cubicTo(
      1.5 * scaleX,
      5.30558 * scaleY,
      5.30558 * scaleX,
      1.5 * scaleY,
      10 * scaleX,
      1.5 * scaleY,
    );
    path.close();

    // Right arc with arrow
    path.moveTo(18.333 * scaleX, 8.31641 * scaleY);
    path.cubicTo(
      18.4423 * scaleX,
      8.86053 * scaleY,
      18.5 * scaleX,
      9.42369 * scaleY,
      18.5 * scaleX,
      10 * scaleY,
    );
    path.cubicTo(
      18.5 * scaleX,
      10.5763 * scaleY,
      18.4423 * scaleX,
      11.1395 * scaleY,
      18.333 * scaleX,
      11.6836 * scaleY,
    );
    path.lineTo(18.333 * scaleX, 8.31641 * scaleY);
    path.close();

    // Bottom arc continuation
    path.moveTo(18.333 * scaleX, 8.31641 * scaleY);
    path.cubicTo(
      18.4423 * scaleX,
      8.86053 * scaleY,
      18.5 * scaleX,
      9.42369 * scaleY,
      18.5 * scaleX,
      10 * scaleY,
    );
    path.cubicTo(
      18.5 * scaleX,
      14.6944 * scaleY,
      14.6944 * scaleX,
      18.5 * scaleY,
      10 * scaleX,
      18.5 * scaleY,
    );
    path.cubicTo(
      7.75863 * scaleX,
      18.5 * scaleY,
      5.72081 * scaleX,
      17.6315 * scaleY,
      4.20215 * scaleX,
      16.2139 * scaleY,
    );
    path.lineTo(2.5 * scaleX, 17.917 * scaleY);
    path.lineTo(2.5 * scaleX, 13.917 * scaleY);
    path.cubicTo(
      2.5 * scaleX,
      13.3647 * scaleY,
      2.94772 * scaleX,
      12.917 * scaleY,
      3.5 * scaleX,
      12.917 * scaleY,
    );
    path.lineTo(7.5 * scaleX, 12.917 * scaleY);
    path.lineTo(5.61719 * scaleX, 14.7988 * scaleY);
    path.cubicTo(
      6.77298 * scaleX,
      15.855 * scaleY,
      8.31092 * scaleX,
      16.5 * scaleY,
      10 * scaleX,
      16.5 * scaleY,
    );
    path.cubicTo(
      13.5898 * scaleX,
      16.5 * scaleY,
      16.5 * scaleX,
      13.5898 * scaleY,
      16.5 * scaleX,
      10 * scaleY,
    );
    path.lineTo(18.333 * scaleX, 10 * scaleY);
    path.lineTo(18.333 * scaleX, 8.31641 * scaleY);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_McRenewalIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
