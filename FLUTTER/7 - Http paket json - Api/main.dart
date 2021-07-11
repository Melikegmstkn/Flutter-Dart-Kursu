import 'package:flutter/material.dart';

import 'local_json.dart';
import 'ogrenciJson.dart';
import 'remote_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );

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
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json ve Api"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Local Json"),
              color: Colors.green,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LocalJsonKullanimi()));
              },
            ),
            RaisedButton(
              child: Text("Remote Api"),
              color: Colors.orangeAccent,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RemoteApiKullanimi()));
              },
            ),
            RaisedButton(
              child: Text("Json Orenci Verileri"),
              color: Colors.deepPurpleAccent,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OgrenciJsonVerileri()));
              },
            ),
          ],
        ),
      ),
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
