import 'package:flutter/material.dart';

abstract class AddEventButtonTexts {
  /// Text above button that tells user that there is no events yets
  String get noEventsTitle;

  /// Text for button that tells user to add event
  String get addEventButtonTitle;
}

/// Button that allows navigate to add event screen
class AddEventButton extends StatelessWidget {
  const AddEventButton({
    required this.texts,
    required this.callbackAction,
    super.key,
  });

  final ValueChanged<BuildContext> callbackAction;
  final AddEventButtonTexts texts;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            texts.noEventsTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => callbackAction.call(context),
            child: Text(texts.addEventButtonTitle),
          ),
        ],
      ),
    );
  }
}
