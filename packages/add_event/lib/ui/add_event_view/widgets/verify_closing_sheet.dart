import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

abstract class VerifyClosingSheetTexts {
  /// Title for bottom sheet to verify closing screen with form
  /// TODO: LocaleKeys.wannaStopAddingEvent.tr()
  String get wannaStopAddingEvent;

  /// Word in the button to stop form closing
  /// TODO: LocaleKeys.stopWord.tr()
  String get stopWord;

  /// Word in the button to continue form closing
  /// TODO: LocaleKeys.continueWord.tr()
  String get continueWord;
}

/// Returns true if screen must be closed
Future<bool?> showVerifyClosingAddEventSheet(
  BuildContext context,
  VerifyClosingSheetTexts texts,
) {
  return showCommonBottomSheet<bool>(
    context: context,
    title: texts.wannaStopAddingEvent,
    // TODO: add prodiving texts via Provider
    body: (_, __) => VerifyClosingAddEventSheet(texts: texts),
  );
}

class VerifyClosingAddEventSheet extends StatelessWidget {
  const VerifyClosingAddEventSheet({
    required this.texts,
    super.key,
  });

  final VerifyClosingSheetTexts texts;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(texts.stopWord),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(texts.continueWord),
          ),
        ),
      ],
    );
  }
}
