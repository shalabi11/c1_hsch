import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/hv1_exercise.dart';
import '../hv1_exercise_state.dart';

class HV1BreakdownCard extends StatelessWidget {
  const HV1BreakdownCard({
    super.key,
    required this.exercise,
    required this.state,
    required this.getCorrectSpeaker,
  });

  final HV1Exercise exercise;
  final HV1ExerciseState state;
  final int Function(String) getCorrectSpeaker;

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            isArabic ? 'تفاصيل الإجابات' : 'Antwortdetails',
            textAlign: isArabic ? TextAlign.right : TextAlign.left,
            style: AppTextStyles.headingMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          ...exercise.statements.where((s) => state.selectedAnswers.containsKey(s.letter)).map((statement) {
            final letter = statement.letter;
            final selected = state.selectedAnswers[letter];
            final correctAns = getCorrectSpeaker(letter);
            final isCorrect = selected == correctAns;

            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: isCorrect ? AppColors.correct.withValues(alpha: 0.1) : AppColors.wrong.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isCorrect ? AppColors.correct : AppColors.wrong,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isCorrect ? Icons.check : Icons.close,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aussage ${letter.toUpperCase()}',
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          isArabic ? 'إجابتك: المتحدث $selected' : 'Deine Antwort: Sprecher $selected',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: isCorrect ? AppColors.correct : AppColors.wrong,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (!isCorrect) ...[
                          const SizedBox(height: 4),
                          Text(
                            isArabic ? 'الإجابة الصحيحة: المتحدث $correctAns' : 'Richtige Antwort: Sprecher $correctAns',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.correct,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
