import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      if (!mounted || _questionsKey.currentContext == null) return;

      final RenderObject? object = _questionsKey.currentContext?.findRenderObject();
      if (object == null || !object.attached) return;
      
      final RenderAbstractViewport? viewport = RenderAbstractViewport.of(object);
      if (viewport == null) return;

      // Get the exact scroll offset where the questions section starts
      final double questionsOffset =
          viewport.getOffsetToReveal(object, 0.0).offset;

      // If our current scroll position is less than the questions offset (minus 200px buffer),
      // we are still reading the text.
      final isCurrentlyAtTop = _scrollController.offset < questionsOffset - 200;

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
          body: SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
          ),
          floatingActionButton: !isDesktop
              ? ReadingJumpFab(
                  isAtTop: _isAtTop,
                  onScrollToQuestions: () {
                    final RenderObject? object = _questionsKey.currentContext?.findRenderObject();
                    if (object == null || !object.attached) return;
                    
                    try {
                      final RenderAbstractViewport? viewport = RenderAbstractViewport.of(object);
                      if (viewport != null) {
                        final double targetOffset = viewport.getOffsetToReveal(object, 0.0).offset;
                        _scrollController.animateTo(
                          targetOffset - 16,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOut,
                        );
                      }
                    } catch (e) {
                      // Fallback in case of viewport errors
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
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
