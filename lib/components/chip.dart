import 'package:flutter/material.dart';
import 'package:mc_flutter_tokens/mc_tokens.dart';

/// Defines the different types of chips
enum ChipType { input, assistive, filter, suggestion }

/// Defines the visual style of chips
enum ChipStyle { outlined, elevated, filled }

/// Defines chip sizes
enum ChipSize { standard, pill }

/// Defines predefined color themes for chips
enum ChipKind {
  /// Default theme - uses default Material colors
  none,

  /// Safe status - dark green background (#006B55)
  safe,

  /// In progress status - light blue surface
  inProgress,

  /// Resolved status - light mint background (#EBFFF8)
  resolved,

  /// Warning/Issue status - orange theme
  warning,

  /// Critical/Danger status - red/pink theme
  danger,

  /// Dismissed status - gray with opacity
  dismissed,
}

class McChip extends StatelessWidget {
  const McChip({
    super.key,
    required this.label,
    this.type = ChipType.suggestion,
    this.style = ChipStyle.outlined,
    this.size = ChipSize.standard,
    this.kind = ChipKind.none,
    this.isSelected = false,
    this.isEnabled = true,
    this.onPressed,
    this.onDeleted,
    this.onSelected,
    this.leadingIcon,
    this.trailingIcon,
    this.avatar,
    this.deleteIcon,
    this.backgroundColor,
    this.selectedColor,
    this.foregroundColor,
    this.borderColor,
    this.elevation,
    this.padding,
    this.labelStyle,
    this.tooltip,
  });

  final String label;
  final ChipType type;
  final ChipStyle style;
  final ChipSize size;
  final ChipKind kind;
  final bool isSelected;
  final bool isEnabled;
  final VoidCallback? onPressed;
  final VoidCallback? onDeleted;
  final ValueChanged<bool>? onSelected;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final Widget? avatar;
  final Widget? deleteIcon;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? elevation;
  final EdgeInsets? padding;
  final TextStyle? labelStyle;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final extendedColors = context.extendedColors;
    final isDark = theme.brightness == Brightness.dark;

    // Apply kind-based colors if kind is not none
    Color? effectiveBackgroundColor = backgroundColor;
    Color? effectiveForegroundColor = foregroundColor;
    Color? effectiveBorderColor = borderColor;

    // Get default icon based on kind if no leadingIcon is provided
    Widget? defaultLeadingIcon;
    if (leadingIcon == null && avatar == null) {
      switch (kind) {
        case ChipKind.safe:
          defaultLeadingIcon = const Icon(Icons.check_circle, size: 18);
          break;
        case ChipKind.inProgress:
          defaultLeadingIcon = const Icon(Icons.access_time, size: 18);
          break;
        case ChipKind.resolved:
          defaultLeadingIcon = const Icon(Icons.check_circle, size: 18);
          break;
        case ChipKind.warning:
          defaultLeadingIcon = const Icon(Icons.info_outline, size: 18);
          break;
        case ChipKind.danger:
          defaultLeadingIcon = const Icon(Icons.error_outline, size: 18);
          break;
        case ChipKind.dismissed:
          defaultLeadingIcon = const Icon(Icons.arrow_forward, size: 18);
          break;
        case ChipKind.none:
          break;
      }
    }

    // Use provided leadingIcon or default based on kind
    final Widget? effectiveLeadingIcon = leadingIcon ?? defaultLeadingIcon;

