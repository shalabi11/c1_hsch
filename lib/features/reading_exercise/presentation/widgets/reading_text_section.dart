import 'package:flutter/material.dart';
import '../../domain/reading_exercise.dart';
import 'reading_header.dart';
import 'reading_paragraph.dart';

class ReadingTextSection extends StatelessWidget {
  final ReadingExercise exercise;

  const ReadingTextSection({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReadingHeader(
          category: exercise.sectionName.toUpperCase(),
          title: exercise.modelName,
        ),
        ...exercise.paragraphs.map((p) => ReadingParagraph(
              letter: p.letter,
              content: p.de,
              translation: p.ar,
            )),
      ],
    );
  }
}
