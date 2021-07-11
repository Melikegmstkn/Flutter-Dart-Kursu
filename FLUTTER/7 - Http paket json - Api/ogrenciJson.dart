import 'dart:convert';

import 'package:flutter/material.dart';

class OgrenciJsonVerileri extends StatefulWidget {
  const OgrenciJsonVerileri({Key? key}) : super(key: key);

  @override
  _OgrenciJsonVerileriState createState() => _OgrenciJsonVerileriState();
}

class _OgrenciJsonVerileriState extends State<OgrenciJsonVerileri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Json Kullanımı Deneme")),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString("assets/data/ogrenci.json"),
        builder: (context, snapshot) {
          var veriOku = jsonDecode(snapshot.data.toString());
          return ListView.builder(
            itemCount: veriOku.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 25),
                    Text("Ad-Soyad   :  " + veriOku[index]["ogrenciAdi"]),
                    Text("Numarası   :  " + veriOku[index]["ogrenciNo"]),
                    Text("Okul adı   :  " + veriOku[index]["okul"]),
                    Text("Bölümü     :  " + veriOku[index]["bolum"]),
                    SizedBox(height: 25),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
