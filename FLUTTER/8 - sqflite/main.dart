import 'package:flutter/material.dart';

import 'shared_prefrences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SharedPrefKullanimi(),
    );
  }
}
