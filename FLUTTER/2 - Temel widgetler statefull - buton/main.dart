import 'package:flutter/material.dart';
import 'package:hello_word/image_widgets.dart';

import 'dropdown_button_kullanimi.dart';
import 'my_counter_page.dart';
import 'popUpMenu.dart';
import 'temel_buton_turleri.dart';

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
        primarySwatch: Colors.purple,
        outlinedButtonTheme:
            OutlinedButtonThemeData(style: OutlinedButton.styleFrom()),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
        ),
        textTheme: TextTheme(
          headline1: //hazır temalar
              TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Buton Örnekleri'),
          actions: [PopupmenuKullanimi()], //pop up menu app barda da kullanılıyor
        ),
        body: PopupmenuKullanimi(),
      ),
    );
  }
}
