import 'package:flutter/material.dart';
import 'package:pegasus_flutter/components/icon.dart';

/// Defines the visual style of the search bar
enum SearchBarStyle {
  /// Outlined style with a border
  outlined,

  /// Filled style with background color
  filled,
}

/// McAfee Search Bar component
///
/// A search input field with a search icon, optional clear button,
/// and customizable appearance following Material 3 guidelines.
///
/// Example usage:
/// ```dart
/// McSearchBar(
///   hintText: 'Search...',
///   onChanged: (value) => print('Search: $value'),
///   onSubmitted: (value) => print('Submit: $value'),
/// )
/// ```
class McSearchBar extends StatefulWidget {
  const McSearchBar({
    super.key,
    this.controller,
    this.hintText = 'Search',
    this.style = SearchBarStyle.filled,
    this.enabled = true,
    this.autofocus = false,
    this.showClearButton = true,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onClear,
    this.leadingIcon,
    this.trailingIcon,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.textColor,
    this.hintColor,
    this.iconColor,
    this.borderColor,
    this.borderRadius,
    this.height,
    this.textStyle,
    this.semanticLabel,
  });

  /// Controller for the text field
  final TextEditingController? controller;

  /// Placeholder text shown when the field is empty
  final String hintText;

  /// Visual style of the search bar
  final SearchBarStyle style;

  /// Whether the search bar is enabled
  final bool enabled;

  /// Whether to autofocus the search bar
  final bool autofocus;

  /// Whether to show clear button when text is entered
  final bool showClearButton;

  /// Called when the text changes
  final ValueChanged<String>? onChanged;

  /// Called when the user submits the search
  final ValueChanged<String>? onSubmitted;

  /// Called when the search bar is tapped
  final VoidCallback? onTap;

  /// Called when the clear button is pressed
  final VoidCallback? onClear;

  /// Custom leading icon (replaces default search icon)
  final Widget? leadingIcon;

  /// Custom trailing icon (replaces default clear button)
  final Widget? trailingIcon;

  /// Background color of the search bar
  final Color? backgroundColor;

  /// Background color when hovered
  final Color? hoverBackgroundColor;

  /// Text color
  final Color? textColor;

  /// Hint text color
  final Color? hintColor;

  /// Icon color
  final Color? iconColor;

  /// Border color (for outlined style)
  final Color? borderColor;

  /// Border radius of the search bar
  final double? borderRadius;

  /// Height of the search bar
  final double? height;

  /// Custom text style
  final TextStyle? textStyle;

  /// Semantic label for accessibility
  final String? semanticLabel;

  @override
  State<McSearchBar> createState() => _McSearchBarState();
}

class _McSearchBarState extends State<McSearchBar> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  bool _isHovered = false;
  bool _isFocused = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(McSearchBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _controller.removeListener(_onTextChanged);
      _controller = widget.controller ?? TextEditingController();
      _controller.addListener(_onTextChanged);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  void _onFocusChanged() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _clearText() {
    _controller.clear();
    widget.onClear?.call();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final hasText = _controller.text.isNotEmpty;
    final isEnabled = widget.enabled;

    // Colors based on M3 scheme
    // Base background: M3/sys/light/surface-container-lowest
    final baseBackgroundColor =
        widget.backgroundColor ?? colorScheme.surfaceContainerLowest;

    // State layer colors
    // hover: M3/state-layers/light/onSurface/opacity-0.08
    // pressed: M3/state-layers/light/onSurface/opacity-0.10
    Color effectiveBackgroundColor;
    if (_isPressed) {
      effectiveBackgroundColor = Color.alphaBlend(
        colorScheme.onSurface.withOpacity(0.10),
        baseBackgroundColor,
      );
    } else if (_isHovered || _isFocused) {
      effectiveBackgroundColor = Color.alphaBlend(
        colorScheme.onSurface.withOpacity(0.08),
        baseBackgroundColor,
      );
    } else {
      effectiveBackgroundColor = baseBackgroundColor;
    }

    final effectiveTextColor = widget.textColor ?? colorScheme.onSurface;

    final effectiveHintColor = widget.hintColor ?? colorScheme.onSurfaceVariant;

    final effectiveIconColor = widget.iconColor ?? colorScheme.onSurfaceVariant;

    // Border: M3/sys/light/outline-variant
    final effectiveBorderColor =
        widget.borderColor ?? colorScheme.outlineVariant;

    final effectiveBorderRadius = widget.borderRadius ?? 14.0;

    final effectiveHeight = widget.height ?? 56.0;

    final disabledOpacity = 0.38;

    return Semantics(
      label: widget.semanticLabel ?? widget.hintText,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) => setState(() => _isPressed = false),
          onTapCancel: () => setState(() => _isPressed = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: effectiveHeight,
            decoration: BoxDecoration(
              color:
                  isEnabled
                      ? effectiveBackgroundColor
                      : baseBackgroundColor.withOpacity(disabledOpacity),
              borderRadius: BorderRadius.circular(effectiveBorderRadius),
              border: Border.all(
                color: _isFocused ? colorScheme.primary : effectiveBorderColor,
                width: _isFocused ? 2.0 : 1.0,
              ),
            ),
            child: Row(
              children: [
                // Leading icon (search icon)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child:
                      widget.leadingIcon ??
                      McSearchIcon(
                        size: 24,
                        color:
                            isEnabled
                                ? effectiveIconColor
                                : effectiveIconColor.withOpacity(
                                  disabledOpacity,
                                ),
                      ),
                ),

                // Text field
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      enabled: isEnabled,
                      autofocus: widget.autofocus,
                      onChanged: widget.onChanged,
                      onSubmitted: widget.onSubmitted,
                      onTap: widget.onTap,
                      textInputAction: TextInputAction.search,
                      style:
                          widget.textStyle ??
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color:
                                isEnabled
                                    ? effectiveTextColor
                                    : effectiveTextColor.withOpacity(
                                      disabledOpacity,
                                    ),
                          ),
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        hintStyle: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(
                          color:
                              isEnabled
                                  ? effectiveHintColor
                                  : effectiveHintColor.withOpacity(
                                    disabledOpacity,
                                  ),
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        filled: false,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ),

                // Trailing icons section
                if (widget.trailingIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: widget.trailingIcon,
                  )
                else
                  ..._buildTrailingIcons(
                    hasText: hasText,
                    isEnabled: isEnabled,
                    effectiveIconColor: effectiveIconColor,
                    disabledOpacity: disabledOpacity,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTrailingIcons({
    required bool hasText,
    required bool isEnabled,
    required Color effectiveIconColor,
    required double disabledOpacity,
  }) {
    final List<Widget> icons = [];

    // Clear button (shown when there's text)
    if (widget.showClearButton && hasText && isEnabled) {
      icons.add(
        IconButton(
          onPressed: _clearText,
          icon: Icon(Icons.close, size: 24, color: effectiveIconColor),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
        ),
      );
    }

    // Add trailing padding if no icons
    if (icons.isEmpty) {
      icons.add(const SizedBox(width: 16));
    } else {
      // Add right padding after last icon
      icons.add(const SizedBox(width: 8));
    }

    return icons;
  }
}
