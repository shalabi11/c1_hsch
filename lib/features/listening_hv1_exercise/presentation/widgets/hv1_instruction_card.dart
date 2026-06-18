import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class HV1InstructionCard extends StatelessWidget {
  const HV1InstructionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.accent.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: AppColors.accent,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              isArabic 
                  ? 'استمع إلى المقطع الصوتي من الرابط أعلاه، ثم اضغط على كل مقولة لاختيار المتحدث المناسب لها.'
                  : 'Hören Sie sich das Audio über den obigen Link an und ordnen Sie jedem Sprecher die passende Aussage zu.',
              textAlign: isArabic ? TextAlign.right : TextAlign.left,
              textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textPrimary,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
