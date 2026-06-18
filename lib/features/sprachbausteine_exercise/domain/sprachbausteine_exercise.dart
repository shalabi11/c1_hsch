import 'sprachbausteine_paragraph.dart';
import 'sprachbausteine_question.dart';

class SprachbausteineExercise {
  final int sectionId;
  final int modelId;
  final String sectionName;
  final String modelName;
  final String level;
  final List<SprachbausteineParagraph> paragraphs;
  final List<SprachbausteineQuestion> questions;

  const SprachbausteineExercise({
    required this.sectionId,
    required this.modelId,
    required this.sectionName,
    required this.modelName,
    required this.level,
    required this.paragraphs,
    required this.questions,
  });

  factory SprachbausteineExercise.fromJson(Map<String, dynamic> json) {
    final meta = json['meta'] as Map<String, dynamic>? ?? {};
    final paragraphsJson = json['paragraphs'] as List<dynamic>? ?? [];
    final questionsJson = json['questions'] as List<dynamic>? ?? [];

    return SprachbausteineExercise(
      sectionId: meta['section'] as int? ?? 0,
      modelId: meta['model'] as int? ?? 0,
      sectionName: meta['section_name']?.toString() ?? '',
      modelName: meta['model_name']?.toString() ?? '',
      level: meta['level']?.toString() ?? '',
      paragraphs: paragraphsJson
          .map((e) => SprachbausteineParagraph.fromJson(e as Map<String, dynamic>))
          .toList(),
      questions: questionsJson
          .map((e) => SprachbausteineQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
