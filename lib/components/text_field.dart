import 'package:flutter/material.dart';
import 'package:mc_flutter_tokens/mc_tokens.dart';
import 'package:pegasus_flutter/components/icon.dart';

enum TextFieldState { defaultState, input, record }

class McTextField extends StatefulWidget {
  final String? hintText;
  final bool disabled;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? semanticLabel;
  final bool isExpandable;
  final VoidCallback? onRecordPressed;
  final VoidCallback? onSendPressed;
  final VoidCallback? onAttachPressed;
  final Widget? trailingIcon;
  final Widget? leadingIcon;

  const McTextField({
    super.key,
    this.hintText,
    this.disabled = false,
    this.controller,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.keyboardType,
    this.obscureText = false,
    this.semanticLabel,
    this.isExpandable = false,
    this.onRecordPressed,
    this.onSendPressed,
    this.onAttachPressed,
    this.trailingIcon,
    this.leadingIcon,
  });

  @override
  State<McTextField> createState() => _McTextFieldState();
}

class _McTextFieldState extends State<McTextField> {
  late TextEditingController _controller;
  TextFieldState _state = TextFieldState.defaultState;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_updateState);
    _focusNode.addListener(_updateState);
  }

  @override
  void didUpdateWidget(McTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _controller.removeListener(_updateState);
      _controller = widget.controller ?? TextEditingController();
      _controller.addListener(_updateState);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_updateState);
    _focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _updateState() {
    // Don't update state if we're in record mode
    if (_state == TextFieldState.record) return;

    setState(() {
      if (!widget.isExpandable) return;

      if (_controller.text.isEmpty) {
        _state = TextFieldState.defaultState;
      } else {
        _state = TextFieldState.input;
      }
    });
  }

  void _toggleRecording() {
    setState(() {
      if (_state == TextFieldState.record) {
        _state =
            _controller.text.isEmpty
                ? TextFieldState.defaultState
                : TextFieldState.input;
      } else {
        _state = TextFieldState.record;
      }
    });
    widget.onRecordPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    final isExpanded = _state != TextFieldState.defaultState;
    final isRecording = _state == TextFieldState.record;
    final hasText = _controller.text.isNotEmpty;
    final colorScheme = Theme.of(context).colorScheme;

    return Semantics(
      label: widget.semanticLabel,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 56,
          maxHeight: widget.isExpandable ? 200 : 56,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              context.spacingTokens.cornerExtraLarge,
            ),
          ),
          padding: const EdgeInsets.all(4),
          child:
              widget.isExpandable
                  ? IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (widget.leadingIcon != null)
                          widget.leadingIcon!
                        else if (widget.onAttachPressed != null ||
                            widget.disabled)
                          Container(
                            width: 48,
                            height: 48,
                            alignment: Alignment.bottomCenter,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(
                                minWidth: 40,
                                minHeight: 40,
                                maxWidth: 40,
                                maxHeight: 40,
                              ),
                              onPressed:
                                  widget.disabled
                                      ? null
                                      : widget.onAttachPressed,
                              icon: Center(
                                child: Icon(
                                  Icons.add,
                                  size: 24,
                                  color:
                                      widget.disabled
                                          ? colorScheme.onSurfaceVariant
                                              .withOpacity(0.4)
                                          : colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: 10,
                              right:
                                  (widget.trailingIcon != null ||
                                          widget.onSendPressed != null ||
                                          widget.disabled)
                                      ? 20
                                      : 10,
                              left:
                                  (widget.leadingIcon != null ||
                                          widget.onAttachPressed != null ||
                                          widget.disabled)
                                      ? 0
                                      : 10,
                            ),
                            child: TextField(
                              controller: _controller,
                              focusNode: _focusNode,
                              enabled: !widget.disabled && !isRecording,
                              onChanged: widget.onChanged,
                              onTap: widget.onTap,
                              readOnly: widget.readOnly || isRecording,
                              keyboardType: widget.keyboardType,
                              maxLines: widget.obscureText ? 1 : null,
                              minLines: 1,
                              obscureText: widget.obscureText,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              decoration: InputDecoration(
                                hintText: widget.hintText ?? 'Input text',
                                hintStyle: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant
                                      .withOpacity(0.6),
                                ),
                                filled: false,
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                        if (widget.trailingIcon != null)
                          widget.trailingIcon!
                        else if (widget.onSendPressed != null ||
                            widget.disabled)
                          Container(
                            width: 48,
                            height: 48,
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onLongPress: isExpanded ? _toggleRecording : null,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(
                                  minWidth: 40,
                                  minHeight: 40,
                                  maxWidth: 40,
                                  maxHeight: 40,
                                ),
                                onPressed:
                                    widget.disabled
                                        ? null
                                        : isExpanded
                                        ? () {
                                          if (isRecording) {
                                            _toggleRecording();
                                          } else {
                                            widget.onSendPressed?.call();
                                          }
                                        }
                                        : null,
                                icon: Center(
                                  child:
                                      isRecording
                                          ? McRecordIcon(
                                            size: 24,
                                            color: colorScheme.primary,
                                          )
                                          : McArrowUpIcon(
                                            size: 24,
                                            color:
                                                widget.disabled
                                                    ? colorScheme
                                                        .onSurfaceVariant
                                                        .withOpacity(0.4)
                                                    : isExpanded
                                                    ? colorScheme.primary
                                                    : colorScheme
                                                        .onSurfaceVariant
                                                        .withOpacity(0.4),
                                          ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                  : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.leadingIcon != null)
                        widget.leadingIcon!
                      else if (widget.onAttachPressed != null ||
                          widget.disabled)
                        Container(
                          width: 48,
                          height: 48,
                          alignment: Alignment.center,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 40,
                              minHeight: 40,
                              maxWidth: 40,
                              maxHeight: 40,
                            ),
                            onPressed:
                                widget.disabled ? null : widget.onAttachPressed,
                            icon: Center(
                              child: Icon(
                                Icons.add,
                                size: 24,
                                color:
                                    widget.disabled
                                        ? colorScheme.onSurfaceVariant
                                            .withOpacity(0.4)
                                        : colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right:
                                (widget.trailingIcon != null ||
                                        widget.onSendPressed != null ||
                                        widget.disabled)
                                    ? 8
                                    : 12,
                            left:
                                (widget.leadingIcon != null ||
                                        widget.onAttachPressed != null ||
                                        widget.disabled)
                                    ? 8
                                    : 12,
                          ),
                          child: TextField(
                            controller: _controller,
                            focusNode: _focusNode,
                            enabled: !widget.disabled,
                            onChanged: widget.onChanged,
                            onTap: widget.onTap,
                            readOnly: widget.readOnly,
                            keyboardType: widget.keyboardType,
                            maxLines: 1,
                            obscureText: widget.obscureText,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: colorScheme.onSurfaceVariant),
                            decoration: InputDecoration(
                              hintText: widget.hintText ?? 'Input text',
                              hintStyle: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant.withOpacity(
                                  0.6,
                                ),
                              ),
                              filled: false,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                      if (widget.trailingIcon != null)
                        widget.trailingIcon!
                      else if (widget.onSendPressed != null || widget.disabled)
                        Container(
                          width: 48,
                          height: 48,
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onLongPress: hasText ? _toggleRecording : null,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(
                                minWidth: 40,
                                minHeight: 40,
                                maxWidth: 40,
                                maxHeight: 40,
                              ),
                              onPressed:
                                  widget.disabled
                                      ? null
                                      : hasText
                                      ? () {
                                        if (isRecording) {
                                          _toggleRecording();
                                        } else {
                                          widget.onSendPressed?.call();
                                        }
                                      }
                                      : null,
                              icon: Center(
                                child:
                                    isRecording
                                        ? McRecordIcon(
                                          size: 24,
                                          color: colorScheme.primary,
                                        )
                                        : McArrowUpIcon(
                                          size: 24,
                                          color:
                                              widget.disabled
                                                  ? colorScheme.onSurfaceVariant
                                                      .withOpacity(0.4)
                                                  : hasText
                                                  ? colorScheme.primary
                                                  : colorScheme.onSurfaceVariant
                                                      .withOpacity(0.4),
                                        ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
        ),
      ),
    );
  }
}
