// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hv2_exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HV2Item _$HV2ItemFromJson(Map<String, dynamic> json) {
  return _HV2Item.fromJson(json);
}

/// @nodoc
mixin _$HV2Item {
  int get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get questionTranslation => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String get answerTranslation => throw _privateConstructorUsedError;

  /// Serializes this HV2Item to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HV2Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HV2ItemCopyWith<HV2Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HV2ItemCopyWith<$Res> {
  factory $HV2ItemCopyWith(HV2Item value, $Res Function(HV2Item) then) =
      _$HV2ItemCopyWithImpl<$Res, HV2Item>;
  @useResult
  $Res call(
      {int id,
      String question,
      String questionTranslation,
      String answer,
      String answerTranslation});
}

/// @nodoc
class _$HV2ItemCopyWithImpl<$Res, $Val extends HV2Item>
    implements $HV2ItemCopyWith<$Res> {
  _$HV2ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HV2Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? questionTranslation = null,
    Object? answer = null,
    Object? answerTranslation = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      questionTranslation: null == questionTranslation
          ? _value.questionTranslation
          : questionTranslation // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      answerTranslation: null == answerTranslation
          ? _value.answerTranslation
          : answerTranslation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HV2ItemImplCopyWith<$Res> implements $HV2ItemCopyWith<$Res> {
  factory _$$HV2ItemImplCopyWith(
          _$HV2ItemImpl value, $Res Function(_$HV2ItemImpl) then) =
      __$$HV2ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String question,
      String questionTranslation,
      String answer,
      String answerTranslation});
}

/// @nodoc
class __$$HV2ItemImplCopyWithImpl<$Res>
    extends _$HV2ItemCopyWithImpl<$Res, _$HV2ItemImpl>
    implements _$$HV2ItemImplCopyWith<$Res> {
  __$$HV2ItemImplCopyWithImpl(
      _$HV2ItemImpl _value, $Res Function(_$HV2ItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of HV2Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? questionTranslation = null,
    Object? answer = null,
    Object? answerTranslation = null,
  }) {
    return _then(_$HV2ItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      questionTranslation: null == questionTranslation
          ? _value.questionTranslation
          : questionTranslation // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      answerTranslation: null == answerTranslation
          ? _value.answerTranslation
          : answerTranslation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HV2ItemImpl implements _HV2Item {
  const _$HV2ItemImpl(
      {required this.id,
      required this.question,
      required this.questionTranslation,
      required this.answer,
      required this.answerTranslation});

  factory _$HV2ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$HV2ItemImplFromJson(json);

  @override
  final int id;
  @override
  final String question;
  @override
  final String questionTranslation;
  @override
  final String answer;
  @override
  final String answerTranslation;

  @override
  String toString() {
    return 'HV2Item(id: $id, question: $question, questionTranslation: $questionTranslation, answer: $answer, answerTranslation: $answerTranslation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HV2ItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.questionTranslation, questionTranslation) ||
                other.questionTranslation == questionTranslation) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.answerTranslation, answerTranslation) ||
                other.answerTranslation == answerTranslation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, question,
      questionTranslation, answer, answerTranslation);

  /// Create a copy of HV2Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HV2ItemImplCopyWith<_$HV2ItemImpl> get copyWith =>
      __$$HV2ItemImplCopyWithImpl<_$HV2ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HV2ItemImplToJson(
      this,
    );
  }
}

abstract class _HV2Item implements HV2Item {
  const factory _HV2Item(
      {required final int id,
      required final String question,
      required final String questionTranslation,
      required final String answer,
      required final String answerTranslation}) = _$HV2ItemImpl;

  factory _HV2Item.fromJson(Map<String, dynamic> json) = _$HV2ItemImpl.fromJson;

  @override
  int get id;
  @override
  String get question;
  @override
  String get questionTranslation;
  @override
  String get answer;
  @override
  String get answerTranslation;

  /// Create a copy of HV2Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HV2ItemImplCopyWith<_$HV2ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HV2Exercise _$HV2ExerciseFromJson(Map<String, dynamic> json) {
  return _HV2Exercise.fromJson(json);
}

/// @nodoc
mixin _$HV2Exercise {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get telegramLink => throw _privateConstructorUsedError;
  List<HV2Item> get items => throw _privateConstructorUsedError;

  /// Serializes this HV2Exercise to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HV2Exercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HV2ExerciseCopyWith<HV2Exercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HV2ExerciseCopyWith<$Res> {
  factory $HV2ExerciseCopyWith(
          HV2Exercise value, $Res Function(HV2Exercise) then) =
      _$HV2ExerciseCopyWithImpl<$Res, HV2Exercise>;
  @useResult
  $Res call(
      {String id, String title, String telegramLink, List<HV2Item> items});
}

/// @nodoc
class _$HV2ExerciseCopyWithImpl<$Res, $Val extends HV2Exercise>
    implements $HV2ExerciseCopyWith<$Res> {
  _$HV2ExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HV2Exercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? telegramLink = null,
    Object? items = null,
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
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<HV2Item>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HV2ExerciseImplCopyWith<$Res>
    implements $HV2ExerciseCopyWith<$Res> {
  factory _$$HV2ExerciseImplCopyWith(
          _$HV2ExerciseImpl value, $Res Function(_$HV2ExerciseImpl) then) =
      __$$HV2ExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String title, String telegramLink, List<HV2Item> items});
}

/// @nodoc
class __$$HV2ExerciseImplCopyWithImpl<$Res>
    extends _$HV2ExerciseCopyWithImpl<$Res, _$HV2ExerciseImpl>
    implements _$$HV2ExerciseImplCopyWith<$Res> {
  __$$HV2ExerciseImplCopyWithImpl(
      _$HV2ExerciseImpl _value, $Res Function(_$HV2ExerciseImpl) _then)
      : super(_value, _then);

  /// Create a copy of HV2Exercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? telegramLink = null,
    Object? items = null,
  }) {
    return _then(_$HV2ExerciseImpl(
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
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<HV2Item>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HV2ExerciseImpl implements _HV2Exercise {
  const _$HV2ExerciseImpl(
      {required this.id,
      required this.title,
      required this.telegramLink,
      required final List<HV2Item> items})
      : _items = items;

  factory _$HV2ExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HV2ExerciseImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String telegramLink;
  final List<HV2Item> _items;
  @override
  List<HV2Item> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'HV2Exercise(id: $id, title: $title, telegramLink: $telegramLink, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HV2ExerciseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.telegramLink, telegramLink) ||
                other.telegramLink == telegramLink) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, telegramLink,
      const DeepCollectionEquality().hash(_items));

  /// Create a copy of HV2Exercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HV2ExerciseImplCopyWith<_$HV2ExerciseImpl> get copyWith =>
      __$$HV2ExerciseImplCopyWithImpl<_$HV2ExerciseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HV2ExerciseImplToJson(
      this,
    );
  }
}

abstract class _HV2Exercise implements HV2Exercise {
  const factory _HV2Exercise(
      {required final String id,
      required final String title,
      required final String telegramLink,
      required final List<HV2Item> items}) = _$HV2ExerciseImpl;

  factory _HV2Exercise.fromJson(Map<String, dynamic> json) =
      _$HV2ExerciseImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get telegramLink;
  @override
  List<HV2Item> get items;

  /// Create a copy of HV2Exercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HV2ExerciseImplCopyWith<_$HV2ExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