    if (kind != ChipKind.none) {
      switch (kind) {
        case ChipKind.safe:
          effectiveBackgroundColor ??= extendedColors.positive;
          effectiveForegroundColor ??= extendedColors.onPositive;
          if (style != ChipStyle.filled) {
            effectiveBorderColor ??= colorScheme.surfaceContainerHighest;
          }
          break;
        case ChipKind.inProgress:
          effectiveBackgroundColor ??= colorScheme.surfaceContainerHigh;
          effectiveForegroundColor ??= colorScheme.primary;
          if (style != ChipStyle.filled) {
            effectiveBorderColor ??= colorScheme.surfaceContainerHighest;
          }
          break;
        case ChipKind.resolved:
          effectiveBackgroundColor ??= extendedColors.positiveContainer;
          effectiveForegroundColor ??= extendedColors.positive;
          if (style != ChipStyle.filled) {
            effectiveBorderColor ??= colorScheme.surfaceContainerHighest;
          }
          break;
        case ChipKind.warning:
          effectiveBackgroundColor ??= extendedColors.warningContainer;
          effectiveForegroundColor ??= extendedColors.warning;
          if (style != ChipStyle.filled) {
            effectiveBorderColor ??= colorScheme.surfaceContainerHighest;
          }
          break;
        case ChipKind.danger:
          // Light mode: light pink bg with dark red text
          // Dark mode: dark red bg with light pink text
          if (isDark) {
            effectiveBackgroundColor ??= colorScheme.errorContainer;
            effectiveForegroundColor ??= colorScheme.onErrorContainer;
          } else {
            effectiveBackgroundColor ??= colorScheme.onErrorContainer;
            effectiveForegroundColor ??= colorScheme.error;
          }
          if (style != ChipStyle.filled) {
            effectiveBorderColor ??= colorScheme.surfaceContainerHighest;
          }
          break;
        case ChipKind.dismissed:
          effectiveBackgroundColor ??= colorScheme.surfaceContainerLowest;
          effectiveForegroundColor ??= colorScheme.onSurface.withOpacity(0.38);
          if (style != ChipStyle.filled) {
            effectiveBorderColor ??= colorScheme.surfaceContainerHighest;
          }
          break;
        case ChipKind.none:
          // For filled style with no kind, use transparent border
          if (style == ChipStyle.filled) {
            effectiveBorderColor ??= colorScheme.surfaceContainerHighest;
          }
          break;
      }
    }

    // For pill size, use custom implementation
    if (size == ChipSize.pill) {
      return _buildPillChip(
        context,
        theme,
        colorScheme,
        effectiveBackgroundColor,
        effectiveForegroundColor,
        effectiveBorderColor,
        effectiveLeadingIcon,
      );
    }

    // Determine if this chip should show as selected
    final effectiveSelected = isSelected;

    Widget chipWidget;

    switch (type) {
      case ChipType.input:
        chipWidget = _buildInputChip(
          context,
          theme,
          colorScheme,
          effectiveSelected,
          effectiveBackgroundColor,
          effectiveForegroundColor,
          effectiveBorderColor,
          effectiveLeadingIcon,
        );
        break;
      case ChipType.assistive:
        chipWidget = _buildAssistiveChip(
          context,
          theme,
          colorScheme,
          effectiveBackgroundColor,
          effectiveForegroundColor,
          effectiveBorderColor,
          effectiveLeadingIcon,
        );
        break;
      case ChipType.filter:
        chipWidget = _buildFilterChip(
          context,
          theme,
          colorScheme,
          effectiveSelected,
          effectiveBackgroundColor,
          effectiveForegroundColor,
          effectiveBorderColor,
          effectiveLeadingIcon,
        );
        break;
      case ChipType.suggestion:
        chipWidget = _buildSuggestionChip(
          context,
          theme,
          colorScheme,
          effectiveBackgroundColor,
          effectiveForegroundColor,
          effectiveBorderColor,
          effectiveLeadingIcon,
        );
        break;
    }

    if (tooltip != null) {
      return Tooltip(message: tooltip!, child: chipWidget);
    }

