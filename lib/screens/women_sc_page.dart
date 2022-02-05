import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackviolet_submission/classes/women_sc.dart';
import 'package:http/http.dart' as http;

Future<WomenSC> fetchWomenSCList() async {
  // TODO Fetch women sc from GCP
  // final res = await http.get("")

  // List<WomenSC> currList = [];

  // if (res.statusCode == 200) {
  //   Map<String, dynamic> data = jsonDecode(res.body)
  //   for(var i = 0; i < data.length; i++) {
  //     // does data processing and create each WomenSC class
  //   }
  // } else {
  //   throw Exception('Failed to load from GCP')
  // }

  return Null;
}

class WomenSCPage extends StatefulWidget {
  const WomenSCPage({Key? key}) : super(key: key);

  @override
  State<WomenSCPage> createState() => _WomenSCPageState();
}

class _WomenSCPageState extends State<WomenSCPage> {
  late Future<List<WomenSC>> womenList;

  // TODO Does logic to grab data off GCP
  @override
  void initState() {
    super.initState();
    womenList = fetchWomenSCList();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
