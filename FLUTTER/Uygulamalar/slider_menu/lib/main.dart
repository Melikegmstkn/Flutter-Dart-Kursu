import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'menu_dashboard.dart';

/*
void main() {
  final Color backgroundColur = Color(0xFF343442);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: backgroundColur,
    statusBarIconBrightness: Brightness.light,
    //systemNavigationBarColor: Colors.pink,
    //systemNavigationBarIconBrightness: Brightness.dark,
  ));

  //sadece dikey çalışması için
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
  //   runApp(MyApp());
  // });
}
*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuDashboard(),
    );
  }
}
