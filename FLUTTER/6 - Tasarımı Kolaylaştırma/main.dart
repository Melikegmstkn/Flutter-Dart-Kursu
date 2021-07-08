import 'package:flutter/material.dart';

import 'ana_sayfa.dart';
import 'arama_sayfasi.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dersleri',
      theme: ThemeData(
        fontFamily: 'GenelYaziStili',
        primarySwatch: Colors.amber,
        accentColor: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  int secilenMenuItem = 0;
  List<Widget> tumSayfalar = [];
  late Anasayfa sayfaAna;
  late AramaSayfasi sayfaArama;

  @override
  void initState() {
    super.initState();
    sayfaAna = Anasayfa();
    sayfaArama = AramaSayfasi();
    tumSayfalar = [sayfaAna, sayfaArama];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer -> sabit menü
      drawer: drawerKullanimi(),
      appBar: AppBar(
        title: Text("Flutter Dersleri"),
      ),
      body: secilenMenuItem <= tumSayfalar.length - 1
          ? tumSayfalar[secilenMenuItem]
          : tumSayfalar[secilenMenuItem],
      bottomNavigationBar: bottomNavMenu(),
    );
  }

  Theme bottomNavMenu() {
    return Theme(
        data: ThemeData(
          fontFamily: 'GenelYaziStili',
          canvasColor: Colors.cyan, //arkaplan rengi
          primaryColor: Colors.orangeAccent,
          //secilen barın rengi //!BENDEOLMADI
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Anasayfa"),
              backgroundColor: Colors.green,
              activeIcon: Icon(Icons.home_max_sharp), //secilenin ikon degisir
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text("Ara"),
              backgroundColor: Colors.purpleAccent,
              activeIcon: Icon(Icons.call),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text("Ekle"),
              backgroundColor: Colors.amber,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              title: Text("Profil"),
              backgroundColor: Colors.grey,
            ),
          ],
          type:
              BottomNavigationBarType.fixed, //hepsi görünsün diye /rengi beyaz
          //type: BottomNavigationBarType.shifting, //seçilenin rengini kullanmak için
          currentIndex: secilenMenuItem,
          fixedColor: Colors.red, //secileni renklendir
          onTap: (index) {
            setState(() {
              secilenMenuItem = index;
            });
          },
        ));
  }
}
