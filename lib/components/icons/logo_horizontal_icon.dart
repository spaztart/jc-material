import 'package:flutter/material.dart';
import 'package:mc_flutter_tokens/mc_tokens.dart';

import 'brand_color.dart';

/// McAfee Horizontal Logo widget using custom painter
/// The horizontal logo contains both red (shield) and black (text) parts
///
/// By default, the entire logo is rendered in red (#C01818).
/// Pass [color: BrandColor.black] to render the entire logo in black.
class McLogoHorizontalIcon extends StatelessWidget {
  final double? width;
  final double? height;
  final BrandColor? color;

  const McLogoHorizontalIcon({super.key, this.width, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    // Original aspect ratio: 94x18
    final aspectRatio = 94.0 / 18.0;
    final logoWidth = width ?? (height != null ? height! * aspectRatio : 94.0);
    final logoHeight = height ?? (width != null ? width! / aspectRatio : 18.0);

    // Use tokens for brand colors
    // Default to red if no color is specified
    final Color monoColor;
    if (color == BrandColor.black) {
      // Black: uses onSurface which automatically adapts (black in light, white in dark)
      monoColor = Theme.of(context).colorScheme.onSurface;
    } else {
      // Red (default): stays red in both modes
      monoColor = context.extendedColors.mcafeeRed;
    }

    return CustomPaint(
      size: Size(logoWidth, logoHeight),
      painter: _McAfeeHorizontalLogoPainter(
        redColor: monoColor,
        blackColor: monoColor,
      ),
    );
  }
}

class _McAfeeHorizontalLogoPainter extends CustomPainter {
  final Color redColor;
  final Color blackColor;

