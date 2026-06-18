import 'package:flutter/material.dart';
import '../../../../core/constants/app_text_styles.dart';

class HV2QARow extends StatelessWidget {
  final String text;
  final String iconText;
  final Color color;
  final bool isDesktop;

  const HV2QARow({
    super.key,
    required this.text,
    required this.iconText,
    required this.color,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Text(
            iconText,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: iconText == 'Q' ? FontWeight.w600 : FontWeight.w500,
              fontSize: isDesktop ? 18 : 16,
              color: iconText == 'A' ? color : null,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
