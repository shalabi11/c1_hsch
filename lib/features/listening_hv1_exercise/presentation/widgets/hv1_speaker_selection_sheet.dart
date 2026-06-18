import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../hv1_exercise_notifier.dart';

class HV1SpeakerSelectionSheet extends ConsumerWidget {
  final String letter;
  final Map<String, int> selectedAnswers;
  final HV1ExerciseParams params;

  const HV1SpeakerSelectionSheet({
    super.key,
    required this.letter,
    required this.selectedAnswers,
    required this.params,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    
    // Filter out speakers already assigned to other statements
    final availableSpeakers = List.generate(8, (index) => index + 1).where((speaker) {
      return !selectedAnswers.containsValue(speaker) || selectedAnswers[letter] == speaker;
    }).toList();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isArabic ? 'اختر المتحدث' : 'Wählen Sie den Sprecher',
            textAlign: isArabic ? TextAlign.right : TextAlign.left,
            textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
            style: AppTextStyles.headingMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: availableSpeakers.map((speakerNumber) {
                  final isCurrentlySelected = selectedAnswers[letter] == speakerNumber;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: InkWell(
                      onTap: () {
                        ref.read(hv1ExerciseProvider(params).notifier).selectAnswer(letter, speakerNumber);
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: isCurrentlySelected ? AppColors.accent.withValues(alpha: 0.1) : AppColors.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isCurrentlySelected ? AppColors.accent : AppColors.border,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color: isCurrentlySelected ? AppColors.accent : AppColors.textSecondary,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              isArabic ? 'المتحدث $speakerNumber' : 'Sprecher $speakerNumber',
                              textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isCurrentlySelected ? AppColors.accent : AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
