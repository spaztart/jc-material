import 'package:flutter/material.dart';

/// McAfee List Chip component
///
/// List chips display a numeric value with an action description.
/// They are useful for showing counts with contextual information,
/// such as "21 actions taken in the past 7 days".
///
/// The chip supports optional leading/trailing icons and an optional
/// delete button (shown when onDeleted is provided).
///
/// Example usage:
/// ```dart
/// McListChip(
///   count: 21,
///   action: 'actions taken in the past 7 days',
/// )
/// ```
class McListChip extends StatelessWidget {
  const McListChip({
    super.key,
    required this.count,
    required this.action,
    this.isEnabled = true,
    this.onPressed,
    this.onDeleted,
    this.leadingIcon,
    this.trailingIcon,
    this.deleteIcon,
    this.padding,
    this.tooltip,
  });

  /// The numeric count to display
  final int count;

  /// The action text to display after the count
  final String action;

  /// Whether the chip is enabled for interaction
  final bool isEnabled;

  /// Callback when the chip is pressed
  final VoidCallback? onPressed;

  /// Callback when the delete button is pressed
  /// If null, the delete button will not be shown
  final VoidCallback? onDeleted;

  /// Optional icon to display before the text
  final Widget? leadingIcon;

  /// Optional icon to display after the text (before delete button)
  final Widget? trailingIcon;

  /// Custom delete icon (defaults to Icons.close)
  final Widget? deleteIcon;

  /// Internal padding of the chip
  final EdgeInsets? padding;

  /// Tooltip message to display on hover
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // List chip uses secondary color for both border and text
    final chipColor = colorScheme.secondary;
    final disabledColor = colorScheme.onSurface.withValues(alpha: 0.38);

    final effectiveColor = isEnabled ? chipColor : disabledColor;

    // Build leading icon with proper color
    Widget? effectiveLeadingIcon;
    if (leadingIcon != null) {
      effectiveLeadingIcon = IconTheme(
        data: IconThemeData(color: effectiveColor, size: 18),
        child: leadingIcon!,
      );
    }

    // Build trailing icon with proper color
    Widget? effectiveTrailingIcon;
    if (trailingIcon != null) {
      effectiveTrailingIcon = IconTheme(
        data: IconThemeData(color: effectiveColor, size: 18),
        child: trailingIcon!,
      );
    }

    final chipContent = Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (effectiveLeadingIcon != null) ...[
            effectiveLeadingIcon,
            const SizedBox(width: 8),
          ],
          Text(
            '$count $action',
            style: TextStyle(
              color: effectiveColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (effectiveTrailingIcon != null) ...[
            const SizedBox(width: 8),
            effectiveTrailingIcon,
          ],
          if (onDeleted != null) ...[
            const SizedBox(width: 4),
            IconButton(
              onPressed: isEnabled ? onDeleted : null,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
              visualDensity: VisualDensity.compact,
              tooltip: 'Delete',
              icon:
                  deleteIcon ??
                  Icon(Icons.close, size: 18, color: effectiveColor),
            ),
          ],
        ],
      ),
    );

    final chipWidget = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onPressed : null,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: effectiveColor),
          ),
          child: chipContent,
        ),
      ),
    );

    if (tooltip != null) {
      return Tooltip(message: tooltip!, child: chipWidget);
    }

    return chipWidget;
  }
}
