import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/hv1_exercise.dart';

part 'hv1_exercise_state.freezed.dart';

@freezed
class HV1ExerciseState with _$HV1ExerciseState {
  const factory HV1ExerciseState({
    @Default(AsyncValue.loading()) AsyncValue<HV1Exercise> exercise,
    @Default({}) Map<String, int> selectedAnswers,
  }) = _HV1ExerciseState;
}
