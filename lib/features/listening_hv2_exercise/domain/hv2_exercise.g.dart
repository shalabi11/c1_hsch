// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hv2_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HV2ItemImpl _$$HV2ItemImplFromJson(Map<String, dynamic> json) =>
    _$HV2ItemImpl(
      id: (json['id'] as num).toInt(),
      question: json['question'] as String,
      questionTranslation: json['questionTranslation'] as String,
      answer: json['answer'] as String,
      answerTranslation: json['answerTranslation'] as String,
    );

Map<String, dynamic> _$$HV2ItemImplToJson(_$HV2ItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'questionTranslation': instance.questionTranslation,
      'answer': instance.answer,
      'answerTranslation': instance.answerTranslation,
    };

_$HV2ExerciseImpl _$$HV2ExerciseImplFromJson(Map<String, dynamic> json) =>
    _$HV2ExerciseImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      telegramLink: json['telegramLink'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => HV2Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HV2ExerciseImplToJson(_$HV2ExerciseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'telegramLink': instance.telegramLink,
      'items': instance.items,
    };
