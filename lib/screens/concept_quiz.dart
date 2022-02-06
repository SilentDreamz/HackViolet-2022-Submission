import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackviolet_submission/datafetcher.dart';
import 'package:hackviolet_submission/models/concepts.dart';

class CSConcepts extends StatefulWidget {
  @override
  _CSConceptsState createState() => _CSConceptsState();
}

class _CSConceptsState extends State<CSConcepts> {
  late Map<String, dynamic> concepts;

  @override
  void initState() {
    super.initState();
    getConceptsLocal().then((val) {
      setState(() {
        concepts = val;
      });
    });
  }
//  List<String> concepts = [
//    'Data Types',
//    'Conditional Statements',
//    'Loops',
//    'Functions'
//  ];
// Dummy data
//  Map<String, dynamic> concepts = {
//    'Data Types': [
//      new Concept.withoutChildren('Integer', 'Int is 3', 'Eg: int x = 3;'),
//      new Concept.withoutChildren(
//          'String', 'String is "s"', 'Eg: string x = "a";'),
//      new Concept.withoutChildren(
//          'Char', 'char is \'s\'', 'Eg: char x = \'s\';')
//    ],
//    'Conditional Statements ': [
//      new Concept.withoutChildren(
//          'if-else statement', 'if is if', 'Eg: if(mind == smart) print name;'),
//    ],
//    'Loops ': [
//      new Concept.withoutChildren('For loop', 'for is for',
//          'Eg: for(var i = 0; i < 10; i++) print name;'),
//      new Concept.withoutChildren(
//          'While loop', 'for is for', 'Eg: while(i < 10) print name;'),
//      new Concept.withoutChildren(
//          'Do While loop', 'for is for', 'Eg: do{ print name;}while(i < 10);'),
//    ]
//  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn CS Concepts'),
      ),
      body: FutureBuilder(
          future: getConceptsLocal(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ListView.builder(
//              shrinkWrap: true,
                      itemCount: concepts.keys.length,
                      itemBuilder: (context, index) {
                        String key = concepts.keys.elementAt(index);

                        return ListTile(
                          title: Center(
                            child: ElevatedButton(
                              child: Text(key),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ConceptQuiz(
                                              title: key,
                                              concepts: concepts[key],
                                            )));
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: ${snapshot.error}'),
                  ],
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Loading data..."),
                  ],
                ),
              );
            }
          }),
    );
  }
}

class ConceptQuiz extends StatefulWidget {
  ConceptQuiz({this.concepts = const [], this.title = ""});

  final List<Concept> concepts;
  final String title;

  @override
  _ConceptQuizState createState() => _ConceptQuizState();
}

class _ConceptQuizState extends State<ConceptQuiz> {
  int _index = 0;

  void _next() {
    setState(() {
      _index = _index + 1 >= widget.concepts.length ? _index : _index + 1;
    });
  }

  void _previous() {
    setState(() {
      _index = _index - 1 < 0 ? _index : _index - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: IntrinsicWidth(
          stepWidth: 24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            textBaseline: TextBaseline.alphabetic,
//      children: [Text('Concept'), Text('Definition'), Text('Example')],
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  widget.concepts[_index].name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Text(widget.concepts[_index].definition,
                      style: TextStyle(color: Colors.white)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: const Color(0xFF343434),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Text(widget.concepts[_index].example,
                      style: TextStyle(color: const Color(0xFFFF8c00))),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: const Color(0xFF232323),
                  )),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(onPressed: _next, child: Text('Next')),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(onPressed: _previous, child: Text('Previous'))
            ],
          ),
        ),
      ),
    );
  }
}
