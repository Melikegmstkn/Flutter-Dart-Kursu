import 'package:flutter/material.dart';

class ListviewLayoutProblemleri extends StatelessWidget {
  const ListviewLayoutProblemleri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview Layout Problems'),
      ),
      body: columIcindeListe(),
    );
  }

  Container rowIcindeListe() {
    return Container(
      height: 200,
      child: Row(
        children: [
          Text('Başladı'),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              children: [
                Container(
                  width: 200,
                  color: Colors.orange.shade200,
                ),
                Container(
                  width: 200,
                  color: Colors.orange.shade400,
                ),
                Container(
                  width: 200,
                  color: Colors.orange.shade200,
                ),
                Container(
                  width: 200,
                  color: Colors.orange.shade400,
                ),
              ],
            ),
          ),
          Text('Bitti'),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 4, color: Colors.red),
      ),
    );
  }

  Container columIcindeListe() {
    return Container(
        height: 200,
        child: Column(
          children: [
            Text('Başladı'),
            Expanded(
              child: ListView(
                shrinkWrap:
                    true, //shrinkWrap -> çocukların genişliği kadar yer kaplasın diğer kısım kullanılmasın
                children: [
                  Container(
                    height: 200,
                    color: Colors.orange.shade200,
                  ),
                  Container(
                    height: 200,
                    color: Colors.orange.shade400,
                  ),
                ],
              ),
            ),
            Text('Bitti'),
          ],
        ));
  }
}
