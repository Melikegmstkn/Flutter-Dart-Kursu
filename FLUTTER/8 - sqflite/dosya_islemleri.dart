import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DosyaIslemleri extends StatefulWidget {
  DosyaIslemleri({Key? key}) : super(key: key);

  @override
  _DosyaIslemleriState createState() => _DosyaIslemleriState();
}

class _DosyaIslemleriState extends State<DosyaIslemleri> {
  var _textController = TextEditingController();

  //olusacak dosyanın klasor yolu
  Future<String> get getDosyaYolu async {
    Directory klasor = await getApplicationDocumentsDirectory();
    //Directory klasor = await getTemporaryDirectory();
    debugPrint("dosya yolu : " + klasor.path);
    return klasor.path;
  }

  //dosya olusturma
  Future<File> get dosyaOlustur async {
    var olusturulacakDosyaninKlasorYolu = await getDosyaYolu;
    return File(olusturulacakDosyaninKlasorYolu + "/myDosya.txt");
    //myDosya -> oluşan dosyanın adı
  }

  //dosyayı okuma islemleri
  Future<String> get dosyaOku async {
    try {
      var myDosya = await dosyaOlustur;
      String dosyaIcerigi = await myDosya.readAsString();
      return dosyaIcerigi;
    } catch (e) {
      return "Hata Çıktı $e";
    }
  }

  //dosyaya yazma islemleri
  Future<File> dosyayaYaz(String yazilacakDeger) async {
    var myDosya = await dosyaOlustur;
    return myDosya.writeAsString(yazilacakDeger);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dosya İşlemleri")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                autofocus: true,
                controller: _textController,
                decoration: InputDecoration(
                  hintText: "Buraya yazılan değerler dosyaya kaydedilecek",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: _dosyaYaz,
                  color: Colors.grey,
                  child: Text("Dosyaya yaz"),
                ),
                RaisedButton(
                  onPressed: _dosyaOku,
                  color: Colors.purpleAccent,
                  child: Text("Dosyadan oku"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _dosyaYaz() {
    dosyayaYaz(_textController.text.toString());
  }

  void _dosyaOku() async {
    //debugPrint(await dosyaOku);
    dosyaOku.then((icerik) {
      debugPrint(icerik);
    });
  }
}
