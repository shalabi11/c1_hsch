// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hv1_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HV1StatementImpl _$$HV1StatementImplFromJson(Map<String, dynamic> json) =>
    _$HV1StatementImpl(
      letter: json['letter'] as String,
      text: json['text'] as String,
      translation: json['translation'] as String,
    );

Map<String, dynamic> _$$HV1StatementImplToJson(_$HV1StatementImpl instance) =>
    <String, dynamic>{
      'letter': instance.letter,
      'text': instance.text,
      'translation': instance.translation,
    };

_$HV1AnswerImpl _$$HV1AnswerImplFromJson(Map<String, dynamic> json) =>
    _$HV1AnswerImpl(
      id: (json['id'] as num).toInt(),
      speaker: (json['speaker'] as num).toInt(),
      correctLetter: json['correctLetter'] as String,
    );

Map<String, dynamic> _$$HV1AnswerImplToJson(_$HV1AnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'speaker': instance.speaker,
      'correctLetter': instance.correctLetter,
    };

_$HV1ExerciseImpl _$$HV1ExerciseImplFromJson(Map<String, dynamic> json) =>
    _$HV1ExerciseImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      telegramLink: json['telegramLink'] as String,
      statements: (json['statements'] as List<dynamic>)
          .map((e) => HV1Statement.fromJson(e as Map<String, dynamic>))
          .toList(),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => HV1Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HV1ExerciseImplToJson(_$HV1ExerciseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'telegramLink': instance.telegramLink,
      'statements': instance.statements,
      'answers': instance.answers,
    };
