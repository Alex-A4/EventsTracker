// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_activity_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectActivityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<EventModelWithStatistic> events,
            bool created,
            EventModelWithStatistic? selectedEvent,
            EventTaskWithStatistic? selectedTask,
            int? selectedAmount)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<EventModelWithStatistic> events,
            bool created,
            EventModelWithStatistic? selectedEvent,
            EventTaskWithStatistic? selectedTask,
            int? selectedAmount)?
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<EventModelWithStatistic> events,
            bool created,
            EventModelWithStatistic? selectedEvent,
            EventTaskWithStatistic? selectedTask,
            int? selectedAmount)?
        data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Data value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Data value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectActivityStateCopyWith<$Res> {
  factory $SelectActivityStateCopyWith(
          SelectActivityState value, $Res Function(SelectActivityState) then) =
      _$SelectActivityStateCopyWithImpl<$Res, SelectActivityState>;
}

/// @nodoc
class _$SelectActivityStateCopyWithImpl<$Res, $Val extends SelectActivityState>
    implements $SelectActivityStateCopyWith<$Res> {
  _$SelectActivityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectActivityState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SelectActivityStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectActivityState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SelectActivityState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<EventModelWithStatistic> events,
            bool created,
            EventModelWithStatistic? selectedEvent,
            EventTaskWithStatistic? selectedTask,
            int? selectedAmount)
        data,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<EventModelWithStatistic> events,
            bool created,
            EventModelWithStatistic? selectedEvent,
            EventTaskWithStatistic? selectedTask,
            int? selectedAmount)?
        data,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<EventModelWithStatistic> events,
            bool created,
            EventModelWithStatistic? selectedEvent,
            EventTaskWithStatistic? selectedTask,
            int? selectedAmount)?
        data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Data value) data,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Data value)? data,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SelectActivityState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<EventModelWithStatistic> events,
      bool created,
      EventModelWithStatistic? selectedEvent,
      EventTaskWithStatistic? selectedTask,
      int? selectedAmount});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$SelectActivityStateCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectActivityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? created = null,
    Object? selectedEvent = freezed,
    Object? selectedTask = freezed,
    Object? selectedAmount = freezed,
  }) {
    return _then(_$DataImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventModelWithStatistic>,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedEvent: freezed == selectedEvent
          ? _value.selectedEvent
          : selectedEvent // ignore: cast_nullable_to_non_nullable
              as EventModelWithStatistic?,
      selectedTask: freezed == selectedTask
          ? _value.selectedTask
          : selectedTask // ignore: cast_nullable_to_non_nullable
              as EventTaskWithStatistic?,
      selectedAmount: freezed == selectedAmount
          ? _value.selectedAmount
          : selectedAmount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$DataImpl implements _Data {
  const _$DataImpl(
      {required final List<EventModelWithStatistic> events,
      required this.created,
      this.selectedEvent,
      this.selectedTask,
      this.selectedAmount})
      : _events = events;

  final List<EventModelWithStatistic> _events;
  @override
  List<EventModelWithStatistic> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final bool created;
  @override
  final EventModelWithStatistic? selectedEvent;
  @override
  final EventTaskWithStatistic? selectedTask;
  @override
  final int? selectedAmount;

  @override
  String toString() {
    return 'SelectActivityState.data(events: $events, created: $created, selectedEvent: $selectedEvent, selectedTask: $selectedTask, selectedAmount: $selectedAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.selectedEvent, selectedEvent) ||
                other.selectedEvent == selectedEvent) &&
            (identical(other.selectedTask, selectedTask) ||
                other.selectedTask == selectedTask) &&
            (identical(other.selectedAmount, selectedAmount) ||
                other.selectedAmount == selectedAmount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      created,
      selectedEvent,
      selectedTask,
      selectedAmount);

  /// Create a copy of SelectActivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<EventModelWithStatistic> events,
            bool created,
            EventModelWithStatistic? selectedEvent,
            EventTaskWithStatistic? selectedTask,
            int? selectedAmount)
        data,
  }) {
    return data(events, created, selectedEvent, selectedTask, selectedAmount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<EventModelWithStatistic> events,
            bool created,
            EventModelWithStatistic? selectedEvent,
            EventTaskWithStatistic? selectedTask,
            int? selectedAmount)?
        data,
  }) {
    return data?.call(
        events, created, selectedEvent, selectedTask, selectedAmount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<EventModelWithStatistic> events,
            bool created,
            EventModelWithStatistic? selectedEvent,
            EventTaskWithStatistic? selectedTask,
            int? selectedAmount)?
        data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(events, created, selectedEvent, selectedTask, selectedAmount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Data value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Data value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Data value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data implements SelectActivityState {
  const factory _Data(
      {required final List<EventModelWithStatistic> events,
      required final bool created,
      final EventModelWithStatistic? selectedEvent,
      final EventTaskWithStatistic? selectedTask,
      final int? selectedAmount}) = _$DataImpl;

  List<EventModelWithStatistic> get events;
  bool get created;
  EventModelWithStatistic? get selectedEvent;
  EventTaskWithStatistic? get selectedTask;
  int? get selectedAmount;

  /// Create a copy of SelectActivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
