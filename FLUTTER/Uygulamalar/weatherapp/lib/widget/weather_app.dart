import 'package:flutter/material.dart';
import 'package:weatherapp/widget/sehir_sec.dart';

import 'hava_durumu_resim.dart';
import 'location.dart';
import 'max_min_sicaklik.dart';
import 'son_guncelleme.dart';

class WeatherApp extends StatelessWidget {
  // const WeatherApp({Key? key}) : super(key: key);
  String kullanicininSectigiSehir = "İstanbul";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              kullanicininSectigiSehir = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SehirSecWidget()));
              debugPrint("Secilen sehir : " + kullanicininSectigiSehir);
            },
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: locationWidget(secilenSehir: kullanicininSectigiSehir),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Center(child: SonGuncellemeWidget()),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Center(child: HavaDurumuResimWidget()),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(child: MaxVeMinSicaklikWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
