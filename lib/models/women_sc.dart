import 'women_sc_quiz.dart';

class WomenSC {
  String name;
  String imageUrl;
  List<WomenSCQuiz> quiz;

  WomenSC({required this.name, required this.imageUrl, required this.quiz});

  factory WomenSC.fromJson(Map<String, dynamic> json) {
    List<WomenSCQuiz> quiz = (json['quiz'] as List).map((q) => WomenSCQuiz.fromJson(q)).toList();
    return WomenSC(name: json['name'], imageUrl: json['imageUrl'], quiz: quiz);
  }
}
