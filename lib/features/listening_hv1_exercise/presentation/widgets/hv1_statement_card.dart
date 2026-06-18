import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/hv1_exercise.dart';

class HV1StatementCard extends StatefulWidget {
  final HV1Statement statement;
  final int? selectedSpeaker;
  final int? correctSpeaker;
  final VoidCallback onChooseSpeaker;

  const HV1StatementCard({
    super.key,
    required this.statement,
    required this.selectedSpeaker,
    required this.correctSpeaker,
    required this.onChooseSpeaker,
  });

  @override
  State<HV1StatementCard> createState() => _HV1StatementCardState();
}

class _HV1StatementCardState extends State<HV1StatementCard> {
  bool _isTranslationVisible = false;

  void _toggleTranslation() {
    setState(() {
      _isTranslationVisible = !_isTranslationVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final isDesktop = MediaQuery.of(context).size.width >= 768;
    
    final bool hasSelection = widget.selectedSpeaker != null;
    final bool isCorrect = hasSelection && widget.selectedSpeaker == widget.correctSpeaker;
    final bool isWrong = hasSelection && !isCorrect;

    Color borderColor = AppColors.border;
    Color bgColor = Theme.of(context).cardColor;
    
    if (isCorrect) {
      borderColor = AppColors.correct;
      bgColor = AppColors.correct.withValues(alpha: 0.05);
    } else if (isWrong) {
      borderColor = AppColors.wrong;
      bgColor = AppColors.wrong.withValues(alpha: 0.05);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: borderColor,
          width: hasSelection ? 1.5 : 0.8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    widget.statement.letter.toUpperCase(),
                    style: TextStyle(
                      color: AppColors.accent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.statement.text,
                        textAlign: TextAlign.left,
                        textDirection: TextDirection.ltr,
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: isDesktop ? 16 : 15,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Actions row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Translate Button
                          IconButton(
                            icon: Icon(
                              _isTranslationVisible ? Icons.translate_rounded : Icons.g_translate_rounded,
                              color: _isTranslationVisible ? AppColors.accent : AppColors.textSecondary,
                            ),
                            onPressed: _toggleTranslation,
                            tooltip: 'ترجمة',
                          ),
                          
                          // Choose Speaker / Selected Speaker display
                          InkWell(
                            onTap: widget.onChooseSpeaker,
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: isCorrect 
                                    ? AppColors.correct 
                                    : (isWrong ? AppColors.wrong : AppColors.accent.withValues(alpha: 0.1)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (hasSelection)
                                    Icon(
                                      isCorrect ? Icons.check_circle : Icons.cancel,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  if (hasSelection) const SizedBox(width: 6),
                                  Text(
                                    hasSelection 
                                        ? (isArabic ? 'المتحدث ${widget.selectedSpeaker}' : 'Sprecher ${widget.selectedSpeaker}')
                                        : (isArabic ? 'اختر المتحدث' : 'Sprecher wählen'),
                                    textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
                                    style: TextStyle(
                                      color: hasSelection ? Colors.white : AppColors.accent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  if (!hasSelection) const SizedBox(width: 6),
                                  if (!hasSelection)
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: AppColors.accent,
                                      size: 16,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: SizedBox(
              width: double.infinity,
              child: _isTranslationVisible
                  ? Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        border: Border(
                          top: BorderSide(
                            color: AppColors.border,
                            width: 0.5,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.statement.translation,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textPrimary,
                          height: 1.6,
                          fontSize: isDesktop ? 16 : 14,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
