import 'package:flutter/material.dart';
import 'icon.dart';
import 'package:mc_flutter_tokens/mc_tokens.dart';

/// Side sheet visual variant
enum SideSheetVariant {
  /// Primary variant using M3 surface color
  primary,

  /// Secondary (white) variant using M3 surface-container-lowest
  secondary,
}

/// McAfee Side Sheet component
///
/// A Material 3 modal side sheet component that slides in from the edge of the screen.
/// Side sheets display supplementary content anchored to the edge of the screen.
///
/// Based on Material 3 Design System specifications.
class McSideSheet extends StatelessWidget {
  const McSideSheet({
    super.key,
    this.header,
    this.body,
    this.children,
    this.width = 360,
    this.showDivider = true,
    this.padding = const EdgeInsets.all(24),
    this.variant = SideSheetVariant.primary,
  }) : assert(
         body != null || children != null,
         'Either body or children must be provided',
       ),
       assert(
         body == null || children == null,
         'Cannot provide both body and children',
       );

  /// Optional header widget (typically contains title and close button)
  final Widget? header;

  /// The main content body of the side sheet
  /// Use this for custom layouts. For simple lists, use [children] instead.
  final Widget? body;

  /// List of widgets to display in the side sheet
  /// Automatically wrapped in a Column with left alignment.
  /// For custom layouts, use [body] instead.
  final List<Widget>? children;

  /// The width of the side sheet (Material 3 standard: 360dp)
  final double width;

  /// Whether to show a divider between header and body
  final bool showDivider;

  /// Padding around the body content (default: 24 on all sides)
  /// Set to EdgeInsets.zero for no padding
  final EdgeInsets padding;

  /// Visual variant of the side sheet
  /// - [SideSheetVariant.primary]: Uses M3 surface color
  /// - [SideSheetVariant.secondary]: Uses M3 surface-container-lowest (white)
  final SideSheetVariant variant;

  /// Standard Material 3 side sheet width
  static const double standardWidth = 360.0;

  /// Standard Material 3 side sheet elevation
  static const double elevation = 1.0;

