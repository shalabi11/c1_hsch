// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hv1_exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HV1Statement _$HV1StatementFromJson(Map<String, dynamic> json) {
  return _HV1Statement.fromJson(json);
}

/// @nodoc
mixin _$HV1Statement {
  String get letter => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get translation => throw _privateConstructorUsedError;

  /// Serializes this HV1Statement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HV1Statement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HV1StatementCopyWith<HV1Statement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HV1StatementCopyWith<$Res> {
  factory $HV1StatementCopyWith(
          HV1Statement value, $Res Function(HV1Statement) then) =
      _$HV1StatementCopyWithImpl<$Res, HV1Statement>;
  @useResult
  $Res call({String letter, String text, String translation});
}

/// @nodoc
class _$HV1StatementCopyWithImpl<$Res, $Val extends HV1Statement>
    implements $HV1StatementCopyWith<$Res> {
  _$HV1StatementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HV1Statement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? letter = null,
    Object? text = null,
    Object? translation = null,
  }) {
    return _then(_value.copyWith(
      letter: null == letter
          ? _value.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HV1StatementImplCopyWith<$Res>
    implements $HV1StatementCopyWith<$Res> {
  factory _$$HV1StatementImplCopyWith(
          _$HV1StatementImpl value, $Res Function(_$HV1StatementImpl) then) =
      __$$HV1StatementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String letter, String text, String translation});
}

/// @nodoc
class __$$HV1StatementImplCopyWithImpl<$Res>
    extends _$HV1StatementCopyWithImpl<$Res, _$HV1StatementImpl>
    implements _$$HV1StatementImplCopyWith<$Res> {
  __$$HV1StatementImplCopyWithImpl(
      _$HV1StatementImpl _value, $Res Function(_$HV1StatementImpl) _then)
      : super(_value, _then);

  /// Create a copy of HV1Statement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? letter = null,
    Object? text = null,
    Object? translation = null,
  }) {
    return _then(_$HV1StatementImpl(
      letter: null == letter
          ? _value.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HV1StatementImpl implements _HV1Statement {
  const _$HV1StatementImpl(
      {required this.letter, required this.text, required this.translation});

  factory _$HV1StatementImpl.fromJson(Map<String, dynamic> json) =>
      _$$HV1StatementImplFromJson(json);

  @override
  final String letter;
  @override
  final String text;
  @override
  final String translation;

  @override
  String toString() {
    return 'HV1Statement(letter: $letter, text: $text, translation: $translation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HV1StatementImpl &&
            (identical(other.letter, letter) || other.letter == letter) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.translation, translation) ||
                other.translation == translation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, letter, text, translation);

  /// Create a copy of HV1Statement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HV1StatementImplCopyWith<_$HV1StatementImpl> get copyWith =>
      __$$HV1StatementImplCopyWithImpl<_$HV1StatementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HV1StatementImplToJson(
      this,
    );
  }
}

abstract class _HV1Statement implements HV1Statement {
  const factory _HV1Statement(
      {required final String letter,
      required final String text,
      required final String translation}) = _$HV1StatementImpl;

  factory _HV1Statement.fromJson(Map<String, dynamic> json) =
      _$HV1StatementImpl.fromJson;

  @override
  String get letter;
  @override
  String get text;
  @override
  String get translation;

  /// Create a copy of HV1Statement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HV1StatementImplCopyWith<_$HV1StatementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HV1Answer _$HV1AnswerFromJson(Map<String, dynamic> json) {
  return _HV1Answer.fromJson(json);
}

/// @nodoc
mixin _$HV1Answer {
  int get id => throw _privateConstructorUsedError;
  int get speaker => throw _privateConstructorUsedError;
  String get correctLetter => throw _privateConstructorUsedError;

  /// Serializes this HV1Answer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HV1Answer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HV1AnswerCopyWith<HV1Answer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HV1AnswerCopyWith<$Res> {
  factory $HV1AnswerCopyWith(HV1Answer value, $Res Function(HV1Answer) then) =
      _$HV1AnswerCopyWithImpl<$Res, HV1Answer>;
  @useResult
  $Res call({int id, int speaker, String correctLetter});
}

/// @nodoc
class _$HV1AnswerCopyWithImpl<$Res, $Val extends HV1Answer>
    implements $HV1AnswerCopyWith<$Res> {
  _$HV1AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HV1Answer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? speaker = null,
    Object? correctLetter = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      speaker: null == speaker
          ? _value.speaker
          : speaker // ignore: cast_nullable_to_non_nullable
              as int,
      correctLetter: null == correctLetter
          ? _value.correctLetter
          : correctLetter // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HV1AnswerImplCopyWith<$Res>
    implements $HV1AnswerCopyWith<$Res> {
  factory _$$HV1AnswerImplCopyWith(
          _$HV1AnswerImpl value, $Res Function(_$HV1AnswerImpl) then) =
      __$$HV1AnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int speaker, String correctLetter});
}

