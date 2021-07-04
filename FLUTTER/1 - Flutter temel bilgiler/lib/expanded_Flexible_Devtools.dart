import 'package:flutter/material.dart';

Widget expandedFlexibleDevtools() {
  return Scaffold(
    appBar: AppBar(
      title: Text("Başlık"),
    ),
    body: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: sigmayanContainerSorunu,
      ),
    ),
  );
}

List<Widget> get sigmayanContainerSorunu {
  return [
    Expanded(
      //hepsini expanded yapmak zorunda değiliz
      flex: 2, //flex -> ayrılan alanda kaplayacağı alan oranı.. yazılmazsa 1
      child: Container(
        width: 25,
        height: 75,
        color: Colors.yellow,
      ),
    ),
    Expanded(
      flex: 2,
      child: Container(
        height: 75,
        color: Colors.red,
      ),
    ),
    Expanded(
      flex: 2,
      child: Container(
        width: 645,
        height: 75,
        color: Colors.black,
      ),
    ),
    Expanded(
      flex: 2,
      child: Container(
        width: 75,
        height: 75,
        color: Colors.orange,
      ),
    ),
    Expanded(
      flex: 3,
      child: Container(
        width: 75,
        height: 75,
        color: Colors.grey,
      ),
    ),
  ];
}

//EXPANDED -> alana yayılabildiği kadar yayılıyo taşmadan !
//FLEXİBLE -> en fazla ayrılan alan kadar yayılıyo duruma göre küçülüyo

List<Widget> get flexibleContainer {
  return [
    Flexible(
      flex: 1,
      child: Container(
        width: 200,
        height: 300,
        color: Colors.yellow,
      ),
    ),
    Flexible(
      flex: 1,
      child: Container(
        width: 200,
        height: 300,
        color: Colors.red,
      ),
    ),
    Flexible(
      flex: 1,
      child: Container(
        width: 200,
        height: 300,
        color: Colors.blue,
      ),
    ),
    Flexible(
      flex: 1,
      child: Container(
        width: 200,
        height: 300,
        color: Colors.purple,
      ),
    ),
    Flexible(
      child: Container(
        width: 100,
        height: 300,
        color: Colors.red,
      ),
    ),
  ];
}
