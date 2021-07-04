import 'package:flutter/material.dart';

class TemelButonlar extends StatelessWidget {
  const TemelButonlar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {},
            onLongPress: () {
              debugPrint('Uzun basıldı');
            },
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Text Button')),
        TextButton.icon(
          onPressed: () {},
          style: ButtonStyle(
            //backgroundColor: MaterialStateProperty.all(Colors.red), //->her durumda red  (normalde de tıklandığında da)
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              //duruma göre renkleniyo
              if (states.contains(MaterialState.pressed)) {
                return Colors.teal;
              }
              if (states.contains(MaterialState.hovered)) {
                return Colors.orange;
              }
              return null;
            }),
            foregroundColor: MaterialStateProperty.all(Colors.black),
            overlayColor:
                MaterialStateProperty.all(Colors.yellow.withOpacity(0.5)),
          ),
          icon: Icon(Icons.add),
          label: Text('Text Button with Icon'),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors
                .black, //yazının rengi değişir tıklanma efekt rengi de yazı rengine göre değişir
          ),
          child: Text('Elevated Button'),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('Elevated with Icon'),
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text('Outlined Button', style: TextStyle(color: Colors.black)),
          style: OutlinedButton.styleFrom(backgroundColor: Colors.grey),
        ),
        OutlinedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
            side: BorderSide(color: Colors.purple, width: 2),
          ),
          label: Text('Outlined with Icon'),
        ),
        OutlinedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.grey,
            side: BorderSide(width: 2, color: Colors.red),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          label: Text('Outlined with Icon'),
        ),
      ],
    );
  }
}
