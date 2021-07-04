import 'package:flutter/material.dart';

//Stateful Widget -> Yapılan değişiklikleri ekranda anında görmek için gerekli olan setState methodu vardır.

class MyCounterPage extends StatefulWidget {
  MyCounterPage({Key? key}) : super(key: key);

  @override
  _MyCounterPageState createState() => _MyCounterPageState();
}

class _MyCounterPageState extends State<MyCounterPage> {
  int _sayac = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint('myhomepage build çalıştı');
    return Scaffold(
      appBar: AppBar(
        title: Text('My Counter AppBar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyNewTextWidget(),
            Text(
              _sayac.toString(),
              style: Theme.of(context).textTheme.headline1, //bu tema mainden alındı
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('butona tıklandı ve sayac değeri $_sayac');

          sayaciArttir();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void sayaciArttir() {
    setState(() {
      _sayac++;
    });
    //print('sayac arttı');
  }
}

class MyNewTextWidget extends StatelessWidget {
  const MyNewTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Butona basılma miktarı',
      style: TextStyle(fontSize: 24),
    );
  }
}
