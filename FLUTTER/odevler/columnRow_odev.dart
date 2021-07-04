import 'package:flutter/material.dart';

Widget columnRowOdev() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: columns(),
  );
}

List<Widget> columns() {
  return [
    Expanded(child: rows()),
    Padding(padding: EdgeInsets.all(10)),
    Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 75,
        width: 75,
        child: Text("E", style: TextStyle(fontSize: 45)),
        color: Colors.orange.shade200,
      ),
    ),
    Padding(padding: EdgeInsets.all(10)),
    Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 75,
        width: 75,
        child: Text("R", style: TextStyle(fontSize: 45)),
        color: Colors.orange.shade200,
      ),
    ),
    Padding(padding: EdgeInsets.all(10)),
    Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 75,
        width: 75,
        child: Text("S", style: TextStyle(fontSize: 45)),
        color: Colors.orange.shade200,
      ),
    ),
    Padding(padding: EdgeInsets.all(10)),
    Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 75,
        width: 75,
        child: Text("L", style: TextStyle(fontSize: 45)),
        color: Colors.orange.shade200,
      ),
    ),
    Padding(padding: EdgeInsets.all(10)),
    Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 75,
        width: 75,
        child: Text("E", style: TextStyle(fontSize: 45)),
        color: Colors.orange.shade200,
      ),
    ),
    Padding(padding: EdgeInsets.all(10)),
    Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 75,
        width: 75,
        child: Text("R", style: TextStyle(fontSize: 45)),
        color: Colors.orange.shade200,
      ),
    ),
    Padding(padding: EdgeInsets.all(10)),
    Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 75,
        width: 75,
        child: Text("İ", style: TextStyle(fontSize: 45)),
        color: Colors.orange.shade200,
      ),
    ),
  ];
}

Widget rows() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
        child: Container(
          alignment: Alignment.center,
          height: 75,
          width: 75,
          child: Text(
            "D",
            style: TextStyle(fontSize: 45),
          ),
          color: Colors.orange.shade100,
        ),
      ),
      Flexible(
        child: Container(
          alignment: Alignment.center,
          height: 75,
          width: 75,
          child: Text("A", style: TextStyle(fontSize: 45)),
          color: Colors.orange.shade200,
        ),
      ),
      Flexible(
        child: Container(
          alignment: Alignment.center,
          height: 75,
          width: 75,
          child: Text("R", style: TextStyle(fontSize: 45)),
          color: Colors.orange.shade300,
        ),
      ),
      Flexible(
        child: Container(
          alignment: Alignment.center,
          height: 75,
          width: 75,
          child: Text("T", style: TextStyle(fontSize: 45)),
          color: Colors.orange.shade400,
        ),
      ),
    ],
  );
}
