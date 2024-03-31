import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Default input that displays TextField
class InputWidget extends StatelessWidget {
  const InputWidget({
    this.controller,
    this.onChanged,
    this.onEditingComplete,
    this.inputFormatters,
    this.keyboardType,
    this.focusNode,
    this.hintText,
    this.title,
    this.subtitle,
    this.textInputAction,
    this.action,
    this.readOnly = false,
    this.canRequestFocus = true,
    super.key,
  });

  /// Fields from [TextField]
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final String? hintText;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final bool canRequestFocus;

  /// Custom title and subtitle that displays above input
  final String? title;
  final String? subtitle;

  /// Widget that displays right from input
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleWidget = title != null || subtitle != null
        ? Text.rich(
            TextSpan(
              children: [
                if (title != null) TextSpan(text: title, style: textTheme.titleMedium),
                const WidgetSpan(child: SizedBox(width: 2)),
                if (subtitle != null)
                  TextSpan(
                    text: subtitle,
                    style: textTheme.titleSmall?.copyWith(color: Colors.grey),
                  ),
              ],
            ),
          )
        : null;

    Widget input = TextField(
      controller: controller,
      canRequestFocus: canRequestFocus,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      focusNode: focusNode,
      textInputAction: textInputAction,
      cursorRadius: const Radius.circular(90),
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[400]),
      ),
    );
    if (action != null) {
      input = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: input),
          const SizedBox(width: 4),
          action!,
        ],
      );
    }

    return titleWidget == null
        ? input
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleWidget,
              const SizedBox(height: 4),
              input,
            ],
          );
  }
}
