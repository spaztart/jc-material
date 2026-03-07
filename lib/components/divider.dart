import 'package:flutter/material.dart';

/// A simple horizontal divider component that follows Material 3 design.
/// Uses theme's outlineVariant color by default.
class McDivider extends StatelessWidget {
  const McDivider({
    super.key,
    this.thickness,
    this.height,
    this.indent,
    this.endIndent,
  });

  /// The thickness of the line drawn within the divider.
  final double? thickness;

  /// The divider's height extent (includes the line and spacing around it).
  final double? height;

  /// The amount of empty space to the leading edge of the divider.
  final double? indent;

  /// The amount of empty space to the trailing edge of the divider.
  final double? endIndent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Divider(
      thickness: thickness ?? 1.0,
      height: height ?? 1.0,
      color: colorScheme.outlineVariant,
      indent: indent,
      endIndent: endIndent,
    );
  }
}
