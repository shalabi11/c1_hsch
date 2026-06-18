import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/localization/locale_provider.dart';
import '../../exercise/presentation/widgets/score_circle.dart';
import '../../exercise/presentation/widgets/results_action_buttons.dart';
import '../domain/hv1_exercise.dart';
import 'hv1_exercise_notifier.dart';
import 'hv1_exercise_state.dart';
import 'widgets/hv1_breakdown_card.dart';

class HV1ResultsScreen extends ConsumerWidget {
  final int sectionId;
  final int modelId;
  final String slug;

  const HV1ResultsScreen({
    super.key,
    required this.sectionId,
    required this.modelId,
    required this.slug,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = HV1ExerciseParams(sectionId: sectionId, slug: slug);
    final state = ref.watch(hv1ExerciseProvider(params));

    return state.exercise.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (err, _) => Scaffold(
        body: Center(child: Text(err.toString())),
      ),
      data: (exercise) => _HV1ResultsBody(
        exercise: exercise,
        state: state,
        sectionId: sectionId,
        modelId: modelId,
        slug: slug,
      ),
    );
  }
}

class _HV1ResultsBody extends ConsumerWidget {
  const _HV1ResultsBody({
    required this.exercise,
    required this.state,
    required this.sectionId,
    required this.modelId,
    required this.slug,
  });

  final HV1Exercise exercise;
  final HV1ExerciseState state;
  final int sectionId;
  final int modelId;
  final String slug;

  int _getCorrectSpeaker(String letter) {
    try {
      return exercise.answers.firstWhere((a) => a.correctLetter.toLowerCase() == letter.toLowerCase()).speaker;
    } catch (_) {
      return -1;
    }
  }

  int get _correctCount {
    int count = 0;
    state.selectedAnswers.forEach((letter, speaker) {
      if (speaker == _getCorrectSpeaker(letter)) {
        count++;
      }
    });
    return count;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final correct = _correctCount;
    final total = 8; // There are 8 speakers to match
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.accent),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/sections');
            }
          },
        ),
        title: Text(
          isArabic ? 'النتيجة النهائية' : 'Endergebnis',
          style: AppTextStyles.headingLarge.copyWith(
            color: AppColors.accent,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton(
              onPressed: () {
                ref.read(localeProvider.notifier).toggleLocale();
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: AppColors.surface,
              ),
              child: Text(
                'DE | AR',
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: AppColors.border,
            height: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ScoreCircle(correct: correct, total: total),
                  const SizedBox(height: 24),
                  
                  HV1BreakdownCard(
                    exercise: exercise,
                    state: state,
                    getCorrectSpeaker: _getCorrectSpeaker,
                  ),
                  
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ResultsActionButtons(
                      sectionId: sectionId,
                      modelId: modelId,
                      onRetry: () {
                        ref.read(hv1ExerciseProvider(HV1ExerciseParams(sectionId: sectionId, slug: slug)).notifier).reset();
                        context.pushReplacement('/hv1_exercise/$sectionId/$modelId?slug=$slug');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
