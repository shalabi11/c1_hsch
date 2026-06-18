import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/hv1_exercise.dart';
import 'hv1_json_parser.dart';

final hv1ExerciseRepositoryProvider = Provider<HV1ExerciseRepository>((ref) {
  return HV1ExerciseRepository(parser: HV1JsonParser());
});

class HV1ExerciseRepository {
  final HV1JsonParser _parser;

  HV1ExerciseRepository({required HV1JsonParser parser}) : _parser = parser;

  Future<HV1Exercise> getHV1Exercise(String slug) async {
    // Determine the asset path based on the slug.
    // The slug should match the filename without the .json extension.
    final assetPath = 'assets/data/section_5/$slug.json';
    return await _parser.parseAsset(assetPath);
  }
}
