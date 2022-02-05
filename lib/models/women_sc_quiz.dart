class WomenSCQuiz {
  String question;
  String correct;
  List<String> wrong;

  WomenSCQuiz({required this.question, required this.correct, required this.wrong});

  factory WomenSCQuiz.fromJson(Map<String, dynamic> json) {
    List<String> wrong = (json['wrong'] as List).map((item) => item as String).toList();
    return WomenSCQuiz(question: json['question'], correct: json['correct'], wrong: wrong);
  }
}
