import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/hv2_exercise.dart';
import 'hv2_qa_row.dart';
import 'hv2_translation_panel.dart';

class HV2ItemCard extends StatefulWidget {
  final HV2Item item;

  const HV2ItemCard({
    super.key,
    required this.item,
  });

  @override
  State<HV2ItemCard> createState() => _HV2ItemCardState();
}

class _HV2ItemCardState extends State<HV2ItemCard> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
          width: 0.8,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HV2QARow(
                  text: widget.item.question,
                  iconText: 'Q',
                  color: AppColors.accent,
                  isDesktop: isDesktop,
                ),
                const SizedBox(height: 20),
                HV2QARow(
                  text: widget.item.answer,
                  iconText: 'A',
                  color: AppColors.correct,
                  isDesktop: isDesktop,
                ),
              ],
            ),
          ),
          HV2TranslationPanel(
            isExpanded: _isExpanded,
            item: widget.item,
            onTap: _toggleExpanded,
            isDesktop: isDesktop,
          ),
        ],
      ),
    );
  }
}
