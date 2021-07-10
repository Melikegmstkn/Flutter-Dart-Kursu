import 'package:flutter/material.dart';

import 'local_json.dart';
import 'remote_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*
    Ogrenci melike = Ogrenci(21, "melike");
    debugPrint(melike.toString());
    Map<String, dynamic> nesliMap = {'id': 19, 'isim': "nesli"};
    debugPrint(
        "Adı:" + nesliMap['isim'] + " id: " + nesliMap['id'].toString());
    Ogrenci n = Ogrenci.mapiNesneyeDonustur(nesliMap);
    debugPrint(n.toString());
    Map<String, dynamic> oznurMap = {'id': 45, 'isim': "öznur"};
    Ogrenci o = Ogrenci.fromMap(oznurMap);
    debugPrint(o.toString());
    */

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LocalJsonKullanimi(),
    );
  }
}

class Ogrenci {
  int id;
  String isim;
  Ogrenci(this.id, this.isim);
  @override
  String toString() {
    return "Adı : $isim id: $id";
  }

  factory Ogrenci.mapiNesneyeDonustur(Map<String, dynamic> gelenMap) {
    return Ogrenci(gelenMap['id'], gelenMap['isim']);
  }
  Ogrenci.fromMap(Map<String, dynamic> gelenMap)
      : id = gelenMap['id'],
        isim = gelenMap['isim'];
}
