import 'package:flutter/material.dart';
import 'package:mc_flutter_tokens/mc_tokens.dart';
import 'icon.dart';

/// McAfee branded loader component with the iconic M logo
///
/// The size parameter controls both the circular progress indicator and the logo,
/// maintaining the proper design ratio (logo is 37.5% of the total size).
/// Based on Figma design: 24px total with 9px logo width.
class McLoader extends StatelessWidget {
  const McLoader({
    super.key,
    this.size = 48.0,
    this.brandColor = BrandColor.red,
    this.strokeWidth = 4.0,
    this.showLogo = true,
  });

  /// Size of the loader diameter (controls both circle and logo proportionally)
  final double size;

  /// Brand color of the loader (red or black)
  final BrandColor brandColor;

  /// Width of the circular stroke
  final double strokeWidth;

  /// Whether to show the McAfee logo in the center
  final bool showLogo;

  @override
  Widget build(BuildContext context) {
    // Use tokens for brand colors
    final Color effectiveColor;
    if (brandColor == BrandColor.red) {
      effectiveColor = context.extendedColors.mcafeeRed;
    } else {
      // Black: uses onSurface which automatically adapts (black in light, white in dark)
      effectiveColor = Theme.of(context).colorScheme.onSurface;
    }

    final backgroundColor = Theme.of(context).colorScheme.outlineVariant;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle (grey track using outlineVariant token)
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              value: 1.0, // Full circle as background
              valueColor: AlwaysStoppedAnimation<Color>(backgroundColor),
            ),
          ),
          // Circular progress indicator - needs SizedBox to control its size
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(effectiveColor),
            ),
          ),
          // McAfee logo in the center
          // Based on Figma: 24px total, logo should be approximately 9px wide (37.5% of total)
          if (showLogo)
            SizedBox(
              width:
                  size *
                  0.375, // Logo is 37.5% of loader size (9/24 ratio from design)
              height: size * 0.375, // Keep aspect ratio square
              child: McLogoIcon(size: size * 0.375, color: brandColor),
            ),
        ],
      ),
    );
  }
}

/// A loading overlay with McAfee branding
class McLoadingOverlay extends StatelessWidget {
  const McLoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.size = 48.0,
    this.brandColor = BrandColor.red,
    this.overlayColor,
    this.message,
    this.showLogo = true,
  });

  /// Whether to show the loading overlay
  final bool isLoading;

  /// The child widget to overlay
  final Widget child;

  /// Size of the loader
  final double size;

  /// Brand color of the loader (red or black)
  final BrandColor brandColor;

  /// Color of the overlay background
  final Color? overlayColor;

  /// Optional loading message
  final String? message;

  /// Whether to show the McAfee logo in the loader
  final bool showLogo;

  @override
  Widget build(BuildContext context) {
    final overlayBackground =
        overlayColor ?? Theme.of(context).colorScheme.scrim.withOpacity(0.5);
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: Container(
              color: overlayBackground,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    McLoader(
                      size: size,
                      brandColor: brandColor,
                      showLogo: showLogo,
                    ),
                    if (message != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        message!,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: textColor),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// McAfee branded loader with 3D spinning logo animation
///
/// Same as McLoader but with the logo spinning around the Y-axis.
/// Creates a 3D flip effect for enhanced visual interest.
class McAnimatedLoader extends StatefulWidget {
  const McAnimatedLoader({
    super.key,
    this.size = 48.0,
    this.brandColor = BrandColor.red,
    this.strokeWidth = 4.0,
    this.showLogo = true,
    this.animationDuration = const Duration(seconds: 2),
  });

  /// Size of the loader diameter (controls both circle and logo proportionally)
  final double size;

  /// Brand color of the loader (red or black)
  final BrandColor brandColor;

  /// Width of the circular stroke
  final double strokeWidth;

  /// Whether to show the McAfee logo in the center
  final bool showLogo;

  /// Duration for one complete rotation
  final Duration animationDuration;

  @override
  State<McAnimatedLoader> createState() => _McAnimatedLoaderState();
}

class _McAnimatedLoaderState extends State<McAnimatedLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use tokens for brand colors
    final Color effectiveColor;
    if (widget.brandColor == BrandColor.red) {
      effectiveColor = context.extendedColors.mcafeeRed;
    } else {
      // Black: uses onSurface which automatically adapts (black in light, white in dark)
      effectiveColor = Theme.of(context).colorScheme.onSurface;
    }

    final backgroundColor = Theme.of(context).colorScheme.outlineVariant;

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle (grey track using outlineVariant token)
          SizedBox(
            width: widget.size,
            height: widget.size,
            child: CircularProgressIndicator(
              strokeWidth: widget.strokeWidth,
              value: 1.0, // Full circle as background
              valueColor: AlwaysStoppedAnimation<Color>(backgroundColor),
            ),
          ),
          // Circular progress indicator
          SizedBox(
            width: widget.size,
            height: widget.size,
            child: CircularProgressIndicator(
              strokeWidth: widget.strokeWidth,
              valueColor: AlwaysStoppedAnimation<Color>(effectiveColor),
            ),
          ),
          // Animated McAfee logo in the center
          if (widget.showLogo)
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform:
                      Matrix4.identity()
                        ..setEntry(3, 2, 0.001) // Perspective
                        ..rotateY(
                          _animation.value * 2 * 3.14159,
                        ), // Full rotation
                  child: SizedBox(
                    width: widget.size * 0.375,
                    height: widget.size * 0.375,
                    child: McLogoIcon(
                      size: widget.size * 0.375,
                      color: widget.brandColor,
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
