import 'package:flutter/material.dart';
import 'package:flutter_lovers/app/konusmalarim_page.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persons'),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Konusmalarim(),
                  )),
              child: Icon(Icons.padding))
        ],
      ),
      body: Center(
        child: Text('Persons Page'),
      ),
    );
  }
}
