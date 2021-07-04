import 'package:flutter/material.dart';
import 'package:hello_word/image_widgets.dart';

import 'my_counter_page.dart';

void main() {
  debugPrint('main metodu çalıştı');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('myapp build çalıştı');
    return MaterialApp(
      title: 'My Counter App',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: //hazır temalar
              TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Örnekleri'),
          //actions: [PopupmenuKullanimi()],
        ),
        body: ImageOrnekleri(),
      ),
    );
  }
}