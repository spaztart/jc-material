import 'package:flutter/material.dart';
import 'icon.dart';

class McAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? trailing;
  final Color? leadingIconColor;
  final Color? trailingIconColor;
  const McAppBar({
    super.key,
    this.leading,
    this.trailing,
    this.leadingIconColor,
    this.trailingIconColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // Use tokenized background color for app bar
    final backgroundColor = colorScheme.surface;
    return Material(
      color: backgroundColor,
      child: SizedBox(
        height: preferredSize.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leading != null
                ? IconTheme(
                  data: IconThemeData(
                    color: leadingIconColor ?? colorScheme.onSurface,
                  ),
                  child: leading!,
                )
                : const SizedBox(width: 48),
            Expanded(
              child: Center(
                child: McLogoHorizontalIcon(
                  height: 18,
                  width: 94,
                  color: BrandColor.red,
                ),
              ),
            ),
            trailing != null
                ? IconTheme(
                  data: IconThemeData(
                    color: trailingIconColor ?? colorScheme.onSurface,
                  ),
                  child: trailing!,
                )
                : const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
