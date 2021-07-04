import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal, //widgete özel renk atanmamışsa bu çalışır
        accentColor:
            Colors.purple, //görünen küçük şeylere renk atanmamışsa (buton)
      ),
      home: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text("Başlık"),
          //backgroundColor: Colors.amber,
        ),
        body: Center(
          //containeri ortalamak için
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
            //alignment: Alignment.center, //cocuğu hizalar
            child: Container(
              color: Colors.blue,
              margin: EdgeInsets.all(50),
              width: 100,
              height: 100,
              alignment: Alignment.center,
              child: Text("Melike"),
            ),
          ),
        ),
        /*Container(
          //container içinde child varsa onun kadar yer kaplar yoksa üst sınıfı kadar. Aligment bulunduruyosa yine paretni kadar kaplar
          //alignment: Alignment.topCenter, //texti ortamda seçilen şekilde ortalar
          color: Colors.pinkAccent,
          width: 200,
          height: 200,
          child: Text(
            "Melike " * 3,
            textAlign: TextAlign.center, //texti satırda ortalar
          ),
          //margin: EdgeInsets.all(10), //container ile kanarlar arasına mesafe
          margin: EdgeInsets.fromLTRB(10, 20, 2, 60),
          padding: EdgeInsets.all(70), //yazı ile kenarlar arası boşluk
          // constraints: BoxConstraints(
          //   minHeight: 100,
          //   minWidth: 100,
          //   maxHeight: 200,
          //   maxWidth: 200,
          // ), //100e 100den küçük 2002 200den büyük olmasın
        ),*/
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("Tıklandı");
          },
          child: Icon(Icons.account_circle_rounded,
              color: Colors.black), //Text("buton"),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
