import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import 'widgets/reading_app_bar.dart';
import 'widgets/reading_text_section.dart';
import 'widgets/reading_questions_section.dart';
import 'widgets/reading_jump_fab.dart';
import 'reading_exercise_notifier.dart';

class ReadingExerciseScreen extends ConsumerStatefulWidget {
  final int sectionId;
  final int modelId;
  final String slug;

  const ReadingExerciseScreen({
    super.key,
    required this.sectionId,
    required this.modelId,
    required this.slug,
  });

  @override
  ConsumerState<ReadingExerciseScreen> createState() =>
      _ReadingExerciseScreenState();
}

class _ReadingExerciseScreenState extends ConsumerState<ReadingExerciseScreen> {
  late final ReadingExerciseParams _params;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _questionsKey = GlobalKey();
  bool _isAtTop = true;

  @override
  void initState() {
    super.initState();
    _params = ReadingExerciseParams(
      sectionId: widget.sectionId,
      modelId: widget.modelId,
      slug: widget.slug,
    );
    _scrollController.addListener(() {
      if (!mounted) return;
      
      // Simple and lightweight scroll offset check instead of expensive render tree lookup
      final isCurrentlyAtTop = _scrollController.offset < 300;
      
      if (_isAtTop != isCurrentlyAtTop) {
        setState(() => _isAtTop = isCurrentlyAtTop);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(readingExerciseProvider(_params), (previous, next) {
      final exercise = next.exercise.valueOrNull;
      if (exercise != null) {
        if (next.selectedAnswers.length == exercise.questions.length &&
            (previous?.selectedAnswers.length ?? 0) <
                exercise.questions.length) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            if (context.mounted) {
              context.pushReplacement(
                  '/reading_results/${widget.sectionId}/${widget.modelId}?slug=${widget.slug}');
            }
          });
        }
      }
    });

    final state = ref.watch(readingExerciseProvider(_params));

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
        final isDesktop = MediaQuery.of(context).size.width >= 768;

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: const ReadingAppBar(),
          body: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.all(16.0),
            children: [
              ReadingTextSection(exercise: exercise),
              const SizedBox(height: 16),
              ReadingQuestionsSection(
                exercise: exercise,
                state: state,
                params: _params,
                questionsKey: _questionsKey,
                sectionId: widget.sectionId,
              ),
            ],
          ),
          floatingActionButton: !isDesktop
              ? ReadingJumpFab(
                  isAtTop: _isAtTop,
                  onScrollToQuestions: () {
                    if (_questionsKey.currentContext != null) {
                      Scrollable.ensureVisible(
                        _questionsKey.currentContext!,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        alignment: 0.1,
                      );
                    }
                  },
                  onScrollToTop: () {
                    _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                    );
                  },
                )
              : null,
        );
      },
    );
  }
}
