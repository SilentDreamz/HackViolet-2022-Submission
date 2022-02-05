import 'package:flutter/material.dart';

class WomenSCQuizPage extends StatelessWidget {
  const WomenSCQuizPage({Key? key, this.data, this.quesIndex = 0})
      : super(key: key);

  final Data data;
  final int quesIndex;

  // TODO Functions to check answer correct or not, and then push to
  void checkAnswerAndPush(ans, ctx) {
    Navigator.of(ctx).pushNamed('/womenscquiz',
        arguments: {data, quesIndex, ans == data.quizCorrectAns[quesIndex]});
  }

  // make sure backing goes back to menu page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(13, 71, 161, 1),
                  borderRadius: BorderRadius.circular(16.0)),
              child: Text(data.question),
            ),
            ElevatedButton(
                onPressed: () {
                  checkAnswerAndPush(data.ans1, context);
                },
                child: Text(data.ans1)),
            ElevatedButton(
                onPressed: () {
                  checkAnswerAndPush(data.ans2, context);
                },
                child: Text(data.ans2)),
            ElevatedButton(
                onPressed: () {
                  checkAnswerAndPush(data.ans3, context);
                },
                child: Text(data.ans3)),
          ],
        ),
      ),
    );
  }
}
