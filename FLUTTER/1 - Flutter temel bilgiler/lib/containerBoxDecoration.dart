import 'package:flutter/material.dart';

Widget containerBoxDecoration() {
  String _foto =
      "https://images.freeimages.com/images/large-previews/0db/tropical-bird-1390996.jpg";
  String _foto2 =
      "https://media.istockphoto.com/vectors/black-cat-head-face-oval-icon-with-big-eyes-pink-tongue-cute-cartoon-vector-id1198242865";

  return Scaffold(
    appBar: AppBar(
      title: Text("Başlık"),
    ),
    body: Center(
      child: Container(
        //color: Colors.red, //BoxDecoration varsa burada color kullanamam
        padding: EdgeInsets.all(20),
        child: Text(
          "MG",
          style: TextStyle(
            fontSize: 150,
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.rectangle,
            border: Border.all(
                width: 10, style: BorderStyle.solid, color: Colors.red),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            image: DecorationImage(
              image: NetworkImage(_foto2),
              fit: BoxFit.scaleDown,
              repeat: ImageRepeat.repeat,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey,
                offset: Offset(10, 20),
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.blueGrey,
                offset: Offset(-20, -20),
                blurRadius: 10,
              ),
            ]),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        debugPrint("Tıklandı");
      },
      child: Icon(Icons.account_circle_rounded, color: Colors.black),
      backgroundColor: Colors.red,
    ),
  );
}
