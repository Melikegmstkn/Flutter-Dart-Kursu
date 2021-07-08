import 'package:flutter/material.dart';

class ozelFontKullanimi extends StatelessWidget {
  const ozelFontKullanimi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            "Genel Font Kullanimi",
            style: TextStyle(
              fontFamily: 'GenelYaziStili',
              fontSize: 35,
            ),
          ),
        ),
        Center(
          child: Text(
            "Ozel Font Kullanimi",
            style: TextStyle(
              fontFamily: 'OzelYaziStili',
              fontSize: 35,
            ),
          ),
        ),
        Center(
          child: Text(
            "Font Kullanimi",
            style: TextStyle(
              //font family belirtilmedikçe themeData daki font kullanılır
              //fontFamily: 'OzelYaziStili',
              fontSize: 35,
            ),
          ),
        ),
      ],
    );
  }
}
