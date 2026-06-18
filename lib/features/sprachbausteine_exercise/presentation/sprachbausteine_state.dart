import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/sprachbausteine_exercise.dart';

part 'sprachbausteine_state.freezed.dart';

@freezed
class SprachbausteineState with _$SprachbausteineState {
  const factory SprachbausteineState({
    @Default(AsyncValue.loading()) AsyncValue<SprachbausteineExercise> exercise,
    @Default({}) Map<String, String> selectedAnswers,
    @Default({}) Map<String, bool> validationResults,
  }) = _SprachbausteineState;
}
