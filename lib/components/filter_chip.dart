import 'package:flutter/material.dart';

/// McAfee Filter Chip component
///
/// Filter chips are compact elements that represent discrete options in a set.
/// They help users refine content by selecting from multiple choices.
/// When selected, they display a checkmark and change their appearance.
///
/// Example usage:
/// ```dart
/// McFilterChip(
///   label: 'Active',
///   isSelected: true,
///   onSelected: (selected) {
///     print('Chip selected: $selected');
///   },
/// )
/// ```
class McFilterChip extends StatelessWidget {
  const McFilterChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.isEnabled = true,
    this.onSelected,
    this.leadingIcon,
    this.avatar,
    this.elevated = false,
    this.backgroundColor,
    this.selectedColor,
    this.foregroundColor,
    this.borderColor,
    this.elevation,
    this.padding,
    this.labelStyle,
    this.tooltip,
    this.showCheckmark = true,
  });

  /// The text label displayed in the chip
  final String label;

  /// Whether the chip is currently selected
  final bool isSelected;

  /// Whether the chip is enabled for interaction
  final bool isEnabled;

  /// Callback when the chip is selected or deselected
  final ValueChanged<bool>? onSelected;

  /// Optional icon to display before the label (avatar position)
  final Widget? leadingIcon;

  /// Optional avatar widget (typically used for user avatars)
  final Widget? avatar;

  /// Whether to use elevated style (with elevation and no border)
  final bool elevated;

  /// Background color of the chip when not selected
  final Color? backgroundColor;

  /// Background color when the chip is selected
  final Color? selectedColor;

  /// Text and icon color
  final Color? foregroundColor;

  /// Border color of the chip
  final Color? borderColor;

  /// Elevation of the chip (for elevated style)
  final double? elevation;

  /// Internal padding of the chip
  final EdgeInsets? padding;

  /// Custom text style for the label
  final TextStyle? labelStyle;

  /// Tooltip message to display on hover
  final String? tooltip;

  /// Whether to show the checkmark icon when selected
  final bool showCheckmark;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Material 3 spec colors for filter chips
    // Unselected state
    final unselectedBgColor = backgroundColor ?? colorScheme.surface;
    final unselectedBorderColor = borderColor ?? colorScheme.outlineVariant;
    final unselectedTextColor = foregroundColor ?? colorScheme.onSurfaceVariant;
    final iconColor = colorScheme.primary;

    // Selected state (enabled)
    final selectedBgColor = selectedColor ?? colorScheme.onPrimaryContainer;
    final selectedTextColor = colorScheme.primaryContainer;

    // Disabled state colors
    final disabledBorderColor = colorScheme.onSurface.withValues(alpha: 0.10);
    final disabledTextColor = colorScheme.onSurface.withValues(alpha: 0.38);
    final disabledIconColor = colorScheme.onSurface.withValues(alpha: 0.38);
    final disabledSelectedBgColor = colorScheme.onSurfaceVariant.withValues(
      alpha: 0.10,
    );

    Widget? effectiveAvatar = avatar ?? leadingIcon;

    // Apply icon color based on enabled/disabled state
    if (effectiveAvatar != null) {
      final effectiveIconColor = isEnabled ? iconColor : disabledIconColor;
      effectiveAvatar = IconTheme(
        data: IconThemeData(color: effectiveIconColor, size: 18),
        child: effectiveAvatar,
      );
    }

    // Determine effective colors based on selection and enabled state
    Color effectiveBgColor;
    Color effectiveTextColor;
    Color effectiveBorderColor;

    if (!isEnabled) {
      // Disabled state
      if (isSelected) {
        // Disabled + Selected: filled with disabled background
        effectiveBgColor = disabledSelectedBgColor;
        effectiveTextColor = disabledTextColor;
        effectiveBorderColor = Colors.transparent;
      } else {
        // Disabled + Unselected: no background, only border
        effectiveBgColor = Colors.transparent;
        effectiveTextColor = disabledTextColor;
        effectiveBorderColor = disabledBorderColor;
      }
    } else {
      // Enabled state
      effectiveBgColor = isSelected ? selectedBgColor : unselectedBgColor;
      effectiveTextColor = isSelected ? selectedTextColor : unselectedTextColor;
      effectiveBorderColor =
          isSelected ? Colors.transparent : unselectedBorderColor;
    }

    // Compute all chip properties once
    final chipLabel = Text(label);
    final chipOnSelected = isEnabled ? onSelected : null;
    final chipBackgroundColor = isSelected ? null : effectiveBgColor;
    final chipSelectedColor =
        !isEnabled && isSelected ? disabledSelectedBgColor : selectedBgColor;
    final chipSide = BorderSide(color: effectiveBorderColor);
    final chipLabelStyle = labelStyle ?? TextStyle(color: effectiveTextColor);
    final chipShowCheckmark = showCheckmark && effectiveAvatar == null;
    final chipCheckmarkColor =
        isEnabled && isSelected
            ? selectedTextColor
            : (isEnabled ? null : disabledIconColor);
    final chipIconTheme = IconThemeData(
      color: isEnabled ? iconColor : disabledIconColor,
      size: 18,
    );
    final chipElevation = elevated ? (elevation ?? 1.0) : (elevation ?? 0);

    // Single FilterChip constructor - elevation handles the "elevated" style
    final chipWidget = FilterChip(
      label: chipLabel,
      avatar: effectiveAvatar,
      onSelected: chipOnSelected,
      selected: isSelected,
      backgroundColor: chipBackgroundColor,
      selectedColor: chipSelectedColor,
      disabledColor: effectiveBgColor,
      side: chipSide,
      elevation: chipElevation,
      padding: padding,
      labelStyle: chipLabelStyle,
      showCheckmark: chipShowCheckmark,
      checkmarkColor: chipCheckmarkColor,
      iconTheme: chipIconTheme,
    );

    if (tooltip != null) {
      return Tooltip(message: tooltip, child: chipWidget);
    }

    return chipWidget;
  }
}