    return chipWidget;
  }

  // Pill chip implementation for circular chips
  Widget _buildPillChip(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    Color? bgColor,
    Color? fgColor,
    Color? bColor,
    Widget? effectiveLeadingIcon,
  ) {
    final effectiveSelected = isSelected;

    return Material(
      elevation: _getElevation() ?? 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          context.spacingTokens.cornerExtraLarge,
        ),
        side:
            _getBorderSide(colorScheme, effectiveSelected, bColor) ??
            BorderSide.none,
      ),
      color: _getBackgroundColor(colorScheme, effectiveSelected, bgColor),
      child: InkWell(
        onTap:
            isEnabled
                ? () {
                  if (type == ChipType.filter && onSelected != null) {
                    onSelected!(!effectiveSelected);
                  } else if (onPressed != null) {
                    onPressed!();
                  }
                }
                : null,
        borderRadius: BorderRadius.circular(
          context.spacingTokens.cornerExtraLarge,
        ),
        child: Container(
          padding:
              padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (avatar != null) ...[
                SizedBox(
                  width: 20,
                  height: 20,
                  child:
                      fgColor != null
                          ? IconTheme(
                            data: IconThemeData(color: fgColor),
                            child: avatar!,
                          )
                          : avatar,
                ),
                const SizedBox(width: 6),
              ] else if (effectiveLeadingIcon != null) ...[
                SizedBox(
                  width: 16,
                  height: 16,
                  child:
                      fgColor != null
                          ? IconTheme(
                            data: IconThemeData(color: fgColor),
                            child: effectiveLeadingIcon,
                          )
                          : effectiveLeadingIcon,
                ),
                const SizedBox(width: 6),
              ] else if (type == ChipType.filter && effectiveSelected) ...[
                Icon(
                  Icons.check,
                  size: 16,
                  color: fgColor ?? colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 6),
              ],
              Text(
                label,
                style: _getLabelStyle(
                  theme,
                  colorScheme,
                  effectiveSelected,
                  fgColor,
                )?.copyWith(fontSize: 12),
              ),
              if (trailingIcon != null) ...[
                const SizedBox(width: 4),
                SizedBox(
                  width: 16,
                  height: 16,
                  child:
                      fgColor != null
                          ? IconTheme(
                            data: IconThemeData(color: fgColor),
                            child: trailingIcon!,
                          )
                          : trailingIcon,
                ),
              ],
              if (type == ChipType.input && onDeleted != null) ...[
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: onDeleted,
                  child: Icon(
                    Icons.close,
                    size: 14,
                    color: fgColor ?? colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputChip(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    bool selected,
    Color? bgColor,
    Color? fgColor,
    Color? bColor,
    Widget? effectiveLeadingIcon,
  ) {
    final effectiveColor = fgColor ?? foregroundColor;
    Widget? effectiveAvatar = avatar ?? effectiveLeadingIcon;

    // Wrap avatar/leadingIcon in IconTheme if we have a foreground color
    if (effectiveAvatar != null && effectiveColor != null) {
      effectiveAvatar = IconTheme(
        data: IconThemeData(color: effectiveColor),
        child: effectiveAvatar,
      );
    }

    final finalBgColor = _getBackgroundColor(colorScheme, selected, bgColor);
    final borderSide = _getBorderSide(colorScheme, selected, bColor);

    final chipContent = Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (effectiveAvatar != null) ...[
            effectiveAvatar,
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: _getLabelStyle(theme, colorScheme, selected, fgColor),
          ),
          if (trailingIcon != null) ...[
            const SizedBox(width: 4),
            if (effectiveColor != null)
              IconTheme(
                data: IconThemeData(color: effectiveColor),
                child: trailingIcon!,
              )
            else
              trailingIcon!,
          ],
          if (onDeleted != null) ...[
            const SizedBox(width: 4),
            GestureDetector(
              onTap: onDeleted,
              child:
                  deleteIcon ??
                  Icon(Icons.close, size: 18, color: effectiveColor),
            ),
          ],
        ],
      ),
    );

    // Force background color with Container and InkWell for interactivity
    // This is necessary because Material 3's InputChip ignores backgroundColor parameter
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onPressed : null,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            color: finalBgColor,
            borderRadius: BorderRadius.circular(8),
            // Only add border if BorderSide is not null and not BorderSide.none
            border:
                borderSide != null && borderSide != BorderSide.none
                    ? Border.all(
                      color: borderSide.color,
                      width: borderSide.width,
                    )
                    : null,
          ),
          child: chipContent,
        ),
      ),
    );
  }

  Widget _buildAssistiveChip(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    Color? bgColor,
    Color? fgColor,
    Color? bColor,
    Widget? effectiveLeadingIcon,
  ) {
    final effectiveColor = fgColor ?? foregroundColor;
    Widget? effectiveAvatar = avatar ?? effectiveLeadingIcon;

    // Wrap avatar/leadingIcon in IconTheme if we have a foreground color
    if (effectiveAvatar != null && effectiveColor != null) {
      effectiveAvatar = IconTheme(
        data: IconThemeData(color: effectiveColor),
        child: effectiveAvatar,
      );
    }

    final finalBgColor = _getBackgroundColor(colorScheme, false, bgColor);
    final borderSide = _getBorderSide(colorScheme, false, bColor);

    final chipContent = Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (effectiveAvatar != null) ...[
            effectiveAvatar,
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: _getLabelStyle(theme, colorScheme, false, fgColor),
          ),
          if (trailingIcon != null) ...[
            const SizedBox(width: 4),
            if (effectiveColor != null)
              IconTheme(
                data: IconThemeData(color: effectiveColor),
                child: trailingIcon!,
              )
            else
              trailingIcon!,
          ],
        ],
      ),
    );

    // Force background color with Container and InkWell for interactivity
    // This is necessary because Material 3's ActionChip ignores backgroundColor parameter
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onPressed : null,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            color: finalBgColor,
            borderRadius: BorderRadius.circular(8),
            // Only add border if BorderSide is not null and not BorderSide.none
            border:
                borderSide != null && borderSide != BorderSide.none
                    ? Border.all(
                      color: borderSide.color,
                      width: borderSide.width,
                    )
                    : null,
          ),
          child: chipContent,
        ),
      ),
    );
  }

  Widget _buildFilterChip(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    bool selected,
    Color? bgColor,
    Color? fgColor,
    Color? bColor,
    Widget? effectiveLeadingIcon,
  ) {
    final effectiveColor = fgColor ?? foregroundColor;
    Widget? effectiveAvatar = avatar ?? effectiveLeadingIcon;

    // Wrap avatar/leadingIcon in IconTheme if we have a foreground color
    if (effectiveAvatar != null && effectiveColor != null) {
      effectiveAvatar = IconTheme(
        data: IconThemeData(color: effectiveColor, size: 18),
        child: effectiveAvatar,
      );
    }

    final labelWidget = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label),
        if (trailingIcon != null) ...[
          const SizedBox(width: 4),
          if (effectiveColor != null)
            IconTheme(
              data: IconThemeData(color: effectiveColor, size: 18),
              child: trailingIcon!,
            )
          else
            trailingIcon!,
        ],
      ],
    );

    // Use elevated variant for elevated style
    if (style == ChipStyle.elevated) {
      return FilterChip.elevated(
        label: labelWidget,
        avatar: effectiveAvatar,
        onSelected: isEnabled ? onSelected : null,
        selected: selected,
        backgroundColor: bgColor ?? backgroundColor,
        selectedColor: selectedColor ?? colorScheme.primaryContainer,
        disabledColor: colorScheme.onSurface.withOpacity(0.12),
        side: bColor != null ? BorderSide(color: bColor) : null,
        elevation: elevation,
        padding: padding,
        labelStyle: _getLabelStyle(theme, colorScheme, selected, fgColor),
        showCheckmark: effectiveLeadingIcon == null && avatar == null,
        checkmarkColor:
            effectiveColor ??
            (selected ? colorScheme.onPrimaryContainer : null),
      );
    }

    // Default flat variant
    return FilterChip(
      label: labelWidget,
      avatar: effectiveAvatar,
      onSelected: isEnabled ? onSelected : null,
      selected: selected,
      backgroundColor: _getBackgroundColor(colorScheme, selected, bgColor),
      selectedColor: selectedColor ?? colorScheme.primaryContainer,
      disabledColor: colorScheme.onSurface.withOpacity(0.12),
      side: _getBorderSide(colorScheme, selected, bColor),
      elevation: _getElevation(),
      padding: padding,
      labelStyle: _getLabelStyle(theme, colorScheme, selected, fgColor),
      showCheckmark: effectiveLeadingIcon == null && avatar == null,
      checkmarkColor:
          effectiveColor ?? (selected ? colorScheme.onPrimaryContainer : null),
    );
  }

  Widget _buildSuggestionChip(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
    Color? bgColor,
    Color? fgColor,
    Color? bColor,
    Widget? effectiveLeadingIcon,
  ) {
    final effectiveColor = fgColor ?? foregroundColor;
    Widget? effectiveAvatar = avatar ?? effectiveLeadingIcon;

    // Wrap avatar/leadingIcon in IconTheme if we have a foreground color
    if (effectiveAvatar != null && effectiveColor != null) {
      effectiveAvatar = IconTheme(
        data: IconThemeData(color: effectiveColor),
        child: effectiveAvatar,
      );
    }

    if (style == ChipStyle.elevated) {
      return ActionChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label),
            if (trailingIcon != null) ...[
              const SizedBox(width: 4),
              if (effectiveColor != null)
                IconTheme(
                  data: IconThemeData(color: effectiveColor),
                  child: trailingIcon!,
                )
              else
                trailingIcon!,
            ],
          ],
        ),
        avatar: effectiveAvatar,
        onPressed: isEnabled ? onPressed : null,
        backgroundColor: _getBackgroundColor(colorScheme, false, bgColor),
        disabledColor: colorScheme.onSurface.withOpacity(0.12),
        elevation: _getElevation(),
        padding: padding,
        labelStyle: _getLabelStyle(theme, colorScheme, false, fgColor),
        side: BorderSide.none,
      );
    }

    return ActionChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          if (trailingIcon != null) ...[
            const SizedBox(width: 4),
            if (effectiveColor != null)
              IconTheme(
                data: IconThemeData(color: effectiveColor),
                child: trailingIcon!,
              )
            else
              trailingIcon!,
          ],
        ],
      ),
      avatar: effectiveAvatar,
      onPressed: isEnabled ? onPressed : null,
      backgroundColor: _getBackgroundColor(colorScheme, false, bgColor),
      disabledColor: colorScheme.onSurface.withOpacity(0.12),
      side: _getBorderSide(colorScheme, false, bColor),
      elevation: 0,
      padding: padding,
      labelStyle: _getLabelStyle(theme, colorScheme, false, fgColor),
    );
  }

  Color? _getBackgroundColor(
    ColorScheme colorScheme,
    bool selected, [
    Color? effectiveBg,
  ]) {
    if (effectiveBg != null) return effectiveBg;
    if (backgroundColor != null) return backgroundColor;

    if (selected) {
      return selectedColor ?? colorScheme.primaryContainer;
    }

    switch (style) {
      case ChipStyle.outlined:
        return Colors.transparent;
      case ChipStyle.elevated:
        return colorScheme.surfaceContainerLow;
      case ChipStyle.filled:
        return colorScheme.surfaceContainerHighest;
    }
  }

  BorderSide? _getBorderSide(
    ColorScheme colorScheme,
    bool selected, [
    Color? effectiveBorder,
  ]) {
    if (style == ChipStyle.elevated) return BorderSide.none;

    // For filled style, no border unless explicitly set
    if (style == ChipStyle.filled &&
        effectiveBorder == null &&
        borderColor == null) {
      return BorderSide.none;
    }

    // Material 3 spec for filter chips:
    // - Unselected uses outline
    // - Selected uses transparent border (background shows through)
    if (type == ChipType.filter) {
      if (selected) {
        return const BorderSide(color: Colors.transparent);
      }
      Color borderColorValue =
          effectiveBorder ?? borderColor ?? colorScheme.outline;
      return BorderSide(color: borderColorValue);
    }

    // For other chip types
    Color borderColorValue =
        effectiveBorder ?? borderColor ?? colorScheme.outline;
    if (selected) {
      borderColorValue = selectedColor ?? colorScheme.primary;
    }

    // Return no border if the border color is transparent
    if (borderColorValue == Colors.transparent) {
      return BorderSide.none;
    }

    return BorderSide(color: borderColorValue);
  }

  double? _getElevation() {
    if (elevation != null) return elevation;

    switch (style) {
      case ChipStyle.elevated:
        return 1.0;
      case ChipStyle.outlined:
      case ChipStyle.filled:
        return 0.0;
    }
  }

  TextStyle? _getLabelStyle(
    ThemeData theme,
    ColorScheme colorScheme,
    bool selected, [
    Color? effectiveFg,
  ]) {
    if (labelStyle != null) return labelStyle;

    Color textColor = effectiveFg ?? foregroundColor ?? colorScheme.onSurface;
    if (selected) {
      textColor =
          effectiveFg ?? foregroundColor ?? colorScheme.onPrimaryContainer;
    }

    return theme.textTheme.labelLarge?.copyWith(
      color: textColor,
      fontWeight: FontWeight.w500,
    );
  }
}

