import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../reading_exercise/presentation/widgets/reading_app_bar.dart';
import '../../listening_hv2_exercise/presentation/widgets/hv2_header_card.dart';
import '../domain/hv1_exercise.dart';
import 'hv1_exercise_notifier.dart';
import 'widgets/hv1_instruction_card.dart';
import 'widgets/hv1_speaker_selection_sheet.dart';
import 'widgets/hv1_statement_card.dart';

class HV1ExerciseScreen extends ConsumerStatefulWidget {
  final int sectionId;
  final int modelId;
  final String slug;

  const HV1ExerciseScreen({
    super.key,
    required this.sectionId,
    required this.modelId,
    required this.slug,
  });

  @override
  ConsumerState<HV1ExerciseScreen> createState() => _HV1ExerciseScreenState();
}

class _HV1ExerciseScreenState extends ConsumerState<HV1ExerciseScreen> {
  late final HV1ExerciseParams _params;

  @override
  void initState() {
    super.initState();
    _params = HV1ExerciseParams(
      sectionId: widget.sectionId,
      slug: widget.slug,
    );
  }

  Future<void> _launchTelegramUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $urlString')),
        );
      }
    }
  }

  void _showSpeakerSelectionSheet(BuildContext context, String letter, List<HV1Answer> answers, Map<String, int> selectedAnswers) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => HV1SpeakerSelectionSheet(
        letter: letter,
        selectedAnswers: selectedAnswers,
        params: _params,
      ),
    );
  }

  int? _getCorrectSpeaker(String letter, List<HV1Answer> answers) {
    try {
      return answers
          .firstWhere(
              (a) => a.correctLetter.toLowerCase() == letter.toLowerCase())
          .speaker;
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final state = ref.watch(hv1ExerciseProvider(_params));
    final isDesktop = MediaQuery.of(context).size.width >= 768;

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
        final selectedAnswers = state.selectedAnswers;
        final allAnswered = selectedAnswers.length == 8;

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: const ReadingAppBar(),
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isDesktop ? 800 : 600),
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  HV2HeaderCard(
                    telegramLink: exercise.telegramLink,
                    onLaunchTelegram: () =>
                        _launchTelegramUrl(exercise.telegramLink),
                  ),
                  const SizedBox(height: 16),
                  const HV1InstructionCard(),
                  const SizedBox(height: 24),
                  Text(
                    isArabic ? 'المقولات' : 'Die Aussagen',
                    textAlign: isArabic ? TextAlign.right : TextAlign.left,
                    textDirection:
                        isArabic ? TextDirection.rtl : TextDirection.ltr,
                    style: AppTextStyles.headingMedium.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...exercise.statements.map((statement) {
                    final selectedSpeaker = selectedAnswers[statement.letter];
                    final correctSpeaker =
                        _getCorrectSpeaker(statement.letter, exercise.answers);

                    return HV1StatementCard(
                      statement: statement,
                      selectedSpeaker: selectedSpeaker,
                      correctSpeaker: correctSpeaker,
                      onChooseSpeaker: () => _showSpeakerSelectionSheet(context,
                          statement.letter, exercise.answers, selectedAnswers),
                    );
                  }),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: allAnswered
                        ? () {
                            context.push(
                                '/results/${widget.sectionId}/${widget.modelId}?slug=${widget.slug}');
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      disabledBackgroundColor: AppColors.border,
                    ),
                    child: Text(
                      isArabic ? 'عرض النتائج' : 'Ergebnisse anzeigen',
                      textAlign: isArabic ? TextAlign.right : TextAlign.left,
                      textDirection:
                          isArabic ? TextDirection.rtl : TextDirection.ltr,
                      style: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
