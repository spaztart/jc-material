import 'package:flutter/material.dart';
import 'package:mc_flutter_tokens/mc_tokens.dart';
import 'chip.dart';
import 'icon.dart';

enum ConnectionDetailsVariant { elevated, filled, outlined }

enum BulletType { success, failed }

class BulletItem {
  final String text;
  final BulletType type;

  const BulletItem(this.text, {this.type = BulletType.success});
}

/// Connection details component - displays connection information in a card-like format
class McConnectionDetails extends StatelessWidget {
  final Widget? icon;
  final Widget? customIcon;
  final String? title;
  final String? subtitle;
  final String? status;
  final ChipKind statusChipKind;
  final ChipStyle statusChipStyle;
  final String? connectionType;
  final String? lastConnected;
  final List<BulletItem>? bullets;
  final Widget? customContent;
  final ConnectionDetailsVariant variant;
  final VoidCallback? onTap;
  final double? width;

  const McConnectionDetails({
    super.key,
    this.icon,
    this.customIcon,
    this.title,
    this.subtitle,
    this.status,
    this.statusChipKind = ChipKind.safe,
    this.statusChipStyle = ChipStyle.filled,
    this.connectionType,
    this.lastConnected,
    this.bullets,
    this.customContent,
    this.variant = ConnectionDetailsVariant.outlined,
    this.onTap,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final typographyTokens = context.typographyTokens;
    final extendedColors = context.extendedColors;

    BoxDecoration decoration;

    switch (variant) {
      case ConnectionDetailsVariant.elevated:
        decoration = BoxDecoration(
          color: colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(
            context.spacingTokens.cornerMedium,
          ),
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: 1,
          ),
          boxShadow: context.elevations["5"],
        );
        break;
      case ConnectionDetailsVariant.filled:
        decoration = BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(
            context.spacingTokens.cornerMedium,
          ),
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: 1,
          ),
        );
        break;
      case ConnectionDetailsVariant.outlined:
        decoration = BoxDecoration(
          color: colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(
            context.spacingTokens.cornerMedium,
          ),
          border: Border.all(color: colorScheme.outlineVariant, width: 1),
        );
        break;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.spacingTokens.cornerMedium),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(16),
        decoration: decoration,
        child:
            customContent ??
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // First row: Title and status chip
                if (title != null || status != null)
                  Row(
                    children: [
                      if (title != null)
                        Expanded(
                          child: Text(
                            title!,
                            style: typographyTokens.titleMedium.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                      if (status != null) ...[
                        const SizedBox(width: 8),
                        Builder(
                          builder: (context) {
                            Color? bgColor;
                            Color? fgColor;

                            // Get colors based on chip kind
                            switch (statusChipKind) {
                              case ChipKind.safe:
                                bgColor = extendedColors.positive;
                                fgColor = extendedColors.onPositive;
                                break;
                              case ChipKind.inProgress:
                                bgColor = colorScheme.surfaceContainerHigh;
                                fgColor = colorScheme.primary;
                                break;
                              case ChipKind.resolved:
                                bgColor = extendedColors.positiveContainer;
                                fgColor = extendedColors.positive;
                                break;
                              case ChipKind.warning:
                                bgColor = extendedColors.warningContainer;
                                fgColor = extendedColors.warning;
                                break;
                              case ChipKind.danger:
                                // Light mode: light pink bg with dark red text
                                // Dark mode: dark red bg with light pink text
                                if (Theme.of(context).brightness ==
                                    Brightness.dark) {
                                  bgColor = colorScheme.errorContainer;
                                  fgColor = colorScheme.onErrorContainer;
                                } else {
                                  bgColor = colorScheme.onErrorContainer;
                                  fgColor = colorScheme.error;
                                }
                                break;
                              case ChipKind.dismissed:
                                bgColor = colorScheme.surfaceContainerLowest;
                                fgColor = colorScheme.onSurface.withOpacity(
                                  0.38,
                                );
                                break;
                              case ChipKind.none:
                                // Use defaults
                                break;
                            }

                            return McChip(
                              label: status!,
                              kind: statusChipKind,
                              style: statusChipStyle,
                              size: ChipSize.pill,
                              type: ChipType.assistive,
                              backgroundColor: bgColor,
                              foregroundColor: fgColor,
                              leadingIcon:
                                  fgColor != null
                                      ? Icon(
                                        statusChipKind == ChipKind.safe ||
                                                statusChipKind ==
                                                    ChipKind.resolved
                                            ? Icons.check_circle
                                            : statusChipKind ==
                                                ChipKind.inProgress
                                            ? Icons.access_time
                                            : statusChipKind == ChipKind.warning
                                            ? Icons.info_outline
                                            : statusChipKind == ChipKind.danger
                                            ? Icons.error_outline
                                            : statusChipKind ==
                                                ChipKind.dismissed
                                            ? Icons.arrow_forward
                                            : null,
                                        size: 18,
                                        color: fgColor,
                                      )
                                      : null,
                            );
                          },
                        ),
                      ],
                    ],
                  ),

                // Subtitle
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      subtitle!,
                      style: typographyTokens.bodyMedium.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),

                // Connection details
                if (connectionType != null || lastConnected != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      [
                        if (connectionType != null) connectionType,
                        if (lastConnected != null) lastConnected,
                      ].join(' • '),
                      style: typographyTokens.bodySmall.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),

                // Bullet points with checkmarks or X icons
                if (bullets != null && bullets!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          bullets!.map((bullet) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  bullet.type == BulletType.success
                                      ? McCheckmarkIcon(
                                        size: 16,
                                        color: context.extendedColors.positive,
                                      )
                                      : McXIcon(
                                        size: 16,
                                        color: colorScheme.error,
                                      ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      bullet.text,
                                      style: typographyTokens.bodyMedium
                                          .copyWith(
                                            color: colorScheme.onSurfaceVariant,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                    ),
                  ),
              ],
            ),
      ),
    );
  }
}
