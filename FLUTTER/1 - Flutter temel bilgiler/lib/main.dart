import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'containerBoxDecoration.dart';
import 'container_hizalama_aligment_pading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.teal, accentColor: Colors.purple),
      home: containerBoxDecoration(),
    );
  }
}
