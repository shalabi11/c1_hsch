import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ReadingJumpFab extends StatelessWidget {
  final bool isAtTop;
  final VoidCallback onScrollToQuestions;
  final VoidCallback onScrollToTop;

  const ReadingJumpFab({
    super.key,
    required this.isAtTop,
    required this.onScrollToQuestions,
    required this.onScrollToTop,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        if (isAtTop) {
          onScrollToQuestions();
        } else {
          onScrollToTop();
        }
      },
      icon: Icon(isAtTop ? Icons.arrow_downward : Icons.arrow_upward),
      label: Text(isAtTop ? 'الأسئلة' : 'النص'),
      backgroundColor: AppColors.accent,
      foregroundColor: Colors.white,
    );
  }
}
