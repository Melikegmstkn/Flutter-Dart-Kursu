import 'package:flutter/material.dart';

import 'burcDetay.dart';
import 'burcListesi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Burc Rehberi",
      debugShowCheckedModeBanner: false,
      initialRoute: "/burcListesi",
      routes: {
        "/": (context) => BurcListesi(),
        "/burcListesi": (context) => BurcListesi(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElemanlari =
            settings.name!.split("/"); //  /  burcDetay  /    1
        if (pathElemanlari[1] == 'burcDetay') {
          return MaterialPageRoute(
              builder: (context) => BurcDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}
