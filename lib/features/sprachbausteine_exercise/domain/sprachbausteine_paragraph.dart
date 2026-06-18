class SprachbausteineParagraph {
  final String de;
  final String ar;

  const SprachbausteineParagraph({
    required this.de,
    required this.ar,
  });

  factory SprachbausteineParagraph.fromJson(Map<String, dynamic> json) {
    return SprachbausteineParagraph(
      de: json['de'] as String? ?? '',
      ar: json['ar'] as String? ?? '',
    );
  }
}
