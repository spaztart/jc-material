import 'package:flutter/material.dart';
import 'card.dart';

/// McAfee Stat Card component
///
/// Displays a statistic with a title, value text, and a progress bar.
/// The progress bar represents a value from 0 to 20 (configurable max).
/// Uses McCard as the container, allowing different card variants.
///
/// Example usage:
/// ```dart
/// McStatCard(
///   title: 'Security Score',
///   statText: 'Good',
///   value: 15,
/// )
/// ```
class McStatCard extends StatelessWidget {
  const McStatCard({
    super.key,
    required this.title,
    required this.statText,
    required this.value,
    this.maxValue = 20,
    this.variant = CardVariant.outlined,
    this.onTap,
    this.header,
    this.progressBackgroundColor,
    this.progressFillColor,
    this.textColor,
    this.titleStyle,
    this.statTextStyle,
    this.valueStyle,
    this.progressBarHeight,
  });

  final String title;
  final String statText;
  final int value;
  final int maxValue;
  final CardVariant variant;
  final VoidCallback? onTap;
  final Widget? header;
  final Color? progressBackgroundColor;
  final Color? progressFillColor;
  final Color? textColor;
  final TextStyle? titleStyle;
  final TextStyle? statTextStyle;
  final TextStyle? valueStyle;
  final double? progressBarHeight;

  static const _progressBarRadius = 4.0;
  static const _spacing = (
    header: 12.0,
    title: 4.0,
    progress: 12.0,
    value: 4.0,
  );

  TextStyle _textStyle(
    TextStyle? custom, {
    required Color color,
    required double size,
    required double height,
    required FontWeight weight,
    double spacing = 0,
  }) =>
      custom ??
      TextStyle(
        color: color,
        fontSize: size,
        height: height / size,
        fontWeight: weight,
        letterSpacing: spacing,
      );

  Widget _progressBar(
    double height,
    double progress,
    Color bgColor,
    Color fillColor,
  ) {
    final radius = BorderRadius.circular(_progressBarRadius);
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(color: bgColor, borderRadius: radius),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(color: fillColor, borderRadius: radius),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final color = textColor ?? cs.onSurface;
    final clampedValue = value.clamp(0, maxValue);
    final progress = maxValue > 0 ? clampedValue / maxValue : 0.0;

    return McCard(
      variant: variant,
      onTap: onTap,
      customContent: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (header != null) ...[
            Align(alignment: Alignment.centerLeft, child: header!),
            SizedBox(height: _spacing.header),
          ],
          Text(
            title,
            style: _textStyle(
              titleStyle,
              color: color,
              size: 16,
              height: 24,
              weight: FontWeight.w700,
              spacing: 0.15,
            ),
          ),
          SizedBox(height: _spacing.title),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                child: Text(
                  statText,
                  style: _textStyle(
                    statTextStyle,
                    color: color,
                    size: 14,
                    height: 20,
                    weight: FontWeight.w400,
                    spacing: 0.25,
                  ),
                ),
              ),
              SizedBox(width: _spacing.value),
              Text(
                '$clampedValue',
                style:
                    valueStyle ??
                    Theme.of(
                      context,
                    ).textTheme.labelSmall?.copyWith(color: color) ??
                    TextStyle(color: color, fontSize: 11),
              ),
            ],
          ),
          SizedBox(height: _spacing.progress),
          _progressBar(
            progressBarHeight ?? 8,
            progress,
            progressBackgroundColor ?? cs.outlineVariant,
            progressFillColor ?? cs.primaryFixedDim,
          ),
        ],
      ),
    );
  }
}
