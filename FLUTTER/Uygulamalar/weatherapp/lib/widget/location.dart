import 'package:flutter/material.dart';

class locationWidget extends StatelessWidget {
  // const locationWidget({Key? key}) : super(key: key);
  final String secilenSehir;

  locationWidget({required this.secilenSehir});

  @override
  Widget build(BuildContext context) {
    return Text("İstanbul", style: TextStyle(fontSize: 30));
  }
}
