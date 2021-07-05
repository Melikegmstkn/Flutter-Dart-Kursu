import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'green_page.dart';
import 'red_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Islemleri'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            //rand sayıyı beklesin diye await kullandık
            onPressed: () async {
              int? _gelenSayi = await Navigator.push<int>(
                context,
                CupertinoPageRoute(builder: (redContext) => RedPage()),
              );
              print('Ana sayfadaki sayı $_gelenSayi');
            },
            /*
            onPressed: ()  {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (redContext) => RedPage()),
              );
            },
            */
            style: ElevatedButton.styleFrom(primary: Colors.red.shade300),
            child: Text('Kırmızı Sayfaya Gir IOS'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push<int>(
                      MaterialPageRoute(builder: (redcontext) => RedPage()))
                  .then((int? value) {
                debugPrint('Gelen sayı $value');
              });
            },
            style: ElevatedButton.styleFrom(primary: Colors.red.shade600),
            child: Text('Kırmızı Sayfaya Gir Android'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).maybePop();
              //maybePop -> öncesinde açılmış bi sayfa varsa o sayfaya gider yoksa uygulamayı aşağı alır
            },
            style: ElevatedButton.styleFrom(primary: Colors.grey),
            child: Text('Maybe Pop Kullanımı'),
          ),
          ElevatedButton(
            //can Pop maybe Pop gibi ama kontrollu. yani öncesinde sayfa var mı kontrol eder varsa işlem yapar
            onPressed: () {
              if (Navigator.canPop(context)) {
                print("evet pop olabilir");
              } else
                print('hayır olamaz');
            },
            style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
            child: Text('Can Pop Kullanımı'),
          ),
          ElevatedButton(
            //stackteki son sayfa olur burdan çıkış yok. hesaptan çıkış işlerinde kullanılabilir
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => GreenPage()),
              );
            },
            style: ElevatedButton.styleFrom(primary: Colors.red.shade600),
            child: Text('Push Replacament Kullanımı'),
          ),
        ],
      )),
    );
  }
}