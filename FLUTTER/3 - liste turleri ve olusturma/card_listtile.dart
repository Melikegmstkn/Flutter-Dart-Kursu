import 'package:flutter/material.dart';

class CardveListtileKullanimi extends StatelessWidget {
  const CardveListtileKullanimi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card ve List tile'),
      ),
      body: Center(
        child: ListView(
          reverse: true,
          children: [
            Column(
              children: [
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
              ],
            ),
            Text('Selam'),
            ElevatedButton(
              onPressed: () {},
              child: Text('Buton'),
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView singleChildKullan() {
    return SingleChildScrollView(
      child: Column(
        children: [
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
        ],
      ),
    );
  }

  Column tekListeElemani() {
    return Column(
      children: [
        Card(
          color: Colors.blue.shade100,
          shadowColor: Colors.red,
          elevation: 12,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.add)),
              title: Text('Başlık'),
              subtitle: Text('Alt Başlık'),
              trailing: Icon(Icons.real_estate_agent)),
        ),
        Divider(
          color: Colors.red,
          thickness: 3,
          height: 10,
          indent: 50,
          endIndent: 50,
        ),
      ],
    );
  }
}
