// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hv2_exercise_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HV2ExerciseState {
  AsyncValue<HV2Exercise> get exercise => throw _privateConstructorUsedError;

  /// Create a copy of HV2ExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HV2ExerciseStateCopyWith<HV2ExerciseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HV2ExerciseStateCopyWith<$Res> {
  factory $HV2ExerciseStateCopyWith(
          HV2ExerciseState value, $Res Function(HV2ExerciseState) then) =
      _$HV2ExerciseStateCopyWithImpl<$Res, HV2ExerciseState>;
  @useResult
  $Res call({AsyncValue<HV2Exercise> exercise});
}

/// @nodoc
class _$HV2ExerciseStateCopyWithImpl<$Res, $Val extends HV2ExerciseState>
    implements $HV2ExerciseStateCopyWith<$Res> {
  _$HV2ExerciseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HV2ExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercise = null,
  }) {
    return _then(_value.copyWith(
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as AsyncValue<HV2Exercise>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HV2ExerciseStateImplCopyWith<$Res>
    implements $HV2ExerciseStateCopyWith<$Res> {
  factory _$$HV2ExerciseStateImplCopyWith(_$HV2ExerciseStateImpl value,
          $Res Function(_$HV2ExerciseStateImpl) then) =
      __$$HV2ExerciseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<HV2Exercise> exercise});
}

/// @nodoc
class __$$HV2ExerciseStateImplCopyWithImpl<$Res>
    extends _$HV2ExerciseStateCopyWithImpl<$Res, _$HV2ExerciseStateImpl>
    implements _$$HV2ExerciseStateImplCopyWith<$Res> {
  __$$HV2ExerciseStateImplCopyWithImpl(_$HV2ExerciseStateImpl _value,
      $Res Function(_$HV2ExerciseStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HV2ExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercise = null,
  }) {
    return _then(_$HV2ExerciseStateImpl(
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as AsyncValue<HV2Exercise>,
    ));
  }
}

/// @nodoc

class _$HV2ExerciseStateImpl implements _HV2ExerciseState {
  const _$HV2ExerciseStateImpl({this.exercise = const AsyncValue.loading()});

  @override
  @JsonKey()
  final AsyncValue<HV2Exercise> exercise;

  @override
  String toString() {
    return 'HV2ExerciseState(exercise: $exercise)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HV2ExerciseStateImpl &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exercise);

  /// Create a copy of HV2ExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HV2ExerciseStateImplCopyWith<_$HV2ExerciseStateImpl> get copyWith =>
      __$$HV2ExerciseStateImplCopyWithImpl<_$HV2ExerciseStateImpl>(
          this, _$identity);
}

abstract class _HV2ExerciseState implements HV2ExerciseState {
  const factory _HV2ExerciseState({final AsyncValue<HV2Exercise> exercise}) =
      _$HV2ExerciseStateImpl;

  @override
  AsyncValue<HV2Exercise> get exercise;

  /// Create a copy of HV2ExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HV2ExerciseStateImplCopyWith<_$HV2ExerciseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
