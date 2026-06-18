import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/sprachbausteine_exercise.dart';
import '../sprachbausteine_notifier.dart';
import '../sprachbausteine_state.dart';

class SprachbausteineTextSection extends ConsumerStatefulWidget {
  final SprachbausteineExercise exercise;
  final SprachbausteineState state;
  final SprachbausteineParams params;

  const SprachbausteineTextSection({
    super.key,
    required this.exercise,
    required this.state,
    required this.params,
  });

  @override
  ConsumerState<SprachbausteineTextSection> createState() => _SprachbausteineTextSectionState();
}

class _SprachbausteineTextSectionState extends ConsumerState<SprachbausteineTextSection> {
  final Map<int, bool> _showTranslation = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: widget.exercise.paragraphs.asMap().entries.map((entry) {
        final index = entry.key;
        final p = entry.value;
        final isShowing = _showTranslation[index] ?? false;
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isShowing ? AppColors.accent.withValues(alpha: 0.02) : AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isShowing ? AppColors.accent.withValues(alpha: 0.15) : AppColors.border,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextWithBlanks(context, p.de, isArabic: false),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    setState(() {
                      _showTranslation[index] = !isShowing;
                    });
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(isShowing ? Icons.expand_less : Icons.translate, size: 18, color: AppColors.accent),
                        const SizedBox(width: 8),
                        Text(
                          isShowing ? 'إخفاء الترجمة' : 'انقر للترجمة',
                          style: AppTextStyles.labelMedium.copyWith(color: AppColors.accent),
                        ),
                      ],
                    ),
                  ),
                ),
                if (isShowing) ...[
                  const SizedBox(height: 16),
                  _buildTextWithBlanks(context, p.ar, isArabic: true),
                ],
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTextWithBlanks(
      BuildContext context, String text,
      {required bool isArabic}) {
    final RegExp regex = RegExp(r'\[(\d+)\]');
    final Iterable<Match> matches = regex.allMatches(text);

    if (matches.isEmpty) {
      return Text(
        text,
        style: AppTextStyles.bodyLarge.copyWith(
          height: 1.6,
          fontFamily: isArabic ? 'Cairo' : null,
        ),
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      );
    }

    int lastMatchEnd = 0;
    final List<InlineSpan> spans = [];

    for (final Match match in matches) {
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
        ));
      }

      final String questionNumber = match.group(1)!;
      spans.add(WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: _buildBlankButton(context, questionNumber),
      ));

      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastMatchEnd),
      ));
    }

    return Text.rich(
      TextSpan(
        style: AppTextStyles.bodyLarge.copyWith(
          height: 1.6,
          fontFamily: isArabic ? 'Cairo' : null,
        ),
        children: spans,
      ),
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
    );
  }

  Widget _buildBlankButton(
      BuildContext context, String questionNumber) {
    final selectedLetter = widget.state.selectedAnswers[questionNumber];
    final isCorrect = widget.state.validationResults[questionNumber];
    
    // Find the question options
    final question = widget.exercise.questions.firstWhere((q) => q.number == questionNumber, orElse: () => widget.exercise.questions.first);

    Color bgColor = AppColors.surface;
    Color borderColor = AppColors.border;
    Color textColor = AppColors.textPrimary;

    if (selectedLetter != null && isCorrect != null) {
      if (isCorrect) {
        bgColor = AppColors.correct.withValues(alpha: 0.1);
        borderColor = AppColors.correct;
        textColor = AppColors.correct;
      } else {
        bgColor = AppColors.wrong.withValues(alpha: 0.1);
        borderColor = AppColors.wrong;
        textColor = AppColors.wrong;
      }
    } else if (selectedLetter != null) {
      bgColor = AppColors.accent.withValues(alpha: 0.1);
      borderColor = AppColors.accent;
      textColor = AppColors.accent;
    }

    // Get the actual word for the selected letter
    String displayString = "[$questionNumber]";
    if (selectedLetter != null) {
       final letterIndex = selectedLetter.toLowerCase().codeUnitAt(0) - 97;
       if (letterIndex >= 0 && letterIndex < question.options.length) {
         displayString = question.options[letterIndex];
       } else {
         displayString = selectedLetter.toUpperCase();
       }
    }

    return GestureDetector(
      onTap: () => _showOptionsBottomSheet(context, questionNumber, question.options),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor),
          boxShadow: [
             BoxShadow(
               color: Colors.black.withValues(alpha: 0.05),
               blurRadius: 2,
               offset: const Offset(0, 1),
             ),
          ]
        ),
        child: Text(
          displayString,
          style: AppTextStyles.bodyMedium.copyWith(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _showOptionsBottomSheet(BuildContext context, String questionNumber, List<String> options) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wähle das richtige Wort für [$questionNumber]',
                  style: AppTextStyles.headingMedium,
                ),
                const SizedBox(height: 16),
                ...List.generate(options.length, (index) {
                  final letter = String.fromCharCode(97 + index); // 'a', 'b', 'c', 'd'
                  final optionText = options[index];
                  final isSelected = widget.state.selectedAnswers[questionNumber] == letter;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: InkWell(
                      onTap: () {
                        ref.read(sprachbausteineProvider(widget.params).notifier).selectAnswer(questionNumber, letter);
                        Navigator.pop(ctx);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? AppColors.accent : AppColors.border,
                            width: isSelected ? 2 : 1,
                          ),
                          color: isSelected ? AppColors.accent.withValues(alpha: 0.05) : null,
                        ),
                        child: Row(
                          children: [
                            Text(
                              '$letter)',
                              style: AppTextStyles.bodyLarge.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isSelected ? AppColors.accent : AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                optionText,
                                style: AppTextStyles.bodyLarge.copyWith(
                                  color: isSelected ? AppColors.accent : AppColors.textPrimary,
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                ),
                              ),
                            ),
                            if (isSelected)
                              Icon(Icons.check_circle, color: AppColors.accent),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
