import 'package:flutter/material.dart';

class WomenSCConclusionPage extends StatelessWidget {
  const WomenSCConclusionPage({Key? key, required this.conclusion})
      : super(key: key);

  final String conclusion;

  void onBackEvent(ctx) {
    Navigator.popUntil(ctx, ModalRoute.withName('/womensc'));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints(maxWidth: 1500),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(conclusion, style: const TextStyle(fontSize: 40)),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/womensc');
                    },
                    child: const Text("BACK",
                        style: const TextStyle(fontSize: 40))),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        // TODO might need to revisit this
        onBackEvent(context);
        return false;
      },
    );
  }
}
