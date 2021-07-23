import 'package:flutter/material.dart';

class SonGuncellemeWidget extends StatelessWidget {
  const SonGuncellemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        "Son Guncelleme : " + TimeOfDay(hour: 20, minute: 45).format(context),
        style: TextStyle(fontSize: 15));
  }
}
