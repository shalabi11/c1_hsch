import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/sprachbausteine_repository.dart';
import 'sprachbausteine_state.dart';
import '../../../core/services/local_storage_service.dart';

final sprachbausteineProvider = StateNotifierProvider.autoDispose.family<SprachbausteineNotifier, SprachbausteineState, SprachbausteineParams>((ref, params) {
  final repository = ref.watch(sprachbausteineRepositoryProvider);
  final localStorage = ref.watch(localStorageServiceProvider);
  return SprachbausteineNotifier(repository, localStorage, params);
});

class SprachbausteineParams {
  final int sectionId;
  final int modelId;
  final String slug;

  SprachbausteineParams({
    required this.sectionId,
    required this.modelId,
    required this.slug,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SprachbausteineParams &&
          runtimeType == other.runtimeType &&
          sectionId == other.sectionId &&
          modelId == other.modelId &&
          slug == other.slug;

  @override
  int get hashCode => sectionId.hashCode ^ modelId.hashCode ^ slug.hashCode;
}

class SprachbausteineNotifier extends StateNotifier<SprachbausteineState> {
  final SprachbausteineRepository _repository;
  final LocalStorageService _localStorage;
  final SprachbausteineParams _params;

  SprachbausteineNotifier(this._repository, this._localStorage, this._params)
      : super(const SprachbausteineState()) {
    _load();
  }

  Future<void> _load() async {
    try {
      final exercise = await _repository.loadExercise(_params.sectionId, _params.modelId, _params.slug);
      
      final savedAnswers = _localStorage.loadSprachbausteineAnswers(_params.sectionId, _params.modelId) ?? const {};
      final savedValidations = _localStorage.loadSprachbausteineValidations(_params.sectionId, _params.modelId) ?? const {};
      
      state = state.copyWith(
        exercise: AsyncValue.data(exercise),
        selectedAnswers: savedAnswers,
        validationResults: savedValidations,
      );
    } catch (e, st) {
      state = state.copyWith(exercise: AsyncValue.error(e, st));
    }
  }

  void selectAnswer(String questionNumber, String selectedLetter) {
    final exerciseOpt = state.exercise.valueOrNull;
    if (exerciseOpt == null) return;

    final question = exerciseOpt.questions.firstWhere((q) => q.number == questionNumber);
    final isCorrect = question.correctAnswer.toLowerCase() == selectedLetter.toLowerCase();

    final newSelectedAnswers = Map<String, String>.from(state.selectedAnswers);
    newSelectedAnswers[questionNumber] = selectedLetter;

    final newValidationResults = Map<String, bool>.from(state.validationResults);
    newValidationResults[questionNumber] = isCorrect;

    _localStorage.saveSprachbausteineAnswers(_params.sectionId, _params.modelId, newSelectedAnswers);
    _localStorage.saveSprachbausteineValidations(_params.sectionId, _params.modelId, newValidationResults);

    state = state.copyWith(
      selectedAnswers: newSelectedAnswers,
      validationResults: newValidationResults,
    );
  }

  void retry() {
    _localStorage.clearSprachbausteineData(_params.sectionId, _params.modelId);
    state = state.copyWith(
      selectedAnswers: const {},
      validationResults: const {},
    );
  }
}
