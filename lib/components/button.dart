import 'package:flutter/material.dart';
import 'package:mc_flutter_tokens/mc_tokens.dart';

/// McAfee Button component
///
/// A simplified text button component that follows Material 3 design.
/// Text buttons are used for less-pronounced actions, such as "Learn More" or "Cancel".
class McButton extends StatelessWidget {
  const McButton({
    super.key,
    required this.label,
    this.onPressed,
    this.startIcon,
    this.endIcon,
  });

  /// The text label of the button
  final String label;

  /// Callback when the button is pressed
  final VoidCallback? onPressed;

  /// Optional icon to show before the label
  final Widget? startIcon;

  /// Optional icon to show after the label
  final Widget? endIcon;

  @override
  Widget build(BuildContext context) {
    final typographyTokens = context.typographyTokens;

    // Base style - remove hover background for link style
    final style = ButtonStyle(
      textStyle: WidgetStateProperty.all(typographyTokens.labelLarge),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 12),
      ),
    );

    // Build button content with icons
    if (startIcon != null && endIcon != null) {
      // Both icons
      return TextButton(
        onPressed: onPressed,
        style: style,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            startIcon!,
            const SizedBox(width: 8),
            Text(label),
            const SizedBox(width: 8),
            endIcon!,
          ],
        ),
      );
    } else if (startIcon != null) {
      // Only start icon
      return TextButton.icon(
        onPressed: onPressed,
        style: style,
        icon: startIcon!,
        label: Text(label),
      );
    } else if (endIcon != null) {
      // Only end icon
      return TextButton(
        onPressed: onPressed,
        style: style,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [Text(label), const SizedBox(width: 8), endIcon!],
        ),
      );
    } else {
      // No icons
      return TextButton(onPressed: onPressed, style: style, child: Text(label));
    }
  }
}
