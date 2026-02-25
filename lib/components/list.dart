import 'package:flutter/material.dart';

/// A list container component with Material 3 styling.
///
/// Lists are continuous, vertical indexes of text or images.
/// This component implements the Material 3 List specifications.
class McList extends StatelessWidget {
  const McList({
    super.key,
    required this.children,
    this.padding,
    this.showDividers = true,
    this.dividerIndent = 16.0,
    this.dividerEndIndent = 16.0,
  });

  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final bool showDividers;
  final double dividerIndent;
  final double dividerEndIndent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final items = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      items.add(children[i]);
      if (showDividers && i < children.length - 1) {
        items.add(
          Divider(
            height: 1,
            thickness: 1,
            color: colorScheme.outlineVariant,
            indent: dividerIndent,
            endIndent: dividerEndIndent,
          ),
        );
      }
    }

    return Container(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: items,
      ),
    );
  }
}

/// Material 3 List Item component.
///
/// List items support one-line, two-line, and three-line configurations
/// with optional leading and trailing elements.
///
/// Layout: [Leading] [Headline + Supporting Text + Overline] [Trailing]
///
/// Heights:
/// - One-line: 56dp (with leading icon)
/// - Two-line: 72dp
/// - Three-line: 88dp
class McListItem extends StatelessWidget {
  const McListItem({
    super.key,
    required this.headline,
    this.supportingText,
    this.overline,
    this.leading,
    this.trailing,
    this.onTap,
    this.enabled = true,
    this.selected = false,
    this.dense = false,
  });

  /// Primary text (required)
  final String headline;

  /// Secondary text (optional) - creates two-line or three-line list item
  final String? supportingText;

  /// Small text above headline (optional) - creates three-line list item
  final String? overline;

  /// Leading widget (icon, image, checkbox, radio, avatar, etc.)
  final Widget? leading;

  /// Trailing widget (icon, text, switch, checkbox, etc.)
  final Widget? trailing;

  /// Callback when list item is tapped
  final VoidCallback? onTap;

  /// Whether the list item is enabled
  final bool enabled;

  /// Whether the list item is selected
  final bool selected;

  /// Whether to use dense layout (reduced padding)
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    // Determine minimum height based on content
    final hasOverline = overline != null;
    final hasSupportingText = supportingText != null;
    final minHeight = _getMinHeight(hasOverline, hasSupportingText);

    // Vertical padding
    final verticalPadding =
        dense
            ? 8.0
            : (hasOverline || hasSupportingText)
            ? 12.0
            : 8.0;

    return Material(
      color:
          selected ? colorScheme.surfaceContainerHighest : colorScheme.surface,
      child: InkWell(
        onTap: enabled ? onTap : null,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: minHeight),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: verticalPadding,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Leading element
                if (leading != null) ...[leading!, const SizedBox(width: 16)],

                // Text content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Overline
                      if (overline != null) ...[
                        Text(
                          overline!,
                          style: textTheme.labelSmall?.copyWith(
                            color:
                                enabled
                                    ? colorScheme.onSurfaceVariant
                                    : colorScheme.onSurface.withOpacity(0.38),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                      ],

                      // Headline
                      Text(
                        headline,
                        style: textTheme.bodyLarge?.copyWith(
                          color:
                              enabled
                                  ? (selected
                                      ? colorScheme.onSurface
                                      : colorScheme.onSurface)
                                  : colorScheme.onSurface.withOpacity(0.38),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // Supporting text
                      if (supportingText != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          supportingText!,
                          style: textTheme.bodyMedium?.copyWith(
                            color:
                                enabled
                                    ? colorScheme.onSurfaceVariant
                                    : colorScheme.onSurface.withOpacity(0.38),
                          ),
                          maxLines: hasOverline ? 1 : 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),

                // Trailing element
                if (trailing != null) ...[const SizedBox(width: 16), trailing!],
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _getMinHeight(bool hasOverline, bool hasSupportingText) {
    if (dense) {
      return hasOverline || hasSupportingText ? 64.0 : 48.0;
    }
    if (hasOverline) {
      return 88.0; // Three-line
    } else if (hasSupportingText) {
      return 72.0; // Two-line
    } else {
      return 56.0; // One-line
    }
  }
}

/// A convenience widget for list items with an icon as the leading element
class McListItemWithIcon extends StatelessWidget {
  const McListItemWithIcon({
    super.key,
    required this.headline,
    required this.icon,
    this.supportingText,
    this.overline,
    this.trailing,
    this.onTap,
    this.enabled = true,
    this.selected = false,
    this.dense = false,
    this.iconSize = 24.0,
  });

  final String headline;
  final IconData icon;
  final String? supportingText;
  final String? overline;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool enabled;
  final bool selected;
  final bool dense;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return McListItem(
      headline: headline,
      supportingText: supportingText,
      overline: overline,
      leading: Icon(
        icon,
        size: iconSize,
        color:
            enabled
                ? colorScheme.onSurfaceVariant
                : colorScheme.onSurface.withOpacity(0.38),
      ),
      trailing: trailing,
      onTap: onTap,
      enabled: enabled,
      selected: selected,
      dense: dense,
    );
  }
}

/// A convenience widget for list items with a trailing icon
class McListItemWithTrailingIcon extends StatelessWidget {
  const McListItemWithTrailingIcon({
    super.key,
    required this.headline,
    this.supportingText,
    this.overline,
    this.leading,
    this.trailingIcon = Icons.chevron_right,
    this.onTap,
    this.enabled = true,
    this.selected = false,
    this.dense = false,
    this.trailingIconSize = 24.0,
  });

  final String headline;
  final String? supportingText;
  final String? overline;
  final Widget? leading;
  final IconData trailingIcon;
  final VoidCallback? onTap;
  final bool enabled;
  final bool selected;
  final bool dense;
  final double trailingIconSize;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return McListItem(
      headline: headline,
      supportingText: supportingText,
      overline: overline,
      leading: leading,
      trailing: Icon(
        trailingIcon,
        size: trailingIconSize,
        color:
            enabled
                ? colorScheme.onSurfaceVariant
                : colorScheme.onSurface.withOpacity(0.38),
      ),
      onTap: onTap,
      enabled: enabled,
      selected: selected,
      dense: dense,
    );
  }
}