// Helper widget for creating chip groups
class ChipGroup extends StatelessWidget {
  const ChipGroup({
    super.key,
    required this.chips,
    this.spacing = 8.0,
    this.runSpacing = 8.0,
    this.alignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.center,
  });

  final List<Widget> chips;
  final double spacing;
  final double runSpacing;
  final WrapAlignment alignment;
  final WrapCrossAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      alignment: alignment,
      crossAxisAlignment: crossAxisAlignment,
      children: chips,
    );
  }
}

// Convenience constructors for different chip types
class InputChipWidget extends McChip {
  const InputChipWidget({
    super.key,
    required super.label,
    super.onPressed,
    super.onDeleted,
    super.avatar,
    super.leadingIcon,
    super.deleteIcon,
    super.size = ChipSize.standard,
    super.isSelected = false,
    super.isEnabled = true,
    super.backgroundColor,
    super.selectedColor,
    super.foregroundColor,
    super.borderColor,
    super.padding,
    super.labelStyle,
    super.tooltip,
  }) : super(type: ChipType.input);
}

class AssistiveChipWidget extends McChip {
  const AssistiveChipWidget({
    super.key,
    required super.label,
    super.onPressed,
    super.leadingIcon,
    super.avatar,
    super.style = ChipStyle.outlined,
    super.size = ChipSize.standard,
    super.isEnabled = true,
    super.backgroundColor,
    super.foregroundColor,
    super.borderColor,
    super.elevation,
    super.padding,
    super.labelStyle,
    super.tooltip,
  }) : super(type: ChipType.assistive);
}

