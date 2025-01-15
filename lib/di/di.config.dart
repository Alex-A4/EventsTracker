// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:add_event/add_event.dart' as _i954;
import 'package:calendar/calendar.dart' as _i637;
import 'package:core/core.dart' as _i494;
import 'package:events_tracker/app/services/localization/service/localization_service.dart'
    as _i997;
import 'package:events_tracker/di/modules/add_event_module.dart' as _i494;
import 'package:events_tracker/di/modules/calendar_module.dart' as _i702;
import 'package:events_tracker/di/modules/core_module.dart' as _i488;
import 'package:events_tracker/di/modules/settings_module.dart' as _i1058;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:settings/settings.dart' as _i133;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModule = _$CoreModule();
    final calendarModule = _$CalendarModule();
    final addEventModule = _$AddEventModule();
    final settingsModule = _$SettingsModule();
    await gh.singletonAsync<_i494.SharedWrapper>(
      () => coreModule.sharedWrapper,
      preResolve: true,
    );
    gh.singleton<_i997.LocalizationService>(() => _i997.LocalizationService());
    gh.singleton<_i637.CalendarActivitiesStorage>(
        () => calendarModule.calendarStorage(gh<_i494.SharedWrapper>()));
    gh.singleton<_i954.EventsStorage>(
        () => addEventModule.eventsStorage(gh<_i494.SharedWrapper>()));
    gh.singleton<_i954.AddEventService>(
        () => addEventModule.calendarService(gh<_i954.EventsStorage>()));
    gh.factory<_i637.EventsListAdapter>(
        () => calendarModule.eventsListAdapter(gh<_i954.AddEventService>()));
    gh.singleton<_i637.CalendarActivitiesService>(
        () => calendarModule.calendarActivitiesService(
              gh<_i637.CalendarActivitiesStorage>(),
              gh<_i637.EventsListAdapter>(),
            ));
    gh.factory<_i133.SettingsEventsAdapter>(
        () => settingsModule.settingsEventsAdapter(
              gh<_i637.CalendarActivitiesService>(),
              gh<_i954.AddEventService>(),
            ));
    return this;
  }
}

class _$CoreModule extends _i488.CoreModule {}

class _$CalendarModule extends _i702.CalendarModule {}

class _$AddEventModule extends _i494.AddEventModule {}

class _$SettingsModule extends _i1058.SettingsModule {}
