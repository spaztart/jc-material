import 'package:flutter/material.dart';

enum BadgeSize { large, small }

/// Material 3 circular badge (dot) in two sizes.
/// Large: 16x16, Small: 8x8. Color from Theme.colorScheme.primary.
class McBadge extends StatelessWidget {
  final BadgeSize size;
  final Color? color;
  final Widget? icon;
  final String? badgeText;

  const McBadge({
    super.key,
    this.size = BadgeSize.large,
    this.color,
    this.icon,
    this.badgeText,
  });

  @override
  Widget build(BuildContext context) {
    final double diameter = size == BadgeSize.large ? 16.0 : 8.0;
    final Color badgeColor = color ?? Theme.of(context).colorScheme.error;

    // If icon and badgeText are provided, overlay badge with text on icon
    if (icon != null && badgeText != null && badgeText!.isNotEmpty) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          icon!,
          Positioned(
            right: -4,
            top: -4,
            child: Container(
              width: diameter,
              height: diameter,
              decoration: BoxDecoration(
                color: badgeColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                badgeText!,
                style: TextStyle(
                  fontSize: size == BadgeSize.large ? 10 : 8,
                  color: Theme.of(context).colorScheme.onError,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
    }

    // If only icon is provided, overlay plain badge
    if (icon != null) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          icon!,
          Positioned(
            right: -4,
            top: -4,
            child: Container(
              width: diameter,
              height: diameter,
              decoration: BoxDecoration(
                color: badgeColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      );
    }

    // If only badgeText is provided, show text inside badge
    if (badgeText != null && badgeText!.isNotEmpty) {
      return Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(color: badgeColor, shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Text(
          badgeText!,
          style: TextStyle(
            fontSize: size == BadgeSize.large ? 10 : 8,
            color: Theme.of(context).colorScheme.onError,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    // Default: just the badge
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(color: badgeColor, shape: BoxShape.circle),
    );
  }
}
