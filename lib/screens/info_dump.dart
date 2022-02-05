import 'package:flutter/material.dart';
import 'package:hackviolet_submission/datafetcher.dart';

class InfoDump extends StatefulWidget {
  const InfoDump({Key? key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<InfoDump> {
  List people = [];

  Future<void> getData() async {
    final data = await readJson();
    setState(() {
      people = data['women'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Get People'),
              onPressed: getData,
            ),

            people.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: people.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: Text(people[index]["name"]),
                            subtitle: Text(people[index]["description"]),
                          ),
                        );
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  } }
