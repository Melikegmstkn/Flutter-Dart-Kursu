import 'package:flutter/material.dart';

Widget rowColumn() {
  return Scaffold(
    appBar: AppBar(
      title: Text("Başlık"),
    ),
    body: Container(
      color: Colors.red,
      //height: 300,
      child: row(),
    ),
  );
}

Widget row() {
  return Row(
    mainAxisSize: MainAxisSize.max, //ana eksen (x ekseni diyebiliriz)
    mainAxisAlignment:
        MainAxisAlignment.spaceAround, //eksende nasıl konumlansınlar
    crossAxisAlignment:
        CrossAxisAlignment.end, //y-ekseninde nasıl konumlansınlar
    // containerin height değeri yoksa farklılık gösterir
    children: <Widget>[
      Icon(
        Icons.add_circle,
        size: 65,
        color: Colors.green,
      ),
      Icon(
        Icons.add_circle,
        size: 65,
        color: Colors.grey,
      ),
      Icon(
        Icons.add_circle,
        size: 65,
        color: Colors.black12,
      ),
    ],
  );
}

Widget column() {
  return Column(
    mainAxisSize: MainAxisSize.max, //ana eksen (Y ekseni diyebiliriz)
    mainAxisAlignment:
        MainAxisAlignment.spaceEvenly, //eksende nasıl konumlansınlar
    crossAxisAlignment:
        CrossAxisAlignment.start, //X-ekseninde nasıl konumlansınlar
    // containerin width değeri yoksa farklılık gösterir

    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("M"),
          Text("E"),
          Text("L"),
          Text("İ"),
          Text("K"),
          Text("E"),
        ],
      ),
      Icon(
        Icons.add_circle,
        size: 65,
        color: Colors.green,
      ),
      Icon(
        Icons.add_circle,
        size: 65,
        color: Colors.grey,
      ),
      Icon(
        Icons.add_circle,
        size: 65,
        color: Colors.black12,
      ),
    ],
  );
}