/// @nodoc
class __$$HV1AnswerImplCopyWithImpl<$Res>
    extends _$HV1AnswerCopyWithImpl<$Res, _$HV1AnswerImpl>
    implements _$$HV1AnswerImplCopyWith<$Res> {
  __$$HV1AnswerImplCopyWithImpl(
      _$HV1AnswerImpl _value, $Res Function(_$HV1AnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of HV1Answer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? speaker = null,
    Object? correctLetter = null,
  }) {
    return _then(_$HV1AnswerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      speaker: null == speaker
          ? _value.speaker
          : speaker // ignore: cast_nullable_to_non_nullable
              as int,
      correctLetter: null == correctLetter
          ? _value.correctLetter
          : correctLetter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HV1AnswerImpl implements _HV1Answer {
  const _$HV1AnswerImpl(
      {required this.id, required this.speaker, required this.correctLetter});

  factory _$HV1AnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$HV1AnswerImplFromJson(json);

  @override
  final int id;
  @override
  final int speaker;
  @override
  final String correctLetter;

  @override
  String toString() {
    return 'HV1Answer(id: $id, speaker: $speaker, correctLetter: $correctLetter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HV1AnswerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.speaker, speaker) || other.speaker == speaker) &&
            (identical(other.correctLetter, correctLetter) ||
                other.correctLetter == correctLetter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, speaker, correctLetter);

  /// Create a copy of HV1Answer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HV1AnswerImplCopyWith<_$HV1AnswerImpl> get copyWith =>
      __$$HV1AnswerImplCopyWithImpl<_$HV1AnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HV1AnswerImplToJson(
      this,
    );
  }
}

abstract class _HV1Answer implements HV1Answer {
  const factory _HV1Answer(
      {required final int id,
      required final int speaker,
      required final String correctLetter}) = _$HV1AnswerImpl;

  factory _HV1Answer.fromJson(Map<String, dynamic> json) =
      _$HV1AnswerImpl.fromJson;

  @override
  int get id;
  @override
  int get speaker;
  @override
  String get correctLetter;

  /// Create a copy of HV1Answer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HV1AnswerImplCopyWith<_$HV1AnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HV1Exercise _$HV1ExerciseFromJson(Map<String, dynamic> json) {
  return _HV1Exercise.fromJson(json);
}

/// @nodoc
mixin _$HV1Exercise {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get telegramLink => throw _privateConstructorUsedError;
  List<HV1Statement> get statements => throw _privateConstructorUsedError;
  List<HV1Answer> get answers => throw _privateConstructorUsedError;

  /// Serializes this HV1Exercise to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HV1Exercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HV1ExerciseCopyWith<HV1Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HV1ExerciseCopyWith<$Res> {
  factory $HV1ExerciseCopyWith(
          HV1Exercise value, $Res Function(HV1Exercise) then) =
      _$HV1ExerciseCopyWithImpl<$Res, HV1Exercise>;
  @useResult
  $Res call(
      {String id,
      String title,
      String telegramLink,
      List<HV1Statement> statements,
      List<HV1Answer> answers});
}

/// @nodoc
class _$HV1ExerciseCopyWithImpl<$Res, $Val extends HV1Exercise>
    implements $HV1ExerciseCopyWith<$Res> {
  _$HV1ExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HV1Exercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? telegramLink = null,
    Object? statements = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      telegramLink: null == telegramLink
          ? _value.telegramLink
          : telegramLink // ignore: cast_nullable_to_non_nullable
              as String,
      statements: null == statements
          ? _value.statements
          : statements // ignore: cast_nullable_to_non_nullable
              as List<HV1Statement>,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<HV1Answer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HV1ExerciseImplCopyWith<$Res>
    implements $HV1ExerciseCopyWith<$Res> {
  factory _$$HV1ExerciseImplCopyWith(
          _$HV1ExerciseImpl value, $Res Function(_$HV1ExerciseImpl) then) =
      __$$HV1ExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String telegramLink,
      List<HV1Statement> statements,
      List<HV1Answer> answers});
}

/// @nodoc
class __$$HV1ExerciseImplCopyWithImpl<$Res>
    extends _$HV1ExerciseCopyWithImpl<$Res, _$HV1ExerciseImpl>
    implements _$$HV1ExerciseImplCopyWith<$Res> {
  __$$HV1ExerciseImplCopyWithImpl(
      _$HV1ExerciseImpl _value, $Res Function(_$HV1ExerciseImpl) _then)
      : super(_value, _then);

  /// Create a copy of HV1Exercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? telegramLink = null,
    Object? statements = null,
    Object? answers = null,
  }) {
    return _then(_$HV1ExerciseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      telegramLink: null == telegramLink
          ? _value.telegramLink
          : telegramLink // ignore: cast_nullable_to_non_nullable
              as String,
      statements: null == statements
          ? _value._statements
          : statements // ignore: cast_nullable_to_non_nullable
              as List<HV1Statement>,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<HV1Answer>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HV1ExerciseImpl implements _HV1Exercise {
  const _$HV1ExerciseImpl(
      {required this.id,
      required this.title,
      required this.telegramLink,
      required final List<HV1Statement> statements,
      required final List<HV1Answer> answers})
      : _statements = statements,
        _answers = answers;

  factory _$HV1ExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HV1ExerciseImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String telegramLink;
  final List<HV1Statement> _statements;
  @override
  List<HV1Statement> get statements {
    if (_statements is EqualUnmodifiableListView) return _statements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statements);
  }

  final List<HV1Answer> _answers;
  @override
  List<HV1Answer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'HV1Exercise(id: $id, title: $title, telegramLink: $telegramLink, statements: $statements, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HV1ExerciseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.telegramLink, telegramLink) ||
                other.telegramLink == telegramLink) &&
            const DeepCollectionEquality()
                .equals(other._statements, _statements) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      telegramLink,
      const DeepCollectionEquality().hash(_statements),
      const DeepCollectionEquality().hash(_answers));

  /// Create a copy of HV1Exercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HV1ExerciseImplCopyWith<_$HV1ExerciseImpl> get copyWith =>
      __$$HV1ExerciseImplCopyWithImpl<_$HV1ExerciseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HV1ExerciseImplToJson(
      this,
    );
  }
}

abstract class _HV1Exercise implements HV1Exercise {
  const factory _HV1Exercise(
      {required final String id,
      required final String title,
      required final String telegramLink,
      required final List<HV1Statement> statements,
      required final List<HV1Answer> answers}) = _$HV1ExerciseImpl;

  factory _HV1Exercise.fromJson(Map<String, dynamic> json) =
      _$HV1ExerciseImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get telegramLink;
  @override
  List<HV1Statement> get statements;
  @override
  List<HV1Answer> get answers;

  /// Create a copy of HV1Exercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HV1ExerciseImplCopyWith<_$HV1ExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
