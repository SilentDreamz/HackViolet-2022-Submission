import 'package:flutter/material.dart';

class WomenSCAnswerPage extends StatelessWidget {
  const WomenSCAnswerPage(
      {Key? key, this.data, this.quesIndex = 0, this.correct = false})
      : super(key: key);

  final Data data;
  final int quesIndex;
  final bool correct;

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
            children: [
              Text(data),
              ElevatedButton(
                onPressed: () {
                  if (this.quesIndex + 1 != this.data.quiz.length) {
                    Navigator.pushNamed(context, '/womenscquiz',
                        arguments: {data, quesIndex + 1});
                  }

                  Navigator.pushNamed(context, '/womenscconclusion');
                },
                child: Text(data.ans3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
