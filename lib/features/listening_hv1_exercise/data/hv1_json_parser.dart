import 'dart:convert';
import 'package:flutter/services.dart';
import '../domain/hv1_exercise.dart';

class HV1JsonParser {
  Future<HV1Exercise> parseAsset(String assetPath) async {
    final String jsonString = await rootBundle.loadString(assetPath);
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return HV1Exercise.fromJson(jsonMap);
  }
}
