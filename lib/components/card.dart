import 'package:flutter/material.dart';
import 'package:mc_flutter_tokens/mc_tokens.dart';

enum CardVariant { elevated, filled, outlined }

/// Regular vertical card - 128x114 with icon and text
class McCard extends StatelessWidget {
  final Widget? icon;
  final Widget? customIcon;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? text; // legacy
  final Widget? customContent;
  final CardVariant variant;
  final VoidCallback? onTap;
  final double? width;

  const McCard({
    super.key,
    this.icon,
    this.customIcon,
    this.title,
    this.subtitle,
    this.description,
    this.text,
    this.customContent,
    this.variant = CardVariant.outlined,
    this.onTap,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final typographyTokens = context.typographyTokens;

    BoxDecoration decoration;

    switch (variant) {
      case CardVariant.elevated:
        decoration = BoxDecoration(
          color: colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(
            context.spacingTokens.cornerMedium,
          ),
          border: Border.all(color: colorScheme.outlineVariant, width: 1),
          boxShadow: context.elevations["5"],
        );
        break;
      case CardVariant.filled:
        decoration = BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(
            context.spacingTokens.cornerMedium,
          ),
          border: Border.all(color: colorScheme.outlineVariant, width: 1),
        );
        break;
      case CardVariant.outlined:
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (customIcon != null) ...[
              customIcon!,
              const SizedBox(height: 10),
            ] else if (icon != null) ...[
              icon!,
              const SizedBox(height: 10),
            ],
            if (customContent != null)
              customContent!
            else ...[
              if (title != null)
                Text(
                  title!,
                  style: typographyTokens.titleMedium.copyWith(
                    color: colorScheme.onSurface,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              if (subtitle != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    subtitle!,
                    style: typographyTokens.bodyMedium.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              if (description != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    description!,
                    style: typographyTokens.bodySmall.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              if (text != null)
                Text(
                  text!,
                  style: typographyTokens.titleMedium.copyWith(
                    color: colorScheme.onSurface,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Horizontal card - 360px wide with rich content
class McHorizontalCard extends StatelessWidget {
  final Widget? leadingIcon;
  final Widget? chip;
  final String? status;
  final Widget? trailingIcon;
  final String? title;
  final String? subtitle;
  final String? description;
  final Widget? customContent;
  final CardVariant variant;
  final VoidCallback? onTap;
  final double? width;

  const McHorizontalCard({
    super.key,
    this.leadingIcon,
    this.chip,
    this.status,
    this.trailingIcon,
    this.title,
    this.subtitle,
    this.description,
    this.customContent,
    this.variant = CardVariant.outlined,
    this.onTap,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final typographyTokens = context.typographyTokens;

    BoxDecoration decoration;

    switch (variant) {
      case CardVariant.elevated:
        decoration = BoxDecoration(
          color: colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(
            context.spacingTokens.cornerMedium,
          ),
          border: Border.all(color: colorScheme.outlineVariant, width: 1),
          boxShadow: context.elevations["3"],
        );
        break;
      case CardVariant.filled:
        decoration = BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(
            context.spacingTokens.cornerMedium,
          ),
          border: Border.all(color: colorScheme.outlineVariant, width: 1),
        );
        break;
      case CardVariant.outlined:
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
        padding: const EdgeInsets.all(14),
        decoration: decoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top row: left side flows naturally, right side stays aligned
            if (leadingIcon != null ||
                chip != null ||
                status != null ||
                trailingIcon != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left side: icon and chip flow naturally
                  Expanded(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10,
                      runSpacing: 8,
                      children: [
                        if (leadingIcon != null) leadingIcon!,
                        if (chip != null) chip!,
                      ],
                    ),
                  ),
                  // Right side: status and trailing icon stay together
                  if (status != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        status!,
                        style: typographyTokens.labelLargeEmphasized.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                  if (trailingIcon != null)
                    Padding(
                      padding: EdgeInsets.only(left: status != null ? 16 : 0),
                      child: trailingIcon!,
                    ),
                ],
              ),
            if (leadingIcon != null ||
                chip != null ||
                status != null ||
                trailingIcon != null)
              const SizedBox(height: 10),
            // Content
            if (customContent != null)
              customContent!
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: typographyTokens.titleMedium.copyWith(
                        color: colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle!,
                      style: typographyTokens.bodyMedium.copyWith(
                        color: colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                  if (description != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      description!,
                      style: typographyTokens.bodySmall.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                ],
              ),
          ],
        ),
      ),
    );
  }
}

/// Custom card - fully flexible content container
class McCustomCard extends StatelessWidget {
  final Widget child;
  final CardVariant variant;
  final VoidCallback? onTap;
  final double? width;
  final EdgeInsetsGeometry? padding;

  const McCustomCard({
    super.key,
    required this.child,
    this.variant = CardVariant.outlined,
    this.onTap,
    this.width = double.infinity,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    BoxDecoration decoration;

    switch (variant) {
      case CardVariant.elevated:
        decoration = BoxDecoration(
          color: colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(
            context.spacingTokens.cornerMedium,
          ),
          border: Border.all(color: colorScheme.outlineVariant, width: 1),
          boxShadow: context.elevations["3"],
        );
        break;
      case CardVariant.filled:
        decoration = BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(
            context.spacingTokens.cornerMedium,
          ),
          border: Border.all(color: colorScheme.outlineVariant, width: 1),
        );
        break;
      case CardVariant.outlined:
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
        padding: padding,
        decoration: decoration,
        child: child,
      ),
    );
  }
}
