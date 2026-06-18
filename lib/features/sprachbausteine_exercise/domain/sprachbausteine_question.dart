class SprachbausteineQuestion {
  final String number;
  final List<String> options;
  final String correctAnswer;

  const SprachbausteineQuestion({
    required this.number,
    required this.options,
    required this.correctAnswer,
  });

  factory SprachbausteineQuestion.fromJson(Map<String, dynamic> json) {
    return SprachbausteineQuestion(
      number: json['number']?.toString() ?? '',
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      correctAnswer: json['correct_answer']?.toString() ?? '',
    );
  }
}
