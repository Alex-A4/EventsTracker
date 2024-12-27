import 'package:flutter/material.dart';
import 'package:settings/settings.dart';
import 'package:ui_kit/ui_kit.dart';

abstract class ConfirmRemoveEventSheetTexts {
  /// Text for button to cancel removing event
  String get cancelWord;

  /// Text for button to confirm removing event
  String get deleteWord;
}

class ConfirmRemoveEventSheet extends StatelessWidget {
  const ConfirmRemoveEventSheet({
    required this.model,
    required this.texts,
    super.key,
  });

  final EventModelWithStatisticForSettings model;
  final ConfirmRemoveEventSheetTexts texts;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: EventColorWidget.medium(color: model.color),
          title: Text(model.eventTitle),
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(texts.cancelWord),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(texts.deleteWord),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
