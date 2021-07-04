import 'package:flutter/material.dart';

import 'card_listtile.dart';
import 'custom_scroll_ve_slivers.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: CardveListtileKullanimi(),
    );
  }
}
