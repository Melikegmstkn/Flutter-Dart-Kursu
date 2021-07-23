import 'package:flutter/material.dart';

class SehirSecWidget extends StatefulWidget {
  // const SehirSecWidget({Key? key}) : super(key: key);

  @override
  _SehirSecWidgetState createState() => _SehirSecWidgetState();
}

class _SehirSecWidgetState extends State<SehirSecWidget> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sehir Seç")),
      body: Form(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  enabled: true,
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: "Sehir",
                    hintText: "Sehir Secin",
                    border: OutlineInputBorder(),
                    // icon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //önceki sayfaya veri gönderir
                Navigator.pop(context, _textController.text);
                _textController.clear();
              },
            )
          ],
        ),
      ),
    );
  }
}
