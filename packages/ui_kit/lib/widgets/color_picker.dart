import 'widgets.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

/// Class with localization strings for [ColorPickerWidget]
abstract class ColorPickerWidgetTexts {
  /// Title for tile that should ask user to change color
  /// TODO: LocaleKeys.eventColorTitle.tr()
  String get eventColorTitle;

  /// Text for button that allows user to change color
  /// TODO: LocaleKeys.changeWord.tr()
  String get changeWord;
}

/// Widget that lets you select color via ColorPicker
class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({
    required this.color,
    required this.onSelected,
    required this.texts,
    super.key,
  });

  final Color color;
  final ValueChanged<Color> onSelected;
  final ColorPickerWidgetTexts texts;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(texts.eventColorTitle, style: Theme.of(context).textTheme.titleMedium),
        Row(
          children: [
            EventColorWidget.big(color: color),
            const SizedBox(width: 8),
            PrimaryTextButton(
              onPressed: () async {
                final newColor = await showColorPickerDialog(
                  context,
                  color,
                  pickersEnabled: {
                    ColorPickerType.wheel: true,
                    ColorPickerType.accent: false,
                    ColorPickerType.primary: false,
                  },
                );

                if (newColor != color) {
                  onSelected(newColor);
                }
              },
              text: texts.changeWord,
            ),
          ],
        ),
      ],
    );
  }
}
