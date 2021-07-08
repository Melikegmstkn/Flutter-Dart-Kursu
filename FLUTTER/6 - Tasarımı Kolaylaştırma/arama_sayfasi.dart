import 'package:flutter/material.dart';

class AramaSayfasi extends StatelessWidget {
  const AramaSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20, //sayısı
        //reverse: true, //tersten
        itemExtent: 250, //büyüklük
        itemBuilder: (BuildContext context, index) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Material(
              type: MaterialType.circle,
              elevation: 45, //kaplama rengi
              //borderRadius: BorderRadius.circular(50), //type circle ile aynı anda kullanılmaz
              color: index % 2 == 0
                  ? Colors.orangeAccent.shade200
                  : Colors.indigo.shade200,
              child: Center(
                child: Text(
                  index.toString(),
                ),
              ),
            ),
          );
        });
  }
}

/*
import 'package:flutter/material.dart';

class AramaSayfasi extends StatefulWidget {
  AramaSayfasi(Key key) : super(key: key);

  @override
  _AramaSayfasiState createState() => _AramaSayfasiState();
}

class _AramaSayfasiState extends State<AramaSayfasi> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 200,
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.teal.shade300,
          padding: EdgeInsets.all(8),
          child: Material(
            child: Align(child: Text("ARAMA SAYFASI $index")),
          ),
        );
      },
    );
  }
}
 */
