import 'package:events_tracker/feature/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// Item of dropdown that allows displaying elements in UI.
class SheetDropdownItem<T> {
  SheetDropdownItem({
    required this.value,
    required this.title,
    this.icon,
  });

  final T value;
  final Widget? icon;
  final String title;
}

/// Widget that allows selecting one value from multiple using bottom sheet.
///
/// !!! If [values] contains only 1 item, then sheet will not be able to open.
class SelectDropdown<T> extends StatelessWidget {
  const SelectDropdown({
    required this.values,
    required this.currentValue,
    required this.onChanged,
    this.sheetTitle,
    this.titleText,
    this.subtitleText,
    this.titleChild,
    this.subtitleChild,
    super.key,
  });

  /// List of values that will be used to select [currentValue] using bottom
  /// sheet.
  final List<SheetDropdownItem<T>> values;

  /// Current value that will be displayed.
  /// Value can be null that means, that nothing will be displayed.
  final T? currentValue;

  /// Title that will be displayed for input field.
  final String? titleText;

  /// Widget that can be used to title for input.
  /// In common cases, you will use [titleText].
  final Widget? titleChild;

  /// Subtitle that will be displayed right to title.
  final String? subtitleText;

  /// Widget that can be used to subtitle for input.
  /// In common cases, you will use [subtitleText].
  final Widget? subtitleChild;

  /// Callback that calls when user select new item from sheet.
  final ValueChanged<T> onChanged;

  /// Title that is used in displayed sheet to tell user what to select
  final String? sheetTitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final title = titleChild ??
        (titleText == null
            ? null
            : Text(
                titleText!,
                style: textTheme.titleMedium,
              ));

    final subtitle = subtitleChild ??
        (subtitleText == null
            ? null
            : Text(
                subtitleText!,
                style: textTheme.bodySmall,
              ));

    return PressScaleWidget(
      onPressed: values.length == 1 ? null : () => _openSelectSheet(context),
      child: Column(
        children: [
          if (title != null || subtitle != null) ...[
            Row(
              children: [
                if (title != null) title,
                if (title != null && subtitle != null) const SizedBox(width: 4),
                if (subtitle != null) subtitle,
              ],
            ),
          ],
          Row(
            children: [
              Expanded(
                child: currentValue == null
                    ? const SizedBox.shrink()
                    : _itemBuilder(
                        values.firstWhere((e) => e.value == currentValue),
                      ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.keyboard_arrow_right_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _itemBuilder(
    SheetDropdownItem<T> value, {
    bool isSelected = false,
    VoidCallback? onPressed,
  }) {
    return Builder(
      builder: (context) {
        final style = Theme.of(context).textTheme.bodyMedium;

        return PressScaleWidget(
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                if (value.icon != null) ...[
                  value.icon!,
                  const SizedBox(width: 8),
                ],
                Expanded(child: Text(value.title, style: style)),
                if (isSelected) ...[
                  const SizedBox(width: 8),
                  const Icon(Icons.check_rounded),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  void _openSelectSheet(BuildContext context) {
    showCommonBottomSheet<void>(
      context: context,
      title: sheetTitle,
      body: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: values
                .map(
                  (e) => _itemBuilder(
                    e,
                    isSelected: e == currentValue,
                    onPressed: () {
                      Navigator.of(context).pop();
                      onChanged(e.value);
                    },
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
