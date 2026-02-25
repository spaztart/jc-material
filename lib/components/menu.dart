import 'package:flutter/material.dart';
import 'package:mc_flutter_tokens/mc_tokens.dart';

/// A Material 3 Menu component.
///
/// Menus display a list of choices on a temporary surface. They appear when users
/// interact with a button, action, or other control.
class McMenu extends StatelessWidget {
  /// Creates a menu.
  const McMenu({
    super.key,
    required this.children,
    this.elevation = 2,
    this.minWidth = 112,
  });

  /// The menu items to display.
  final List<Widget> children;

  /// The elevation of the menu surface.
  final double elevation;

  /// The minimum width of the menu.
  final double minWidth;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(
        context.spacingTokens.cornerExtraSmall,
      ),
      color: colorScheme.surfaceContainer,
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: minWidth),
        child: IntrinsicWidth(
          child: Column(mainAxisSize: MainAxisSize.min, children: children),
        ),
      ),
    );
  }
}

/// A Material 3 Menu Item component.
///
/// Menu items are interactive list items that appear in menus and submenus.
/// They have a fixed height of 48dp and use 12dp horizontal padding.
class McMenuItem extends StatelessWidget {
  /// Creates a menu item.
  const McMenuItem({
    super.key,
    required this.label,
    this.trailing,
    this.onTap,
    this.enabled = true,
    this.selected = false,
  });

  /// The primary text label for the menu item.
  final String label;

  /// Optional trailing widget (e.g., keyboard shortcut or submenu indicator).
  final Widget? trailing;

  /// Called when the menu item is tapped.
  final VoidCallback? onTap;

  /// Whether the menu item is enabled for interaction.
  final bool enabled;

  /// Whether the menu item is in a selected state.
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: selected ? colorScheme.secondaryContainer : Colors.transparent,
      child: InkWell(
        onTap: enabled ? onTap : null,
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: textTheme.bodyLarge?.copyWith(
                    color:
                        enabled
                            ? (selected
                                ? colorScheme.onSecondaryContainer
                                : colorScheme.onSurface)
                            : colorScheme.onSurface.withOpacity(0.38),
                  ),
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 12),
                DefaultTextStyle(
                  style:
                      textTheme.bodySmall?.copyWith(
                        color:
                            enabled
                                ? (selected
                                    ? colorScheme.onSecondaryContainer
                                    : colorScheme.onSurfaceVariant)
                                : colorScheme.onSurface.withOpacity(0.38),
                      ) ??
                      const TextStyle(),
                  child: trailing!,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// A Material 3 Menu Item with a leading icon.
///
/// This is a convenience widget that combines [McMenuItem] with a leading icon.
class McMenuItemWithIcon extends StatelessWidget {
  /// Creates a menu item with a leading icon.
  const McMenuItemWithIcon({
    super.key,
    required this.label,
    required this.icon,
    this.trailing,
    this.onTap,
    this.enabled = true,
    this.selected = false,
  });

  /// The primary text label for the menu item.
  final String label;

  /// The icon to display before the label.
  final IconData icon;

  /// Optional trailing widget (e.g., keyboard shortcut or submenu indicator).
  final Widget? trailing;

  /// Called when the menu item is tapped.
  final VoidCallback? onTap;

  /// Whether the menu item is enabled for interaction.
  final bool enabled;

  /// Whether the menu item is in a selected state.
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: selected ? colorScheme.secondaryContainer : Colors.transparent,
      child: InkWell(
        onTap: enabled ? onTap : null,
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color:
                    enabled
                        ? (selected
                            ? colorScheme.onSecondaryContainer
                            : colorScheme.onSurfaceVariant)
                        : colorScheme.onSurface.withOpacity(0.38),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: textTheme.bodyLarge?.copyWith(
                    color:
                        enabled
                            ? (selected
                                ? colorScheme.onSecondaryContainer
                                : colorScheme.onSurface)
                            : colorScheme.onSurface.withOpacity(0.38),
                  ),
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 12),
                DefaultTextStyle(
                  style:
                      textTheme.bodySmall?.copyWith(
                        color:
                            enabled
                                ? (selected
                                    ? colorScheme.onSecondaryContainer
                                    : colorScheme.onSurfaceVariant)
                                : colorScheme.onSurface.withOpacity(0.38),
                      ) ??
                      const TextStyle(),
                  child: trailing!,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
