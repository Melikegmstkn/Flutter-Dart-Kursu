import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'date_time_picker.dart';
import 'diger_form_elemanlari.dart';
import 'stepper_kullanimi.dart';
import 'text_field.dart';
import 'text_form_field_kullanimi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StepperOrnek(
          //title: 'Form İslemleri', //TextFieldIslemleri için başlık
          ),
    );
  }
}
