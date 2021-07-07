import 'package:flutter/material.dart';

class StepperOrnek extends StatefulWidget {
  @override
  _StepperOrnekState createState() => _StepperOrnekState();
}

//adım adım ilerleme
class _StepperOrnekState extends State<StepperOrnek> {
  int _aktifStep = 0;
  String isim = '', mail = '', sifre = '';
  List<Step> tumStepler = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tumStepler = _tumStepler();

    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper Örnek'),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          controlsBuilder: (BuildContext context,
              {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
            return Row(
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  onPressed: onStepContinue,
                  child: const Text('Devamm!'),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.pink),
                  onPressed: onStepCancel,
                  child: const Text('Geri Dön'),
                ),
              ],
            );
          },
          currentStep: _aktifStep,
          steps: tumStepler,
          onStepTapped: (tiklanilanStep) {
            setState(() {
              _aktifStep = tiklanilanStep;
            });
          },
        ),
      ),
    );
  }

  List<Step> _tumStepler() {
    List<Step> stepler = [
      Step(
        title: Text("Username başlık"),
        subtitle: Text("Username Altbaşlık"),
        state: StepState.complete,
        isActive: true,
        content: TextFormField(
          decoration: InputDecoration(
              labelText: "UsernameLabel",
              hintText: "UsernameHint",
              border: OutlineInputBorder()),
        ),
      ),
      Step(
        title: Text("Mail başlık"),
        subtitle: Text("Mail Altbaşlık"),
        state: StepState.complete,
        isActive: true,
        content: TextFormField(
          decoration: InputDecoration(
              labelText: "MailLabel",
              hintText: "MailHint",
              border: OutlineInputBorder()),
          onSaved: (girilenDeger) {
            mail = girilenDeger!;
          },
        ),
      ),
      Step(
        title: Text("Şifre başlık"),
        subtitle: Text("Şifre Altbaşlık"),
        state: StepState.complete,
        isActive: true,
        content: TextFormField(
          decoration: InputDecoration(
              labelText: "ŞifreLabel",
              hintText: "ŞifreHint",
              border: OutlineInputBorder()),
          onSaved: (girilenDeger) {
            sifre = girilenDeger ?? '';
          },
        ),
      ),
    ];

    return stepler;
  }
}
