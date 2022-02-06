import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart ';
import 'package:hackviolet_submission/route_generator.dart';
import 'package:hackviolet_submission/screens/home_page.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      initialRoute: '/',
      onGenerateRoute: RouterGenerator.generateRouteTo,
    );
  }
}
