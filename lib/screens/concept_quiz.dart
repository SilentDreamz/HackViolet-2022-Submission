import 'package:flutter/material.dart';

class CSConcepts extends StatefulWidget {
  @override
  _CSConceptsState createState() => _CSConceptsState();
}

class _CSConceptsState extends State<CSConcepts> {
  List<String> concepts = [
    'Data Types',
    'Conditional Statements',
    'Loops',
    'Functions'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Learn CS Concepts'),
          SizedBox(width: 20),
          Expanded(
            child: ListView.builder(
              itemCount: concepts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: ElevatedButton(
                    child: Text(concepts[index]),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConceptQuiz()));
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ConceptQuiz extends StatefulWidget {
  @override
  _ConceptQuizState createState() => _ConceptQuizState();
}

class _ConceptQuizState extends State<ConceptQuiz> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text('Concept'), Text('Definition'), Text('Example')],
    );
  }
}
