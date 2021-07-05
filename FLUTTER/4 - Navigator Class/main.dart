import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            /* //random sayı beklemeyen hali
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
        ],
      )),
    );
  }
}

