import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/hv2_exercise.dart';

class HV2TranslationPanel extends StatelessWidget {
  final bool isExpanded;
  final HV2Item item;
  final VoidCallback onTap;
  final bool isDesktop;

  const HV2TranslationPanel({
    super.key,
    required this.isExpanded,
    required this.item,
    required this.onTap,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isExpanded ? AppColors.accent.withValues(alpha: 0.05) : AppColors.surface,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          border: Border(
            top: BorderSide(
              color: AppColors.border,
              width: 0.8,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.translate_rounded,
                  size: 18,
                  color: AppColors.accent,
                ),
                const SizedBox(width: 8),
                Text(
                  l10n.tapToTranslate,
                  style: TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: SizedBox(
                width: double.infinity,
                child: isExpanded
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              item.questionTranslation,
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.textPrimary,
                                height: 1.6,
                                fontSize: isDesktop ? 16 : 14,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              height: 1,
                              color: AppColors.border.withValues(alpha: 0.5),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              item.answerTranslation,
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.correct,
                                fontWeight: FontWeight.w500,
                                height: 1.6,
                                fontSize: isDesktop ? 16 : 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
