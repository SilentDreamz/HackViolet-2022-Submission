import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/women_sc.dart';

Future<String> loadJson() {
  return rootBundle.loadString('data.json');
}

Future<dynamic> readJson() async {
  final data = await json.decode(await loadJson());
  return data;
}

Future<List<WomenSC>> getWomenLocal() async {
  final data = await readJson();
  List<WomenSC> women = (data['women'] as List)
      .map((q) => WomenSC.fromJson(q))
      .toList();
  return women;
}

const apiURL = '';
const apiPath = 'HackvioletData';

Future<List<WomenSC>> getWomen() async {
  final resp = await http.get(Uri.http(apiURL, apiPath, {'q': 'people'}));
  if (resp.statusCode == 200) {
    List<WomenSC> women = (jsonDecode(resp.body) as List)
        .map((q) => WomenSC.fromJson(q))
        .toList();
    return women;
  } else {
    return List.empty();
  }
}
