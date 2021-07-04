import 'package:flutter/material.dart';

class DropDownButtonKullanimi extends StatefulWidget {
  const DropDownButtonKullanimi({Key? key}) : super(key: key);

  @override
  _DropDownButtonKullanimiState createState() =>
      _DropDownButtonKullanimiState();
}

class _DropDownButtonKullanimiState extends State<DropDownButtonKullanimi> {
  String? _secilenSehir = null;
  List<String> _tumSehirler = [
    'Ankara',
    'Bursa',
    'Istanbul',
    'Izmir',
    'Adıyaman',
    'Van'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        hint: Text('Şehir Seçiniz'),
        icon: Icon(Icons.arrow_downward),
        iconSize: 30,
        underline: Container(height: 5, color: Colors.purple),
        style: TextStyle(color: Colors.black, fontSize: 25),
        /*items: [
          DropdownMenuItem(
            child: Text('Ankara Sehri'),
            value: 'Ankara',
          ),
          DropdownMenuItem(
            child: Text('İzmir Sehri'),
            value: 'Izmir',
          ),
          DropdownMenuItem(
            child: Text('Bursa Sehri'),
            value: 'Bursa',
          ),
        ],*/
        items: _tumSehirler //tumsehirler stringdi mapa dönüştürdük
            .map(
              (String oankiSehir) => DropdownMenuItem(
                child: Text(oankiSehir),
                value: oankiSehir,
              ),
            )
            .toList(),
        value: _secilenSehir,
        onChanged: (String? yeni) {
          setState(
            () {
              _secilenSehir = yeni;
            },
          );
        },
      ),
    );
  }
}
