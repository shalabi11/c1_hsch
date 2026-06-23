import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

/// Clean, premium, and bilingual Header for the Sections list.
class SectionsHeader extends StatelessWidget {
  const SectionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 28.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
// 1. Top Badge & Icon Row
          _LevelBadgeAndAnchorRow(),
          SizedBox(height: 14),

          // 2. Beautiful Accent Bar & Title Row
          _TitleWithAccentBar(),
          SizedBox(height: 12),

          // 3. Structured Subtitles with bilingual styling
          _BilingualSubtitles(),
          SizedBox(height: 12),

          // 4. Settings Tip Banner
          _SettingsTipBanner(),
        ],
      ),
    );
  }
}

/// 1. Micro-badge and visual anchor top row.
class _LevelBadgeAndAnchorRow extends StatelessWidget {
  const _LevelBadgeAndAnchorRow();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
// Micro-badge for academic level
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.accent.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.accent.withValues(alpha: 0.25),
              width: 0.8,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star_rounded,
                size: 14,
                color: AppColors.accent,
              ),
              const SizedBox(width: 4),
              Text(
                l10n.c1Level.toUpperCase(),
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.accent,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
// Soft visual anchor icon
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.border,
              width: 0.5,
            ),
          ),
          child: Icon(
            Icons.grid_view_rounded,
            size: 18,
            color: AppColors.accent,
          ),
        ),
      ],
    );
  }
}

/// 2. Accent bar paired with the main Arabic Title.
class _TitleWithAccentBar extends StatelessWidget {
  const _TitleWithAccentBar();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
// Visual indicator bar on the side
        Container(
          width: 4,
          height: 28,
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          l10n.academicSections,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).colorScheme.onSurface,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }
}

/// 3. Bilingual subtitle cards presenting German and Arabic instructions.
class _BilingualSubtitles extends StatelessWidget {
  const _BilingualSubtitles();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isAr = Localizations.localeOf(context).languageCode == 'ar';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
          width: 0.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Icon(
              isAr ? Icons.arrow_left_rounded : Icons.arrow_right_rounded,
              size: 16,
              color: isAr ? AppColors.textSecondary : AppColors.accent,
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              l10n.sectionsSubtitle,
              style: AppTextStyles.bodyMedium.copyWith(
                color: isAr ? AppColors.textSecondary : AppColors.textPrimary,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 4. Settings Tip Banner guiding users to the exam tips.
class _SettingsTipBanner extends StatelessWidget {
  const _SettingsTipBanner();

  @override
  Widget build(BuildContext context) {
    final isAr = Localizations.localeOf(context).languageCode == 'ar';

    return InkWell(
      onTap: () => context.push('/settings?highlight=exam_tips'),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.accent.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.accent.withValues(alpha: 0.3),
            width: 0.5,
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.lightbulb_outline_rounded,
                color: AppColors.accent, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                isAr
                    ? 'لا تنسَ الاطلاع على نصائح الامتحان المهمة في الإعدادات!'
                    : 'Vergiss nicht, die wichtigen Prüfungstipps in den Einstellungen zu lesen!',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.accent,
                  fontWeight: FontWeight.w600,
                ),
                textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
                textAlign: isAr ? TextAlign.right : TextAlign.left,
              ),
            ),
            Icon(
              isAr ? Icons.chevron_left_rounded : Icons.chevron_right_rounded,
              color: AppColors.accent,
            ),
          ],
        ),
      ),
    );
  }
}
