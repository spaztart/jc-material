import 'package:flutter/material.dart';
import 'package:mc_flutter_tokens/mc_tokens.dart';

/// McChatBubble
/// A Material 3 chat bubble component based on Figma design node 63194-40971.
/// Supports sent/received, text, tokens for color, and optional avatar.

class McChatBubble extends StatelessWidget {
  final String text;
  final bool isSent;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const McChatBubble({
    super.key,
    required this.text,
    this.isSent = false,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final sentColor = colorScheme.surfaceContainerHighest;
    final sentTextColor = colorScheme.onSurface;
    final replyColor = colorScheme.surfaceContainerLow;
    final replyTextColor = colorScheme.tertiaryContainer;
    final borderRadius = BorderRadius.circular(
      context.spacingTokens.cornerLarge,
    );

    final bubbleColor = isSent ? sentColor : replyColor;
    final textColor = isSent ? sentTextColor : replyTextColor;

    return Row(
      mainAxisAlignment:
          isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            margin:
                margin ??
                const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            padding:
                padding ??
                const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              color: bubbleColor,
              borderRadius: borderRadius,
            ),
            child: Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: textColor),
            ),
          ),
        ),
      ],
    );
  }
}
