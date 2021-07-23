import 'package:flutter/material.dart';

class MaxVeMinSicaklikWidget extends StatelessWidget {
  const MaxVeMinSicaklikWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Maximum : " + 24.toString() + " " + "C",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Minimum : " + 12.toString() + " " + "C",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
