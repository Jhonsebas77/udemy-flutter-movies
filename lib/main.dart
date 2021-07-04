import 'package:flutter/material.dart';
import 'package:movies_app/src/screens/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        '/detail': (BuildContext context) => DetailMovie(),
      },
    );
  }
}
