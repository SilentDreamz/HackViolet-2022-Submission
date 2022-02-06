import 'package:flutter/material.dart';

class Concept {
  final String name;
  final String definition;
  final String example;
  List<Concept> subConcepts;

  Concept(this.name, this.definition, this.example, this.subConcepts);

  // Redirecting the constructor
  Concept.withoutChildren(String name, String definition, String example)
      : this(name, definition, example, []);

  factory Concept.fromJson(Map<String, dynamic> data) {
    // note the explicit cast to String
    // this is required if robust lint rules are enabled

    final name = data['name'] as String;
    final definition = data['definition'] as String;
    final example = data['example'] as String;
    List<Concept> subConcepts = data['subConcepts'] as List<Concept>;

    return Concept(name, definition, example, subConcepts);
  }
}
