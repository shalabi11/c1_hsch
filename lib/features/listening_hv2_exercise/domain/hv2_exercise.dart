import 'package:freezed_annotation/freezed_annotation.dart';

part 'hv2_exercise.freezed.dart';
part 'hv2_exercise.g.dart';

@freezed
class HV2Item with _$HV2Item {
  const factory HV2Item({
    required int id,
    required String question,
    required String questionTranslation,
    required String answer,
    required String answerTranslation,
  }) = _HV2Item;

  factory HV2Item.fromJson(Map<String, dynamic> json) => _$HV2ItemFromJson(json);
}

@freezed
class HV2Exercise with _$HV2Exercise {
  const factory HV2Exercise({
    required String id,
    required String title,
    required String telegramLink,
    required List<HV2Item> items,
  }) = _HV2Exercise;

  factory HV2Exercise.fromJson(Map<String, dynamic> json) => _$HV2ExerciseFromJson(json);
}
