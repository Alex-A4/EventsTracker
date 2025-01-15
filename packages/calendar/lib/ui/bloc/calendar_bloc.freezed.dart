// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalendarBlocEvent {
  Map<DateTime, CalendarDayStatistics> get activities =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<DateTime, CalendarDayStatistics> activities)
        updateActivities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<DateTime, CalendarDayStatistics> activities)?
        updateActivities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<DateTime, CalendarDayStatistics> activities)?
        updateActivities,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateActivities value) updateActivities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateActivities value)? updateActivities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateActivities value)? updateActivities,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CalendarBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalendarBlocEventCopyWith<CalendarBlocEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarBlocEventCopyWith<$Res> {
  factory $CalendarBlocEventCopyWith(
          CalendarBlocEvent value, $Res Function(CalendarBlocEvent) then) =
      _$CalendarBlocEventCopyWithImpl<$Res, CalendarBlocEvent>;
  @useResult
  $Res call({Map<DateTime, CalendarDayStatistics> activities});
}

/// @nodoc
class _$CalendarBlocEventCopyWithImpl<$Res, $Val extends CalendarBlocEvent>
    implements $CalendarBlocEventCopyWith<$Res> {
  _$CalendarBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activities = null,
  }) {
    return _then(_value.copyWith(
      activities: null == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, CalendarDayStatistics>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateActivitiesImplCopyWith<$Res>
    implements $CalendarBlocEventCopyWith<$Res> {
  factory _$$UpdateActivitiesImplCopyWith(_$UpdateActivitiesImpl value,
          $Res Function(_$UpdateActivitiesImpl) then) =
      __$$UpdateActivitiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<DateTime, CalendarDayStatistics> activities});
}

/// @nodoc
class __$$UpdateActivitiesImplCopyWithImpl<$Res>
    extends _$CalendarBlocEventCopyWithImpl<$Res, _$UpdateActivitiesImpl>
    implements _$$UpdateActivitiesImplCopyWith<$Res> {
  __$$UpdateActivitiesImplCopyWithImpl(_$UpdateActivitiesImpl _value,
      $Res Function(_$UpdateActivitiesImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activities = null,
  }) {
    return _then(_$UpdateActivitiesImpl(
      null == activities
          ? _value._activities
          : activities // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, CalendarDayStatistics>,
    ));
  }
}

/// @nodoc

class _$UpdateActivitiesImpl implements _UpdateActivities {
  const _$UpdateActivitiesImpl(
      final Map<DateTime, CalendarDayStatistics> activities)
      : _activities = activities;

  final Map<DateTime, CalendarDayStatistics> _activities;
  @override
  Map<DateTime, CalendarDayStatistics> get activities {
    if (_activities is EqualUnmodifiableMapView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_activities);
  }

  @override
  String toString() {
    return 'CalendarBlocEvent.updateActivities(activities: $activities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateActivitiesImpl &&
            const DeepCollectionEquality()
                .equals(other._activities, _activities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_activities));

  /// Create a copy of CalendarBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateActivitiesImplCopyWith<_$UpdateActivitiesImpl> get copyWith =>
      __$$UpdateActivitiesImplCopyWithImpl<_$UpdateActivitiesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<DateTime, CalendarDayStatistics> activities)
        updateActivities,
  }) {
    return updateActivities(activities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<DateTime, CalendarDayStatistics> activities)?
        updateActivities,
  }) {
    return updateActivities?.call(activities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<DateTime, CalendarDayStatistics> activities)?
        updateActivities,
    required TResult orElse(),
  }) {
    if (updateActivities != null) {
      return updateActivities(activities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateActivities value) updateActivities,
  }) {
    return updateActivities(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateActivities value)? updateActivities,
  }) {
    return updateActivities?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateActivities value)? updateActivities,
    required TResult orElse(),
  }) {
    if (updateActivities != null) {
      return updateActivities(this);
    }
    return orElse();
  }
}

abstract class _UpdateActivities implements CalendarBlocEvent {
  const factory _UpdateActivities(
          final Map<DateTime, CalendarDayStatistics> activities) =
      _$UpdateActivitiesImpl;

  @override
  Map<DateTime, CalendarDayStatistics> get activities;

  /// Create a copy of CalendarBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateActivitiesImplCopyWith<_$UpdateActivitiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CalendarBlocState {
  Map<DateTime, CalendarDayStatistics> get activities =>
      throw _privateConstructorUsedError;

  /// Create a copy of CalendarBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalendarBlocStateCopyWith<CalendarBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarBlocStateCopyWith<$Res> {
  factory $CalendarBlocStateCopyWith(
          CalendarBlocState value, $Res Function(CalendarBlocState) then) =
      _$CalendarBlocStateCopyWithImpl<$Res, CalendarBlocState>;
  @useResult
  $Res call({Map<DateTime, CalendarDayStatistics> activities});
}

/// @nodoc
class _$CalendarBlocStateCopyWithImpl<$Res, $Val extends CalendarBlocState>
    implements $CalendarBlocStateCopyWith<$Res> {
  _$CalendarBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activities = null,
  }) {
    return _then(_value.copyWith(
      activities: null == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, CalendarDayStatistics>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StateImplCopyWith<$Res>
    implements $CalendarBlocStateCopyWith<$Res> {
  factory _$$StateImplCopyWith(
          _$StateImpl value, $Res Function(_$StateImpl) then) =
      __$$StateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<DateTime, CalendarDayStatistics> activities});
}

/// @nodoc
class __$$StateImplCopyWithImpl<$Res>
    extends _$CalendarBlocStateCopyWithImpl<$Res, _$StateImpl>
    implements _$$StateImplCopyWith<$Res> {
  __$$StateImplCopyWithImpl(
      _$StateImpl _value, $Res Function(_$StateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activities = null,
  }) {
    return _then(_$StateImpl(
      activities: null == activities
          ? _value._activities
          : activities // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, CalendarDayStatistics>,
    ));
  }
}

/// @nodoc

class _$StateImpl implements _State {
  const _$StateImpl(
      {required final Map<DateTime, CalendarDayStatistics> activities})
      : _activities = activities;

  final Map<DateTime, CalendarDayStatistics> _activities;
  @override
  Map<DateTime, CalendarDayStatistics> get activities {
    if (_activities is EqualUnmodifiableMapView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_activities);
  }

  @override
  String toString() {
    return 'CalendarBlocState(activities: $activities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateImpl &&
            const DeepCollectionEquality()
                .equals(other._activities, _activities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_activities));

  /// Create a copy of CalendarBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StateImplCopyWith<_$StateImpl> get copyWith =>
      __$$StateImplCopyWithImpl<_$StateImpl>(this, _$identity);
}

abstract class _State implements CalendarBlocState {
  const factory _State(
          {required final Map<DateTime, CalendarDayStatistics> activities}) =
      _$StateImpl;

  @override
  Map<DateTime, CalendarDayStatistics> get activities;

  /// Create a copy of CalendarBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StateImplCopyWith<_$StateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
