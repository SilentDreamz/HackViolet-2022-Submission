import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hackviolet_submission/models/women_sc.dart';
import 'package:hackviolet_submission/models/women_sc_quiz.dart';
import 'package:hackviolet_submission/screens/womensc/women_sc_answer_page.dart';

class WomenSCQuizPage extends StatefulWidget {
  const WomenSCQuizPage(
      {Key? key,
      required this.data,
      this.quesIndex = 0,
      required this.wholeData,
      required this.conclusion})
      : super(key: key);

  final WomenSCQuiz data;
  final int quesIndex;
  final List<WomenSCQuiz> wholeData;
  final String conclusion;

  @override
  State<WomenSCQuizPage> createState() => _WomenSCQuizPageState();
}

class _WomenSCQuizPageState extends State<WomenSCQuizPage> {
  List<String> localMCQ = [];

  @override
  void initState() {
    super.initState();

    List<String> currMcq = [];

    int randomed = Random().nextInt(widget.data.wrong.length);

    for (var i = 0; i < widget.data.wrong.length; i++) {
      i == randomed
          ? currMcq.add(widget.data.correct)
          : currMcq.add(widget.data.wrong[i]);
    }

    setState(() {
      localMCQ = currMcq;
    });
  }

  // TODO Functions to check answer correct or not, and then push to
  void checkAnswerAndPush(ans, ctx) {
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(
        builder: (context) => WomenSCAnswerPage(
              data: widget.data,
              quesIndex: widget.quesIndex,
              correct: ans == widget.data.correct,
              wholeData: widget.wholeData,
              conclusion: widget.conclusion,
            )));
    // arguments: {widget.data, widget.quesIndex, ans == widget.data.correct});
  }

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
        // appBar: AppBar(
        //   title: Text(data.name),
        // ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                localMCQ.isEmpty
                    ? const Text("Loading")
                    : Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(0.0),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(13, 71, 161, 1),
                                borderRadius: BorderRadius.circular(16.0)),
                            child: Text(
                              widget.data.question,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Color.fromRGBO(224, 247, 250, 1),
                                  fontSize: 50),
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                checkAnswerAndPush(localMCQ[0], context);
                              },
                              child: Text(localMCQ[0],
                                  style: const TextStyle(fontSize: 40))),
                          const SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                checkAnswerAndPush(localMCQ[1], context);
                              },
                              child: Text(localMCQ[1],
                                  style: const TextStyle(fontSize: 40))),
                          const SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                checkAnswerAndPush(localMCQ[2], context);
                              },
                              child: Text(localMCQ[2],
                                  style: const TextStyle(fontSize: 40))),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
              ]),
        ),
      ),
    );
  }
}