  /// Shows a modal side sheet from the left side of the screen
  ///
  /// [context] - The build context
  /// [header] - Optional header widget (typically title and close button)
  /// [body] - The main content body (for custom layouts)
  /// [children] - List of widgets (automatically wrapped in Column with left alignment)
  /// [width] - Width of the side sheet (default: 360dp Material 3 standard)
  /// [barrierDismissible] - Whether tapping the scrim dismisses the sheet
  /// [showDivider] - Whether to show divider between header and body
  /// [padding] - Padding around body content (default: 24 on all sides)
  /// [variant] - Visual variant (primary uses surface, secondary uses surfaceContainerLowest)
  static Future<T?> show<T>({
    required BuildContext context,
    Widget? header,
    Widget? body,
    List<Widget>? children,
    double width = standardWidth,
    bool barrierDismissible = true,
    bool showDivider = true,
    EdgeInsets padding = const EdgeInsets.all(24),
    SideSheetVariant variant = SideSheetVariant.primary,
  }) {
    // Get barrier label safely
    String? barrierLabel;
    try {
      barrierLabel = MaterialLocalizations.of(context).modalBarrierDismissLabel;
    } catch (e) {
      barrierLabel = 'Dismiss';
    }

    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      barrierColor: Colors.black.withOpacity(0.4), // Material 3 scrim opacity
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Semantics(
          scopesRoute: true,
          explicitChildNodes: true,
          label: 'Side sheet',
          child: Align(
            alignment: Alignment.centerLeft,
            child: McSideSheet(
              header: header,
              body: body,
              width: width,
              showDivider: showDivider,
              padding: padding,
              variant: variant,
              children: children,
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        // Material 3 emphasized decelerate easing
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: FadeTransition(opacity: curvedAnimation, child: child),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Background color based on variant:
    // - primary: M3/sys/light/surface
    // - secondary: M3/sys/light/surface-container-lowest (white)
    final Color backgroundColor =
        variant == SideSheetVariant.secondary
            ? colorScheme.surfaceContainerLowest
            : colorScheme.surface;

    return Semantics(
      container: true,
      child: Focus(
        autofocus: true,
        child: Material(
          elevation: elevation,
          shadowColor: colorScheme.shadow,
          // Only apply surface tint for primary variant to preserve pure white for secondary
          surfaceTintColor:
              variant == SideSheetVariant.secondary
                  ? Colors.transparent
                  : colorScheme.surfaceTint,
          color: backgroundColor,
          child: SizedBox(
            width: width,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header section (if provided)
                if (header != null) ...[
                  header!,
                  if (showDivider)
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: colorScheme.outlineVariant,
                    ),
                ],
                // Body content with padding
                Expanded(
                  child: Padding(
                    padding: padding,
                    child:
                        children != null
                            ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: children!,
                            )
                            : body!,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Standard side sheet header with title and close button
class McSideSheetHeader extends StatelessWidget {
  const McSideSheetHeader({
    super.key,
    required this.title,
    this.onClose,
    this.actions = const [],
  });

  /// The title text
  final String title;

  /// Callback when close button is pressed
  final VoidCallback? onClose;

  /// Additional action buttons to show before the close button
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 8, 16),
      child: Row(
        children: [
          Expanded(
            child: Semantics(
              header: true,
              child: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: colorScheme.onSurface),
              ),
            ),
          ),
          ...actions,
          IconButton(
            icon: Icon(Icons.close, color: colorScheme.onSurface),
            onPressed: onClose ?? () => Navigator.of(context).pop(),
            tooltip: 'Close',
          ),
        ],
      ),
    );
  }
}

/// McAfee logo header for side sheet navigation
class McSideSheetLogoHeader extends StatelessWidget {
  const McSideSheetLogoHeader({
    super.key,
    this.logoColor = BrandColor.red,
    this.onClose,
    this.actions = const [],
  });

  /// The color of the McAfee logo
  final BrandColor logoColor;

  /// Callback when close button is pressed
  final VoidCallback? onClose;

  /// Additional action buttons to show before the close button
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Color iconColor = colorScheme.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 8, 16),
      child: Row(
        children: [
          Semantics(
            label: 'McAfee logo',
            child: McLogoHorizontalIcon(height: 18, color: logoColor),
          ),
          const Spacer(),
          ...actions,
          IconButton(
            icon: Icon(Icons.close, color: iconColor),
            onPressed: onClose ?? () => Navigator.of(context).pop(),
            tooltip: 'Close',
          ),
        ],
      ),
    );
  }
}

/// Side sheet navigation item with optional leading and trailing widgets
class McSideSheetItem extends StatelessWidget {
  const McSideSheetItem({
    super.key,
    required this.label,
    this.leading,
    this.trailing,
    this.onTap,
  });

  /// The label text for the item
  final String label;

  /// Optional leading widget (e.g., Icon)
  final Widget? leading;

  /// Optional trailing widget (e.g., Badge, Icon, Text)
  final Widget? trailing;

  /// Callback when the item is tapped
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // Text color: M3/sys/light/on-surface-variant
    final colorScheme = Theme.of(context).colorScheme;
    final Color textColor = colorScheme.onSurfaceVariant;
    final Color iconColor = colorScheme.onSurfaceVariant;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            if (leading != null) ...[
              IconTheme(
                data: IconThemeData(color: iconColor, size: 24),
                child: leading!,
              ),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Text(
                label,
                style: context.typographyTokens.bodyMediumEmphasized.copyWith(
                  color: textColor,
                ),
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 16),
              DefaultTextStyle(
                style: TextStyle(color: textColor, fontSize: 14),
                child: IconTheme(
                  data: IconThemeData(color: iconColor, size: 20),
                  child: trailing!,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
