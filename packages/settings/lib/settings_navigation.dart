import 'package:flutter/widgets.dart';
import 'package:settings/settings.dart';

/// Adapter that is used in calendar module to incapulate navigation logic
abstract class SettingsNavigationAdapter {
  /// Navigate from settings to edit event screen
  void openEditEvent(BuildContext context, String id);

  /// Shot bottom sheet to confirm removing event
  /// Returns true if user decided to remove event.
  Future<bool> showConfirmRemoveEventSheet(
    BuildContext context,
    EventModelWithStatisticForSettings model,
  );

  /// Open page to add new event if there are no them
  void goToAddEventFromSettings(BuildContext context);
}
