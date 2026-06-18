import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class DesktopWelcomeBanner extends StatelessWidget {
  const DesktopWelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Willkommen zurück!',
                  style: AppTextStyles.headingLarge.copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.accentDark,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Wähle eine Lektion, um dein Deutsch weiter zu verbessern.',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Icon(Icons.workspace_premium_rounded, size: 80, color: AppColors.accent),
        ],
      ),
    );
  }
}
