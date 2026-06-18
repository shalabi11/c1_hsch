import 'dart:convert';
import 'package:flutter/services.dart';
import '../domain/hv2_exercise.dart';

class HV2JsonParser {
  static Future<HV2Exercise> parseFile(String assetPath) async {
    final jsonString = await rootBundle.loadString(assetPath);
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    return HV2Exercise.fromJson(jsonMap);
  }
}
