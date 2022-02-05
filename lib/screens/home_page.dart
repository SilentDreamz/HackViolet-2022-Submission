import 'package:flutter/material.dart';
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
                Navigator.of(context).pushNamed('/womensc');
              },
              child: const Text("Women in Science"),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("CS Concepts"),
            ),
          ],
        ),
      ),
    );
  }
}
