import 'package:events_tracker/app/router/router.dart';
import 'package:events_tracker/feature/feature.dart';
import 'package:events_tracker/generated/generated.dart';
import 'package:flutter/widgets.dart';
import 'package:settings/settings.dart';
import 'package:ui_kit/ui_kit.dart';

class SettingsNavigationAdapterImpl implements SettingsNavigationAdapter {
  const SettingsNavigationAdapterImpl();

  @override
  void openEditEvent(BuildContext context, String id) => EditEventRoute(id).go(context);

  @override
  Future<bool> showConfirmRemoveEventSheet(
    BuildContext context,
    EventModelWithStatisticForSettings model,
  ) async {
    final result = await showCommonBottomSheet<bool>(
      context: context,
      title: LocaleKeys.wannaRemoveEvent.tr(),
      body: (_, __) => ConfirmRemoveEventSheet(
        model: model,
        texts: const ConfirmRemoveEventSheetTextsImpl(),
      ),
    );

    return result ?? false;
  }

  @override
  void goToAddEventFromSettings(BuildContext context) => AddEventRoute().go(context);
}
