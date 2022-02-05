import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<String> loadJson() {
  return rootBundle.loadString('data.json');
}

Future<dynamic> readJson() async {
  final data = await json.decode(await loadJson());
  return data;
}
