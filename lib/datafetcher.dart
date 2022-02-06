import 'dart:developer';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/women_sc.dart';
import 'models/concepts.dart';

Future<String> loadJson() {
  return rootBundle.loadString('data.json');
}

Future<dynamic> readJson() async {
  final data = await json.decode(await loadJson());
  return data;
}

Future<List<WomenSC>> getWomenLocal() async {
  final data = await readJson();
  List<WomenSC> women =
      (data['women'] as List).map((q) => WomenSC.fromJson(q)).toList();
  return women;
}

Future<Map<String, List<Concept>>> getConceptsLocal() async {
  final data = await readJson();
  Map<String, List<Concept>> concepts = {};
  for (var entry in data['concepts'].entries) {
    concepts[entry.key as String] =
        (entry.value as List).map((q) => Concept.fromJson(q)).toList();
  }
  return concepts;
}

String apiURL = dotenv.env['API_URL'] ?? "?????";
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

Future<Map<String, List<Concept>>> getConcepts() async {
  try {
    final resp = await http.get(Uri.http(apiURL, apiPath, {'q': 'concepts'}));
    if (resp.statusCode == 200) {
      Map<String, List<Concept>> concepts = {};
      var data = jsonDecode(resp.body);
      print(data);
      for (var entry in data['concepts'].entries) {
        concepts[entry.key as String] =
            (entry.value as List).map((q) => Concept.fromJson(q)).toList();
      }
      return concepts;
    } else {
      throw Exception('Failed to load concepts');
    }
  } on Exception catch (e) {
    // TODO
//    print(e);
    return {};
  }
}
