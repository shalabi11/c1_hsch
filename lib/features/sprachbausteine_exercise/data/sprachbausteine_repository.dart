import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/sprachbausteine_exercise.dart';

final sprachbausteineRepositoryProvider = Provider((ref) => SprachbausteineRepository());

class SprachbausteineRepository {
  Future<SprachbausteineExercise> loadExercise(int sectionId, int modelId, String slug) async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/data/section_$sectionId/s${sectionId}_m${modelId}_$slug.json',
      );
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return SprachbausteineExercise.fromJson(jsonMap);
    } catch (e) {
      throw Exception('Failed to load exercise data: $e');
    }
  }
}
