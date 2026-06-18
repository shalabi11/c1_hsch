import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/hv2_exercise_repository.dart';
import 'hv2_exercise_state.dart';

class HV2ExerciseParams {
  final int sectionId;
  final String slug;

  HV2ExerciseParams({required this.sectionId, required this.slug});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HV2ExerciseParams &&
          runtimeType == other.runtimeType &&
          sectionId == other.sectionId &&
          slug == other.slug;

  @override
  int get hashCode => sectionId.hashCode ^ slug.hashCode;
}

class HV2ExerciseNotifier extends StateNotifier<HV2ExerciseState> {
  final HV2ExerciseRepository _repository;
  final HV2ExerciseParams _params;

  HV2ExerciseNotifier(this._repository, this._params) : super(const HV2ExerciseState()) {
    _loadExercise();
  }

  Future<void> _loadExercise() async {
    state = state.copyWith(exercise: const AsyncValue.loading());
    try {
      final exercise = await _repository.getExercise(_params.sectionId, _params.slug);
      state = state.copyWith(exercise: AsyncValue.data(exercise));
    } catch (e, st) {
      state = state.copyWith(exercise: AsyncValue.error(e, st));
    }
  }
}

final hv2ExerciseProvider = StateNotifierProvider.family<HV2ExerciseNotifier, HV2ExerciseState, HV2ExerciseParams>((ref, params) {
  final repository = ref.watch(hv2ExerciseRepositoryProvider);
  return HV2ExerciseNotifier(repository, params);
});
