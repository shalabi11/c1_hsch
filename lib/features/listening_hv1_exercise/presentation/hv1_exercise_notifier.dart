import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/hv1_exercise_repository.dart';
import 'hv1_exercise_state.dart';

class HV1ExerciseParams {
  final int sectionId;
  final String slug;

  const HV1ExerciseParams({
    required this.sectionId,
    required this.slug,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HV1ExerciseParams &&
          runtimeType == other.runtimeType &&
          sectionId == other.sectionId &&
          slug == other.slug;

  @override
  int get hashCode => sectionId.hashCode ^ slug.hashCode;
}

final hv1ExerciseProvider = StateNotifierProvider.family<HV1ExerciseNotifier, HV1ExerciseState, HV1ExerciseParams>((ref, params) {
  final repository = ref.watch(hv1ExerciseRepositoryProvider);
  return HV1ExerciseNotifier(
    repository: repository,
    slug: params.slug,
  );
});

class HV1ExerciseNotifier extends StateNotifier<HV1ExerciseState> {
  final HV1ExerciseRepository _repository;
  final String _slug;

  HV1ExerciseNotifier({
    required HV1ExerciseRepository repository,
    required String slug,
  })  : _repository = repository,
        _slug = slug,
        super(const HV1ExerciseState()) {
    loadExercise();
  }

  Future<void> loadExercise() async {
    try {
      state = state.copyWith(exercise: const AsyncValue.loading());
      final exercise = await _repository.getHV1Exercise(_slug);
      state = state.copyWith(exercise: AsyncValue.data(exercise));
    } catch (e, st) {
      state = state.copyWith(exercise: AsyncValue.error(e, st));
    }
  }

  void selectAnswer(String letter, int speaker) {
    final newAnswers = Map<String, int>.from(state.selectedAnswers);
    
    // Remove the speaker from any other letter if they were previously selected
    newAnswers.removeWhere((key, value) => value == speaker);
    
    // Assign the speaker to the new letter
    newAnswers[letter] = speaker;
    
    state = state.copyWith(selectedAnswers: newAnswers);
  }
}
