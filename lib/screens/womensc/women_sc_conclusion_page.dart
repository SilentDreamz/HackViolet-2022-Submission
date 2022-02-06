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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(conclusion),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/womensc');
                  },
                  child: const Text("BACK")),
            ],
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
