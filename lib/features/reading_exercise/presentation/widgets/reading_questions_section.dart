import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/reading_exercise.dart';
import '../reading_exercise_notifier.dart';
import '../reading_exercise_state.dart';
import 'reading_question_card.dart';

class ReadingQuestionsSection extends ConsumerWidget {
  final ReadingExercise exercise;
  final ReadingExerciseState state;
  final ReadingExerciseParams params;
  final GlobalKey questionsKey;
  final int sectionId;

  const ReadingQuestionsSection({
    super.key,
    required this.exercise,
    required this.state,
    required this.params,
    required this.questionsKey,
    required this.sectionId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          key: questionsKey,
          children: [
            Icon(Icons.list_alt, color: AppColors.textPrimary),
            const SizedBox(width: 8),
            Text(
              'Fragen zum Text',
              style: AppTextStyles.headingLarge.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...exercise.questions.map((q) {
          final selectedLetter = state.selectedAnswers[q.number];
          final isCorrect = state.validationResults[q.number];
          final options = sectionId == 3
              ? (q.number == '24' ? ['a', 'b', 'c'] : ['+', '-', 'x'])
              : ['a', 'b', 'c', 'd', 'e'];
          return ReadingQuestionCard(
            number: q.number,
            questionDe: q.de,
            questionAr: q.ar,
            selectedLetter: selectedLetter,
            isCorrect: isCorrect,
            options: options,
            onAnswerSelected: (letter) {
              ref
                  .read(readingExerciseProvider(params).notifier)
                  .selectAnswer(q.number, letter);
            },
          );
        }),
        const SizedBox(height: 24),
      ],
    );
  }
}
