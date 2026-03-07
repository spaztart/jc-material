import 'package:flutter/material.dart';
import 'package:mc_flutter_tokens/mc_tokens.dart';

/// Feedback component for collecting user ratings
/// Features thumbs up/down buttons with optional message
class McFeedback extends StatefulWidget {
  const McFeedback({
    super.key,
    this.message = 'Was this helpful?',
    this.onThumbsUp,
    this.onThumbsDown,
  });

  final String message;
  final VoidCallback? onThumbsUp;
  final VoidCallback? onThumbsDown;

  @override
  State<McFeedback> createState() => _McFeedbackState();
}

class _McFeedbackState extends State<McFeedback> {
  String? _selected; // 'up' or 'down'

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(context.spacingTokens.cornerMedium),
        border: Border.all(color: colorScheme.outlineVariant, width: 1),
      ),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 12,
        runSpacing: 12,
        children: [
          Text(
            widget.message,
            style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  _selected == 'up' ? Icons.thumb_up : Icons.thumb_up_outlined,
                ),
                onPressed: () {
                  setState(() {
                    _selected = _selected == 'up' ? null : 'up';
                  });
                  widget.onThumbsUp?.call();
                },
                color:
                    _selected == 'up'
                        ? colorScheme.outline
                        : colorScheme.onSurfaceVariant,
                tooltip: 'Thumbs up',
              ),
              IconButton(
                icon: Icon(
                  _selected == 'down'
                      ? Icons.thumb_down
                      : Icons.thumb_down_outlined,
                ),
                onPressed: () {
                  setState(() {
                    _selected = _selected == 'down' ? null : 'down';
                  });
                  widget.onThumbsDown?.call();
                },
                color:
                    _selected == 'down'
                        ? colorScheme.outline
                        : colorScheme.onSurfaceVariant,
                tooltip: 'Thumbs down',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
