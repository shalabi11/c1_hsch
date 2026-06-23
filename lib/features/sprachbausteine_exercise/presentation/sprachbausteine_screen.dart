import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';

import '../../reading_exercise/presentation/widgets/reading_app_bar.dart';
import 'sprachbausteine_notifier.dart';
import 'widgets/sprachbausteine_text_section.dart';
import '../../../../core/widgets/exercise_instruction_card.dart';

class SprachbausteineScreen extends ConsumerStatefulWidget {
  final int sectionId;
  final int modelId;
  final String slug;

  const SprachbausteineScreen({
    super.key,
    required this.sectionId,
    required this.modelId,
    required this.slug,
  });

  @override
  ConsumerState<SprachbausteineScreen> createState() =>
      _SprachbausteineScreenState();
}

class _SprachbausteineScreenState extends ConsumerState<SprachbausteineScreen> {
  late final SprachbausteineParams _params;

  @override
  void initState() {
    super.initState();
    _params = SprachbausteineParams(
      sectionId: widget.sectionId,
      modelId: widget.modelId,
      slug: widget.slug,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(sprachbausteineProvider(_params), (previous, next) {
      final exercise = next.exercise.valueOrNull;
      if (exercise != null) {
        if (next.selectedAnswers.length == exercise.questions.length &&
            (previous?.selectedAnswers.length ?? 0) <
                exercise.questions.length) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            if (context.mounted) {
              context.pushReplacement(
                  '/sprachbausteine_results/${widget.sectionId}/${widget.modelId}?slug=${widget.slug}');
            }
          });
        }
      }
    });

    final state = ref.watch(sprachbausteineProvider(_params));

    return state.exercise.when(
      loading: () => Scaffold(
        backgroundColor: AppColors.background,
        appBar: const ReadingAppBar(),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Scaffold(
        backgroundColor: AppColors.background,
        appBar: const ReadingAppBar(),
        body: Center(
          child: Text('Fehler beim Laden: $error',
              style: const TextStyle(color: Colors.red)),
        ),
      ),
      data: (exercise) {
        final progress =
            state.selectedAnswers.length / exercise.questions.length;

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: ReadingAppBar(
            title: 'Sprachbausteine',
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.accent.withValues(alpha: 0.1),
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.accent),
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ExerciseInstructionCard(
                  instructionAr: 'اضغط على الفراغ وقم باختيار الإجابة الصحيحة',
                  instructionDe: 'Klicken Sie auf die Lücke und wählen Sie die richtige Antwort aus',
                ),
                SprachbausteineTextSection(
                  exercise: exercise,
                  state: state,
                  params: _params,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
