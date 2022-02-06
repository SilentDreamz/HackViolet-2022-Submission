import 'women_sc_quiz.dart';

class WomenSC {
  String name;
  String imageUrl;
  List<WomenSCQuiz> quiz;
  String conclusion;

  WomenSC(
      {required this.name,
      required this.imageUrl,
      required this.quiz,
      required this.conclusion});

  factory WomenSC.fromJson(Map<String, dynamic> json) {
    List<WomenSCQuiz> quiz =
        (json['quiz'] as List).map((q) => WomenSCQuiz.fromJson(q)).toList();
    return WomenSC(
        name: json['name'],
        imageUrl: json['imageUrl'],
        quiz: quiz,
        conclusion: json['conclusion']);
  }
}
