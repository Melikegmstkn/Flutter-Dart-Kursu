import 'dart:convert';

import 'package:flutter/material.dart';

import 'model/Araba.dart'; //json dosyasını dönüştürmek için kullanılır

class LocalJsonKullanimi extends StatefulWidget {
  //LocalJsonKullanimi({Key? key}) : super(key: key);

  @override
  _LocalJsonKullanimiState createState() => _LocalJsonKullanimiState();
}

class _LocalJsonKullanimiState extends State<LocalJsonKullanimi> {
  List<Araba>? tumArabalar;
  @override
  void initState() {
    super.initState();
    debugPrint("init state!!!");
    tumArabalar = [];
    // veriKaynaginiOku().then((gelenArabaListesi) {
    //   setState(() {
    //     tumArabalar = gelenArabaListesi.cast<Araba>();
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Build!!!");
    return Scaffold(
      appBar: AppBar(title: Text("Local Json Kullanımı")),
      body: Container(
        child: FutureBuilder(
          future: veriKaynaginiOku(),
          builder: (context, sonuc) {
            if (sonuc.hasData) {
              tumArabalar = sonuc.data as List<Araba>?;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tumArabalar![index].arabaAdi),
                    subtitle: Text(tumArabalar![index].ulke),
                    onTap: () {},
                  );
                },
                itemCount: tumArabalar!.length,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Future<List<Araba>> veriKaynaginiOku() async {
    // Future<String> jsonOku =
    //     DefaultAssetBundle.of(context).loadString('assets/data/araba.json');
    // jsonOku.then((okunanJson) {
    //   debugPrint("gelen json:" + okunanJson);
    //   return okunanJson;
    // });

    var gelenJson = await DefaultAssetBundle.of(context)
        .loadString("assets/data/araba.json");
    debugPrint(gelenJson);

    List<Araba> arabaListesi = (json.decode(gelenJson) as List)
        .map((mapYapisi) => Araba.fromJsonMap(mapYapisi))
        .toList();
    //decode -> jsondaki o anki veriyi alır
    debugPrint("toplam araba sayısı:" + arabaListesi.length.toString());
    for (int i = 0; i < arabaListesi.length; i++) {
      debugPrint("Marka:" + arabaListesi[i].arabaAdi.toString());
      debugPrint("Ülkesi:" + arabaListesi[i].ulke.toString());
      //debugPrint("Modeli:" + arabaListesi[i]["modelAdi"].toString());
    }
    return arabaListesi;
  }
}

//LOCAL
/*
import 'dart:convert';

import 'package:flutter/material.dart'; //json dosyasını dönüştürmek için kullanılır

class LocalJsonKullanimi extends StatefulWidget {
  LocalJsonKullanimi({Key? key}) : super(key: key);

  @override
  _LocalJsonKullanimiState createState() => _LocalJsonKullanimiState();
}

class _LocalJsonKullanimiState extends State<LocalJsonKullanimi> {
  List? tumArabalar;
  @override
  void initState() {
    super.initState();
    veriKaynaginiOku().then((gelenArabaListesi) {
      setState(() {
        tumArabalar = gelenArabaListesi;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Json Kullanımı")),
      body: Container(
        child: FutureBuilder(
          future: veriKaynaginiOku(),
          builder: (context, sonuc) {
            if (sonuc.hasData) {
              tumArabalar = sonuc.data as List?;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tumArabalar![index]["arabaAdi"]),
                    subtitle: Text(tumArabalar![index]["ulke"]),
                  );
                },
                itemCount: tumArabalar!.length,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Future<List> veriKaynaginiOku() async {
    // Future<String> jsonOku =
    //     DefaultAssetBundle.of(context).loadString('assets/data/araba.json');
    // jsonOku.then((okunanJson) {
    //   debugPrint("gelen json:" + okunanJson);
    //   return okunanJson;
    // });

    var gelenJson = await DefaultAssetBundle.of(context)
        .loadString('assets/data/araba.json');
    debugPrint(gelenJson);

    List arabaListesi = json.decode(gelenJson.toString());
    //decode -> jsondaki o anki veriyi alır
    debugPrint("toplam araba sayısı:" + arabaListesi.length.toString());
    for (int i = 0; i < arabaListesi.length; i++) {
      debugPrint("Marka:" + arabaListesi[i]["arabaAdi"].toString());
      debugPrint("Ülkesi:" + arabaListesi[i]["ulke"].toString());
      debugPrint("Modeli:" + arabaListesi[i]["modelAdi"].toString());
    }
    return arabaListesi;
  }
}
*/
