import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/hv2_exercise.dart';

part 'hv2_exercise_state.freezed.dart';

@freezed
class HV2ExerciseState with _$HV2ExerciseState {
  const factory HV2ExerciseState({
    @Default(AsyncValue.loading()) AsyncValue<HV2Exercise> exercise,
  }) = _HV2ExerciseState;
}
