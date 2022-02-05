import 'package:flutter/material.dart';

class WomenSCQuiz extends StatelessWidget {
  const WomenSCQuiz({Key? key, this.data}) : super(key: key);

  final Data data;

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
                  // color: const Color.fromRGBO(, g, b, opacity)
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