/// A group of filter chips with automatic layout and selection management
///
/// Example usage:
/// ```dart
/// FilterChipGroup(
///   labels: ['All', 'Active', 'Completed', 'Archived'],
///   selectedIndices: {1},
///   onSelectionChanged: (selectedIndices) {
///     print('Selected: $selectedIndices');
///   },
/// )
/// ```
class McFilterChipGroup extends StatefulWidget {
  const McFilterChipGroup({
    super.key,
    required this.labels,
    this.selectedIndices = const {},
    this.onSelectionChanged,
    this.multiSelect = true,
    this.elevated = false,
    this.spacing = 8.0,
    this.runSpacing = 8.0,
    this.alignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.center,
  });

  /// List of label strings for the chips
  final List<String> labels;

  /// Set of indices that are currently selected
  final Set<int> selectedIndices;

  /// Callback when the selection changes
  final ValueChanged<Set<int>>? onSelectionChanged;

  /// Whether multiple chips can be selected at once
  final bool multiSelect;

  /// Whether to use elevated style for all chips
  final bool elevated;

  /// Horizontal spacing between chips
  final double spacing;

  /// Vertical spacing between rows of chips
  final double runSpacing;

  /// How the chips should be aligned horizontally
  final WrapAlignment alignment;

  /// How the chips should be aligned vertically within each row
  final WrapCrossAlignment crossAxisAlignment;

  @override
  State<McFilterChipGroup> createState() => _McFilterChipGroupState();
}

class _McFilterChipGroupState extends State<McFilterChipGroup> {
  late Set<int> _selectedIndices;

  @override
  void initState() {
    super.initState();
    _selectedIndices = Set.from(widget.selectedIndices);
  }

  @override
  void didUpdateWidget(McFilterChipGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndices != oldWidget.selectedIndices) {
      _selectedIndices = Set.from(widget.selectedIndices);
    }
  }

  void _handleChipSelected(int index, bool selected) {
    setState(() {
      if (widget.multiSelect) {
        if (selected) {
          _selectedIndices.add(index);
        } else {
          _selectedIndices.remove(index);
        }
      } else {
        // Single select mode
        if (selected) {
          _selectedIndices = {index};
        } else {
          _selectedIndices.remove(index);
        }
      }
    });
    widget.onSelectionChanged?.call(_selectedIndices);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: widget.spacing,
      runSpacing: widget.runSpacing,
      alignment: widget.alignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      children: List.generate(
        widget.labels.length,
        (index) => McFilterChip(
          label: widget.labels[index],
          isSelected: _selectedIndices.contains(index),
          onSelected: (selected) => _handleChipSelected(index, selected),
          elevated: widget.elevated,
        ),
      ),
    );
  }
}
