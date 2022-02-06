import 'package:flutter/material.dart';
import 'package:hackviolet_submission/models/women_sc.dart';
import 'package:hackviolet_submission/models/women_sc_quiz.dart';
import 'package:hackviolet_submission/screens/womensc/women_sc_conclusion_page.dart';
import 'package:hackviolet_submission/screens/womensc/women_sc_quiz_page.dart';

class WomenSCAnswerPage extends StatelessWidget {
  const WomenSCAnswerPage(
      {Key? key,
      required this.data,
      this.quesIndex = 0,
      this.correct = false,
      required this.wholeData,
      required this.conclusion})
      : super(key: key);

  final WomenSCQuiz data;
  final int quesIndex;
  final bool correct;
  final List<WomenSCQuiz> wholeData;
  final String conclusion;

  // make sure backing goes back to menu page
  void onBackEvent(ctx) {
    Navigator.popUntil(ctx, ModalRoute.withName('/womensc'));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // TODO might need to revisit this
        onBackEvent(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: correct
            ? const Color.fromRGBO(0, 200, 81, 1)
            : const Color.fromRGBO(255, 68, 68, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              correct
                  ? const Text("Correct!", style: const TextStyle(fontSize: 50))
                  : const Text('Wrong!', style: const TextStyle(fontSize: 50)),
              Text(data.explanation, style: const TextStyle(fontSize: 40)),
              ElevatedButton(
                onPressed: () {
                  if (quesIndex + 1 != wholeData.length) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WomenSCQuizPage(
                                  data: wholeData[quesIndex + 1],
                                  quesIndex: quesIndex + 1,
                                  wholeData: wholeData,
                                  conclusion: conclusion,
                                )));
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WomenSCConclusionPage(
                                  conclusion: conclusion,
                                )));
                  }
                },
                child: const Text("NEXT", style: const TextStyle(fontSize: 40)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