class FilterChipWidget extends McChip {
  const FilterChipWidget({
    super.key,
    required super.label,
    super.onSelected,
    super.leadingIcon,
    super.trailingIcon,
    super.avatar,
    super.size = ChipSize.standard,
    super.isSelected = false,
    super.isEnabled = true,
    super.backgroundColor,
    super.selectedColor,
    super.foregroundColor,
    super.borderColor,
    super.elevation,
    super.padding,
    super.labelStyle,
    super.tooltip,
  }) : super(type: ChipType.filter);
}

class SuggestionChipWidget extends McChip {
  const SuggestionChipWidget({
    super.key,
    required super.label,
    super.onPressed,
    super.leadingIcon,
    super.avatar,
    super.style = ChipStyle.outlined,
    super.size = ChipSize.standard,
    super.isEnabled = true,
    super.backgroundColor,
    super.foregroundColor,
    super.borderColor,
    super.elevation,
    super.padding,
    super.labelStyle,
    super.tooltip,
  }) : super(type: ChipType.suggestion);
}

// Convenience constructor for pill/circular chips
class PillChip extends McChip {
  const PillChip({
    super.key,
    required super.label,
    super.type = ChipType.suggestion,
    super.style = ChipStyle.filled,
    super.onPressed,
    super.onSelected,
    super.onDeleted,
    super.leadingIcon,
    super.trailingIcon,
    super.avatar,
    super.isSelected = false,
    super.isEnabled = true,
    super.backgroundColor,
    super.selectedColor,
    super.foregroundColor,
    super.borderColor,
    super.elevation,
    super.padding,
    super.labelStyle,
    super.tooltip,
  }) : super(size: ChipSize.pill);
}
