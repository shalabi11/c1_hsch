import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_colors.dart';

import '../../reading_exercise/presentation/widgets/reading_app_bar.dart';
import 'hv2_exercise_notifier.dart';
import 'widgets/hv2_item_card.dart';
import 'widgets/hv2_header_card.dart';

class HV2ExerciseScreen extends ConsumerStatefulWidget {
  final int sectionId;
  final int modelId;
  final String slug;

  const HV2ExerciseScreen({
    super.key,
    required this.sectionId,
    required this.modelId,
    required this.slug,
  });

  @override
  ConsumerState<HV2ExerciseScreen> createState() => _HV2ExerciseScreenState();
}

class _HV2ExerciseScreenState extends ConsumerState<HV2ExerciseScreen> {
  late final HV2ExerciseParams _params;

  @override
  void initState() {
    super.initState();
    _params = HV2ExerciseParams(
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

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(hv2ExerciseProvider(_params));
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
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: const ReadingAppBar(),
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isDesktop ? 800 : 600),
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: exercise.items.length + 1, // +1 for the top header card
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return HV2HeaderCard(
                      telegramLink: exercise.telegramLink,
                      onLaunchTelegram: () => _launchTelegramUrl(exercise.telegramLink),
                    );
                  }
                  
                  final item = exercise.items[index - 1];
                  return HV2ItemCard(item: item);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