  _McAfeeHorizontalLogoPainter({
    required this.redColor,
    required this.blackColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final redPaint =
        Paint()
          ..color = redColor
          ..style = PaintingStyle.fill;

    final blackPaint =
        Paint()
          ..color = blackColor
          ..style = PaintingStyle.fill;

    final scaleX = size.width / 94;
    final scaleY = size.height / 18;

    final path = Path();

    // All paths from the SVG
    // Path 1
    path.moveTo(46.7288 * scaleX, 11.6263 * scaleY);
    path.lineTo(44.2874 * scaleX, 10.2066 * scaleY);
    path.lineTo(44.106 * scaleX, 10.4846 * scaleY);
    path.cubicTo(
      43.5495 * scaleX,
      11.3403 * scaleY,
      42.7889 * scaleX,
      11.7745 * scaleY,
      41.8465 * scaleX,
      11.7737 * scaleY,
    );
    path.cubicTo(
      40.2319 * scaleX,
      11.7729 * scaleY,
      39.0146 * scaleX,
      10.5804 * scaleY,
      39.0155 * scaleX,
      8.99975 * scaleY,
    );
    path.cubicTo(
      39.0167 * scaleX,
      7.41952 * scaleY,
      40.2347 * scaleX,
      6.22859 * scaleY,
      41.8497 * scaleX,
      6.22938 * scaleY,
    );
    path.cubicTo(
      42.8055 * scaleX,
      6.23018 * scaleY,
      43.5235 * scaleX,
      6.64092 * scaleY,
      44.1096 * scaleX,
      7.5232 * scaleY,
    );
    path.lineTo(44.2919 * scaleX, 7.7973 * scaleY);
    path.lineTo(46.7446 * scaleX, 6.37437 * scaleY);
    path.lineTo(46.5327 * scaleX, 6.07406 * scaleY);
    path.cubicTo(
      45.361 * scaleX,
      4.41279 * scaleY,
      43.8296 * scaleX,
      3.6052 * scaleY,
      41.8513 * scaleX,
      3.604 * scaleY,
    );
    path.cubicTo(
      38.1116 * scaleX,
      3.60242 * scaleY,
      36.0919 * scaleX,
      6.38152 * scaleY,
      36.0907 * scaleX,
      8.99776 * scaleY,
    );
    path.cubicTo(
      36.0891 * scaleX,
      11.6144 * scaleY,
      38.1051 * scaleX,
      14.3963 * scaleY,
      41.8448 * scaleX,
      14.3983 * scaleY,
    );
    path.cubicTo(
      43.7504 * scaleX,
      14.3991 * scaleY,
      45.5481 * scaleX,
      13.4509 * scaleY,
      46.5372 * scaleX,
      11.9227 * scaleY,
    );
    path.lineTo(46.7288 * scaleX, 11.6263 * scaleY);
    path.close();

    // Path 2
    path.moveTo(53.5403 * scaleX, 5.74059 * scaleY);
    path.lineTo(54.9065 * scaleX, 9.09808 * scaleY);
    path.lineTo(52.155 * scaleX, 9.09609 * scaleY);
    path.lineTo(53.5403 * scaleX, 5.74059 * scaleY);
    path.close();

    path.moveTo(46.6068 * scaleX, 14.4 * scaleY);
    path.lineTo(49.9821 * scaleX, 14.402 * scaleY);
    path.lineTo(50.985 * scaleX, 11.9601 * scaleY);
    path.lineTo(56.0508 * scaleX, 11.9625 * scaleY);
    path.lineTo(57.0509 * scaleX, 14.4055 * scaleY);
    path.lineTo(60.4408 * scaleX, 14.4075 * scaleY);
    path.lineTo(54.394 * scaleX, 0.0960714 * scaleY);
    path.lineTo(51.3832 * scaleX, 0.0944824 * scaleY);
    path.lineTo(52.1848 * scaleX, 1.99171 * scaleY);
    path.lineTo(46.6068 * scaleX, 14.4 * scaleY);
    path.close();

    // Path 3
    path.moveTo(61.8381 * scaleX, 14.4088 * scaleY);
    path.lineTo(64.8002 * scaleX, 14.4104 * scaleY);
    path.lineTo(64.8039 * scaleX, 7.98735 * scaleY);
    path.lineTo(66.7351 * scaleX, 7.98894 * scaleY);
    path.lineTo(66.7367 * scaleX, 5.29445 * scaleY);
    path.lineTo(64.8055 * scaleX, 5.29326 * scaleY);
    path.lineTo(64.8059 * scaleX, 4.0197 * scaleY);
    path.cubicTo(
      64.8059 * scaleX,
      3.47309 * scaleY,
      65.1801 * scaleX,
      2.89272 * scaleY,
      65.873 * scaleX,
      2.89312 * scaleY,
    );
    path.cubicTo(
      66.2537 * scaleX,
      2.89351 * scaleY,
      66.4834 * scaleX,
      2.95707 * scaleY,
      66.7127 * scaleX,
      3.0532 * scaleY,
    );
    path.lineTo(67.0423 * scaleX, 3.19224 * scaleY);
    path.lineTo(68.2729 * scaleX, 0.562891 * scaleY);
    path.lineTo(67.9182 * scaleX, 0.421075 * scaleY);
    path.cubicTo(
      67.3678 * scaleX,
      0.200208 * scaleY,
      66.6011 * scaleX,
      0.12076 * scaleY,
      66.0666 * scaleX,
      0.120362 * scaleY,
    );
    path.cubicTo(
      64.7231 * scaleX,
      0.119568 * scaleY,
      63.6163 * scaleX,
      0.549384 * scaleY,
      62.8638 * scaleX,
      1.36294 * scaleY,
    );
    path.cubicTo(
      62.2071 * scaleX,
      2.07321 * scaleY,
      61.845 * scaleX,
      3.06115 * scaleY,
      61.8442 * scaleX,
      4.14403 * scaleY,
    );
    path.lineTo(61.8434 * scaleX, 5.29127 * scaleY);
    path.lineTo(60.5357 * scaleX, 5.29087 * scaleY);
    path.lineTo(60.5341 * scaleX, 7.98577 * scaleY);
    path.lineTo(61.8422 * scaleX, 7.98616 * scaleY);
    path.lineTo(61.8381 * scaleX, 14.4088 * scaleY);
    path.close();

    // Path 4 - M letter
    path.moveTo(22.1268 * scaleX, 0.0123291 * scaleY);
    path.lineTo(22.1268 * scaleX, 14.3869 * scaleY);
    path.lineTo(25.345 * scaleX, 14.3889 * scaleY);
    path.lineTo(25.3498 * scaleX, 6.17078 * scaleY);
    path.lineTo(28.469 * scaleX, 8.44539 * scaleY);
    path.lineTo(31.591 * scaleX, 6.17078 * scaleY);
    path.lineTo(31.591 * scaleX, 14.3925 * scaleY);
    path.lineTo(34.8048 * scaleX, 14.3941 * scaleY);
    path.lineTo(34.8129 * scaleX, 0.0123291 * scaleY);
    path.lineTo(28.4715 * scaleX, 4.70218 * scaleY);
    path.lineTo(22.1268 * scaleX, 0.0123291 * scaleY);
    path.close();

    // Path 5 - First E
    path.moveTo(70.8223 * scaleX, 7.7034 * scaleY);
    path.cubicTo(
      71.2091 * scaleX,
      6.72301 * scaleY,
      72.0436 * scaleX,
      6.15058 * scaleY,
      73.1216 * scaleX,
      6.15098 * scaleY,
    );
    path.cubicTo(
      74.211 * scaleX,
      6.15138 * scaleY,
      75.0613 * scaleX,
      6.71228 * scaleY,
      75.5122 * scaleX,
      7.70579 * scaleY,
    );
    path.lineTo(70.8223 * scaleX, 7.7034 * scaleY);
    path.close();

    path.moveTo(73.4058 * scaleX, 3.65271 * scaleY);
    path.cubicTo(
      69.6778 * scaleX,
      3.65072 * scaleY,
      67.6639 * scaleX,
      6.42268 * scaleY,
      67.6622 * scaleX,
      9.03098 * scaleY,
    );
    path.cubicTo(
      67.661 * scaleX,
      11.6401 * scaleY,
      69.6713 * scaleX,
      14.4132 * scaleY,
      73.3997 * scaleX,
      14.4152 * scaleY,
    );
    path.lineTo(73.4014 * scaleX, 14.4152 * scaleY);
    path.lineTo(73.4038 * scaleX, 14.4152 * scaleY);
    path.cubicTo(
      75.1134 * scaleX,
      14.3973 * scaleY,
      76.7166 * scaleX,
      13.6346 * scaleY,
      77.9578 * scaleX,
      12.2598 * scaleY,
    );
    path.lineTo(75.542 * scaleX, 10.9699 * scaleY);
    path.cubicTo(
      74.9226 * scaleX,
      11.5908 * scaleY,
      74.1705 * scaleX,
      11.9173 * scaleY,
      73.3401 * scaleX,
      11.9169 * scaleY,
    );
    path.cubicTo(
      72.1237 * scaleX,
      11.9162 * scaleY,
      71.0448 * scaleX,
      11.1225 * scaleY,
      70.7627 * scaleX,
      10.0849 * scaleY,
    );
    path.lineTo(78.8186 * scaleX, 10.0892 * scaleY);
    path.lineTo(78.819 * scaleX, 9.373 * scaleY);
    path.cubicTo(
      78.8215 * scaleX,
      5.42958 * scaleY,
      75.6552 * scaleX,
      3.6543 * scaleY,
      73.4058 * scaleX,
      3.65271 * scaleY,
    );
    path.close();

    // Path 6 - Second E
    path.moveTo(82.931 * scaleX, 7.71126 * scaleY);
    path.cubicTo(
      83.3174 * scaleX,
      6.73047 * scaleY,
      84.1515 * scaleX,
      6.15804 * scaleY,
      85.2299 * scaleX,
      6.15844 * scaleY,
    );
    path.cubicTo(
      86.3197 * scaleX,
      6.15924 * scaleY,
      87.17 * scaleX,
      6.71974 * scaleY,
      87.6209 * scaleX,
      7.71365 * scaleY,
    );
    path.lineTo(82.931 * scaleX, 7.71126 * scaleY);
    path.close();

    path.moveTo(85.5141 * scaleX, 3.6604 * scaleY);
    path.cubicTo(
      81.7857 * scaleX,
      3.65842 * scaleY,
      79.7726 * scaleX,
      6.42998 * scaleY,
      79.7709 * scaleX,
      9.03827 * scaleY,
    );
    path.cubicTo(
      79.7693 * scaleX,
      11.6474 * scaleY,
      81.7792 * scaleX,
      14.4205 * scaleY,
      85.5084 * scaleX,
      14.4229 * scaleY,
    );
    path.lineTo(85.5101 * scaleX, 14.4229 * scaleY);
    path.lineTo(85.5117 * scaleX, 14.4229 * scaleY);
    path.cubicTo(
      87.222 * scaleX,
      14.4046 * scaleY,
      88.8253 * scaleX,
      13.6419 * scaleY,
      90.066 * scaleX,
      12.2671 * scaleY,
    );
    path.lineTo(87.6503 * scaleX, 10.9776 * scaleY);
    path.cubicTo(
      87.0305 * scaleX,
      11.5985 * scaleY,
      86.2788 * scaleX,
      11.925 * scaleY,
      85.4488 * scaleX,
      11.9246 * scaleY,
    );
    path.cubicTo(
      84.2319 * scaleX,
      11.9238 * scaleY,
      83.1531 * scaleX,
      11.1301 * scaleY,
      82.8714 * scaleX,
      10.0926 * scaleY,
    );
    path.lineTo(90.9269 * scaleX, 10.0965 * scaleY);
    path.lineTo(90.9277 * scaleX, 9.38069 * scaleY);
    path.cubicTo(
      90.9302 * scaleX,
      5.43727 * scaleY,
      87.7635 * scaleX,
      3.66159 * scaleY,
      85.5141 * scaleX,
      3.6604 * scaleY,
    );
    path.close();

    // Path 7 - TM T
    path.moveTo(90.5488 * scaleX, 3.1001 * scaleY);
    path.lineTo(91.803 * scaleX, 3.1001 * scaleY);
    path.lineTo(91.803 * scaleX, 3.32931 * scaleY);
    path.lineTo(91.3103 * scaleX, 3.32931 * scaleY);
    path.lineTo(91.3103 * scaleX, 4.61598 * scaleY);
    path.lineTo(91.0395 * scaleX, 4.61598 * scaleY);
    path.lineTo(91.0395 * scaleX, 3.32931 * scaleY);
    path.lineTo(90.5488 * scaleX, 3.32931 * scaleY);
    path.lineTo(90.5488 * scaleX, 3.1001 * scaleY);
    path.close();

    // Path 8 - TM M
    path.moveTo(92.1608 * scaleX, 3.1001 * scaleY);
    path.lineTo(92.5424 * scaleX, 3.1001 * scaleY);
    path.lineTo(92.9697 * scaleX, 4.28706 * scaleY);
    path.lineTo(92.9742 * scaleX, 4.28706 * scaleY);
    path.lineTo(93.3906 * scaleX, 3.1001 * scaleY);
    path.lineTo(93.7681 * scaleX, 3.1001 * scaleY);
    path.lineTo(93.7681 * scaleX, 4.61598 * scaleY);
    path.lineTo(93.51 * scaleX, 4.61598 * scaleY);
    path.lineTo(93.51 * scaleX, 3.4461 * scaleY);
    path.lineTo(93.5055 * scaleX, 3.4461 * scaleY);
    path.lineTo(93.0765 * scaleX, 4.61598 * scaleY);
    path.lineTo(92.8529 * scaleX, 4.61598 * scaleY);
    path.lineTo(92.423 * scaleX, 3.4461 * scaleY);
    path.lineTo(92.419 * scaleX, 3.4461 * scaleY);
    path.lineTo(92.419 * scaleX, 4.61598 * scaleY);
    path.lineTo(92.1608 * scaleX, 4.61598 * scaleY);
    path.lineTo(92.1608 * scaleX, 3.1001 * scaleY);
    path.close();

    // Draw text parts in black (paths 1-8)
    canvas.drawPath(path, blackPaint);

    // Draw shield parts in red (paths 9-10)
    final shieldPath = Path();

    // Path 9 - Left shield part (RED)
    shieldPath.moveTo(3.26083 * scaleX, 12.274 * scaleY);
    shieldPath.lineTo(3.26083 * scaleX, 4.99016 * scaleY);
    shieldPath.lineTo(7.95562 * scaleX, 7.11501 * scaleY);
    shieldPath.lineTo(7.95562 * scaleX, 3.60061 * scaleY);
    shieldPath.lineTo(0 * scaleX, 0 * scaleY);
    shieldPath.lineTo(0 * scaleX, 14.3111 * scaleY);
    shieldPath.lineTo(7.95562 * scaleX, 17.9148 * scaleY);
    shieldPath.lineTo(7.95562 * scaleX, 14.4 * scaleY);
    shieldPath.lineTo(3.26083 * scaleX, 12.274 * scaleY);
    shieldPath.close();

    // Path 10 - Right shield part (RED)
    shieldPath.moveTo(12.6504 * scaleX, 12.274 * scaleY);
    shieldPath.lineTo(12.6504 * scaleX, 4.99016 * scaleY);
    shieldPath.lineTo(7.95563 * scaleX, 7.11501 * scaleY);
    shieldPath.lineTo(7.95563 * scaleX, 3.60061 * scaleY);
    shieldPath.lineTo(15.9112 * scaleX, 0 * scaleY);
    shieldPath.lineTo(15.9112 * scaleX, 14.3111 * scaleY);
    shieldPath.lineTo(7.95563 * scaleX, 17.9148 * scaleY);
    shieldPath.lineTo(7.95563 * scaleX, 14.4 * scaleY);
    shieldPath.lineTo(12.6504 * scaleX, 12.274 * scaleY);
    shieldPath.close();

    canvas.drawPath(shieldPath, redPaint);
  }

  @override
  bool shouldRepaint(_McAfeeHorizontalLogoPainter oldDelegate) {
    return oldDelegate.redColor != redColor ||
        oldDelegate.blackColor != blackColor;
  }
}
