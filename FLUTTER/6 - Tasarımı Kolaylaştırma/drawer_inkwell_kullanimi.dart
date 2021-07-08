import 'package:flutter/material.dart';

class drawerKullanimi extends StatefulWidget {
  const drawerKullanimi({Key? key}) : super(key: key);

  @override
  _drawerKullanimiState createState() => _drawerKullanimiState();
}

class _drawerKullanimiState extends State<drawerKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel: "saknlcmasşl",
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Melike Gümüştekin"),
            accountEmail: Text("melikegmstkn@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/originals/57/7f/f8/577ff89a099a7577a1b886ee230dc2a7.jpg"),
            ),
            currentAccountPictureSize: Size.square(80), //
            otherAccountsPictures: [
              //Image.network("https://seyler.ekstat.com/img/max/800/7/73rQVEJgEiX5skTj-636709599275956307.jpg"),
              CircleAvatar(
                backgroundColor: Colors.grey,
                child: Text(
                  "M",
                  style: TextStyle(
                    fontFamily: 'OzelYaziStili',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              CircleAvatar(
                child: Text(
                  "G",
                  style: TextStyle(
                    fontFamily: 'GenelYaziStili',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Colors.grey,
              ),
            ],
            decoration: BoxDecoration(
              color: Colors.purpleAccent.shade700,
            ),
            onDetailsPressed: () {
              print("Detail");
            },
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                    leading: Icon(Icons.account_box),
                    trailing: Icon(Icons.chevron_right),
                    title: Text("Profil")),
                ListTile(
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.chevron_right),
                  title: Text("Anasayfa"),
                ),
                ListTile(
                    leading: Icon(Icons.exit_to_app),
                    trailing: Icon(Icons.chevron_right),
                    title: Text("Ayarlar")),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.green,
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Çıkıs"),
                  ),
                ),
                AboutListTile(
                  applicationName: "Drawer",
                  applicationIcon: Icon(Icons.message),
                  applicationVersion: "3.0",
                  child: Text("Merhaba Kullanıcı"),
                  applicationLegalese: null,
                  icon: Icon(Icons.keyboard),
                  aboutBoxChildren: [
                    Text("Hosgeldin"),
                    Text("~~~~~~~~~~~"),
                    Text("Hosçakal"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
