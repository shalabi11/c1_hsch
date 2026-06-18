import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/hv2_exercise.dart';
import 'hv2_json_parser.dart';

class HV2ExerciseRepository {
  Future<HV2Exercise> getExercise(int sectionId, String slug) async {
    try {
      final String assetPath = 'assets/data/section_$sectionId/$slug.json';
      return await HV2JsonParser.parseFile(assetPath);
    } catch (e) {
      throw Exception('Failed to load HV2 exercise from $slug: $e');
    }
  }
}

final hv2ExerciseRepositoryProvider = Provider<HV2ExerciseRepository>((ref) {
  return HV2ExerciseRepository();
});
