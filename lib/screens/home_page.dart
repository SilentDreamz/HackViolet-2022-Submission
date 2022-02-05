import 'package:flutter/material.dart';
import 'concept_quiz.dart';
import 'info_dump.dart';

class HomePage extends StatelessWidget {
  final String title = "HackViolet 2022 Submission";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Learn..."),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const InfoDump()));
              },
              child: const Text("Women in Science"),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CSConcepts()));
              },
              child: const Text("CS Concepts"),
            ),
          ],
        ),
      ),
    );
  }
}
