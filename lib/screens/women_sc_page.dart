import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackviolet_submission/models/women_sc.dart';
import 'package:http/http.dart' as http;
import 'package:hackviolet_submission/datafetcher.dart';

Future<List<WomenSC>> fetchWomenSCList() async {
  // TODO Fetch women sc from GCP
  // final res = await http.get("")

  final res = await readJson();

  List<WomenSC> currList = [];

  for (var i = 0; i < res['women'].length; i++) {
    // does data processing and create each WomenSC class
    currList.add(WomenSC.fromJson(res['women'][i]));
  }

  // For GCP error checking
  // if (res.statusCode == 200) {
  //   Map<String, dynamic> data = jsonDecode(res.body)
  //   for(var i = 0; i < data.length; i++) {
  //     // does data processing and create each WomenSC class
  //   }
  // } else {
  //   throw Exception('Failed to load from GCP')
  // }

  return currList;
}

class WomenSCPage extends StatefulWidget {
  const WomenSCPage({Key? key}) : super(key: key);

  @override
  State<WomenSCPage> createState() => _WomenSCPageState();
}

class _WomenSCPageState extends State<WomenSCPage> {
  late List<WomenSC> womenList;

  // TODO Does logic to grab data off GCP
  @override
  void initState() {
    super.initState();
    fetchWomenSCList().then((val) {
      setState(() {
        womenList = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchWomenSCList(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Women In Science'),
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i in womenList)
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                //workwithOnTaprequest
                              },
                              child: ClipRRect(
                                child: Image.network(
                                  i.imageUrl,
                                  width: 400,
                                ),
                              ),
                            ),
                            Text(i.name),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Women In Science'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Loading data..."),
                  ],
                ),
              ),
            );
          }
        });
  }
}
