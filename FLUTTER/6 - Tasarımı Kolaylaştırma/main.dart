import 'package:flutter/material.dart';

import 'drawer_inkwell_kullanimi.dart';
import 'ozelFontKullanimi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'GenelYaziStili',
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer -> sabit menü
      drawer: drawerKullanimi(),
      appBar: AppBar(
        title: Text("Flutter Dersleri"),
      ),
      body: ozelFontKullanimi(),
    );
  }
}