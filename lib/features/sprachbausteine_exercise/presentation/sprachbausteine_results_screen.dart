import 'package:c1_hsch/features/exercise/presentation/widgets/results_action_buttons.dart';
import 'package:c1_hsch/features/exercise/presentation/widgets/score_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../domain/sprachbausteine_exercise.dart';
import 'sprachbausteine_notifier.dart';
import 'sprachbausteine_state.dart';
import 'widgets/sprachbausteine_breakdown_card.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/localization/locale_provider.dart';
import '../../../../l10n/app_localizations.dart';

class SprachbausteineResultsScreen extends ConsumerWidget {
  const SprachbausteineResultsScreen({
    super.key,
    required this.sectionId,
    required this.modelId,
    required this.slug,
  });

  final int sectionId;
  final int modelId;
  final String slug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = SprachbausteineParams(
        sectionId: sectionId, modelId: modelId, slug: slug);
    final state = ref.watch(sprachbausteineProvider(params));

    return state.exercise.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (err, _) => Scaffold(
        body: Center(child: Text(err.toString())),
      ),
      data: (exercise) => _SprachbausteineResultsBody(
        exercise: exercise,
        state: state,
        sectionId: sectionId,
        modelId: modelId,
        slug: slug,
        ref: ref,
      ),
    );
  }
}

class _SprachbausteineResultsBody extends StatelessWidget {
  const _SprachbausteineResultsBody({
    required this.exercise,
    required this.state,
    required this.sectionId,
    required this.modelId,
    required this.slug,
    required this.ref,
  });

  final SprachbausteineExercise exercise;
  final SprachbausteineState state;
  final int sectionId;
  final int modelId;
  final String slug;
  final WidgetRef ref;

  int get _correctCount {
    int count = 0;
    for (final question in exercise.questions) {
      if (state.selectedAnswers[question.number] == question.correctAnswer) {
        count++;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    final correct = _correctCount;
    final total = exercise.questions.length;
    final l10n = AppLocalizations.of(context)!;

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
          l10n.resultsScreenTitle,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                  SprachbausteineBreakdownCard(
                    questions: exercise.questions,
                    selectedAnswers: state.selectedAnswers,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ResultsActionButtons(
                      sectionId: sectionId,
                      modelId: modelId,
                      onRetry: () {
                        final params = SprachbausteineParams(
                            sectionId: sectionId, modelId: modelId, slug: slug);
                        ref.read(sprachbausteineProvider(params).notifier).retry();
                        context.pushReplacement(
                            '/sprachbausteine_exercise/$sectionId/$modelId?slug=$slug');
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
