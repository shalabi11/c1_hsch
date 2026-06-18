import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/sprachbausteine_question.dart';

class SprachbausteineBreakdownCard extends StatelessWidget {
  final List<SprachbausteineQuestion> questions;
  final Map<String, String> selectedAnswers;

  const SprachbausteineBreakdownCard({
    super.key,
    required this.questions,
    required this.selectedAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: questions.map((q) {
          final isLast = q == questions.last;
          final userAnsLetter = selectedAnswers[q.number];
          final correctAnsLetter = q.correctAnswer;
          final isCorrect = userAnsLetter == correctAnsLetter;
          
          String userWord = userAnsLetter ?? '-';
          if (userAnsLetter != null) {
            final letterIndex = userAnsLetter.toLowerCase().codeUnitAt(0) - 97;
            if (letterIndex >= 0 && letterIndex < q.options.length) {
              userWord = q.options[letterIndex];
            }
          }
          
          String correctWord = '-';
          final correctIndex = correctAnsLetter.toLowerCase().codeUnitAt(0) - 97;
          if (correctIndex >= 0 && correctIndex < q.options.length) {
            correctWord = q.options[correctIndex];
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: isCorrect
                            ? AppColors.correct.withValues(alpha: 0.1)
                            : AppColors.wrong.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        q.number,
                        style: AppTextStyles.labelMedium.copyWith(
                          color: isCorrect ? AppColors.correct : AppColors.wrong,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userAnsLetter == null ? 'Nicht beantwortet' : 'Ihre Antwort: $userWord',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: isCorrect ? AppColors.correct : AppColors.wrong,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (!isCorrect) ...[
                            const SizedBox(height: 4),
                            Text(
                              'Richtig: $correctWord',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    Icon(
                      isCorrect ? Icons.check_circle : Icons.cancel,
                      color: isCorrect ? AppColors.correct : AppColors.wrong,
                      size: 20,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.border,
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
