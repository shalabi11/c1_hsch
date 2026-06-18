import 'package:freezed_annotation/freezed_annotation.dart';

part 'hv1_exercise.freezed.dart';
part 'hv1_exercise.g.dart';

@freezed
class HV1Statement with _$HV1Statement {
  const factory HV1Statement({
    required String letter,
    required String text,
    required String translation,
  }) = _HV1Statement;

  factory HV1Statement.fromJson(Map<String, dynamic> json) =>
      _$HV1StatementFromJson(json);
}

@freezed
class HV1Answer with _$HV1Answer {
  const factory HV1Answer({
    required int id,
    required int speaker,
    required String correctLetter,
  }) = _HV1Answer;

  factory HV1Answer.fromJson(Map<String, dynamic> json) =>
      _$HV1AnswerFromJson(json);
}

@freezed
class HV1Exercise with _$HV1Exercise {
  const factory HV1Exercise({
    required String id,
    required String title,
    required String telegramLink,
    required List<HV1Statement> statements,
    required List<HV1Answer> answers,
  }) = _HV1Exercise;

  factory HV1Exercise.fromJson(Map<String, dynamic> json) =>
      _$HV1ExerciseFromJson(json);
}
