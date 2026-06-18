// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sprachbausteine_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SprachbausteineState {
  AsyncValue<SprachbausteineExercise> get exercise =>
      throw _privateConstructorUsedError;
  Map<String, String> get selectedAnswers => throw _privateConstructorUsedError;
  Map<String, bool> get validationResults => throw _privateConstructorUsedError;

  /// Create a copy of SprachbausteineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SprachbausteineStateCopyWith<SprachbausteineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SprachbausteineStateCopyWith<$Res> {
  factory $SprachbausteineStateCopyWith(SprachbausteineState value,
          $Res Function(SprachbausteineState) then) =
      _$SprachbausteineStateCopyWithImpl<$Res, SprachbausteineState>;
  @useResult
  $Res call(
      {AsyncValue<SprachbausteineExercise> exercise,
      Map<String, String> selectedAnswers,
      Map<String, bool> validationResults});
}

/// @nodoc
class _$SprachbausteineStateCopyWithImpl<$Res,
        $Val extends SprachbausteineState>
    implements $SprachbausteineStateCopyWith<$Res> {
  _$SprachbausteineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SprachbausteineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercise = null,
    Object? selectedAnswers = null,
    Object? validationResults = null,
  }) {
    return _then(_value.copyWith(
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as AsyncValue<SprachbausteineExercise>,
      selectedAnswers: null == selectedAnswers
          ? _value.selectedAnswers
          : selectedAnswers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      validationResults: null == validationResults
          ? _value.validationResults
          : validationResults // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SprachbausteineStateImplCopyWith<$Res>
    implements $SprachbausteineStateCopyWith<$Res> {
  factory _$$SprachbausteineStateImplCopyWith(_$SprachbausteineStateImpl value,
          $Res Function(_$SprachbausteineStateImpl) then) =
      __$$SprachbausteineStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<SprachbausteineExercise> exercise,
      Map<String, String> selectedAnswers,
      Map<String, bool> validationResults});
}

/// @nodoc
class __$$SprachbausteineStateImplCopyWithImpl<$Res>
    extends _$SprachbausteineStateCopyWithImpl<$Res, _$SprachbausteineStateImpl>
    implements _$$SprachbausteineStateImplCopyWith<$Res> {
  __$$SprachbausteineStateImplCopyWithImpl(_$SprachbausteineStateImpl _value,
      $Res Function(_$SprachbausteineStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SprachbausteineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercise = null,
    Object? selectedAnswers = null,
    Object? validationResults = null,
  }) {
    return _then(_$SprachbausteineStateImpl(
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as AsyncValue<SprachbausteineExercise>,
      selectedAnswers: null == selectedAnswers
          ? _value._selectedAnswers
          : selectedAnswers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      validationResults: null == validationResults
          ? _value._validationResults
          : validationResults // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc

class _$SprachbausteineStateImpl implements _SprachbausteineState {
  const _$SprachbausteineStateImpl(
      {this.exercise = const AsyncValue.loading(),
      final Map<String, String> selectedAnswers = const {},
      final Map<String, bool> validationResults = const {}})
      : _selectedAnswers = selectedAnswers,
        _validationResults = validationResults;

  @override
  @JsonKey()
  final AsyncValue<SprachbausteineExercise> exercise;
  final Map<String, String> _selectedAnswers;
  @override
  @JsonKey()
  Map<String, String> get selectedAnswers {
    if (_selectedAnswers is EqualUnmodifiableMapView) return _selectedAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedAnswers);
  }

  final Map<String, bool> _validationResults;
  @override
  @JsonKey()
  Map<String, bool> get validationResults {
    if (_validationResults is EqualUnmodifiableMapView)
      return _validationResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_validationResults);
  }

  @override
  String toString() {
    return 'SprachbausteineState(exercise: $exercise, selectedAnswers: $selectedAnswers, validationResults: $validationResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SprachbausteineStateImpl &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            const DeepCollectionEquality()
                .equals(other._selectedAnswers, _selectedAnswers) &&
            const DeepCollectionEquality()
                .equals(other._validationResults, _validationResults));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      exercise,
      const DeepCollectionEquality().hash(_selectedAnswers),
      const DeepCollectionEquality().hash(_validationResults));

  /// Create a copy of SprachbausteineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SprachbausteineStateImplCopyWith<_$SprachbausteineStateImpl>
      get copyWith =>
          __$$SprachbausteineStateImplCopyWithImpl<_$SprachbausteineStateImpl>(
              this, _$identity);
}

abstract class _SprachbausteineState implements SprachbausteineState {
  const factory _SprachbausteineState(
      {final AsyncValue<SprachbausteineExercise> exercise,
      final Map<String, String> selectedAnswers,
      final Map<String, bool> validationResults}) = _$SprachbausteineStateImpl;

  @override
  AsyncValue<SprachbausteineExercise> get exercise;
  @override
  Map<String, String> get selectedAnswers;
  @override
  Map<String, bool> get validationResults;

  /// Create a copy of SprachbausteineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SprachbausteineStateImplCopyWith<_$SprachbausteineStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
