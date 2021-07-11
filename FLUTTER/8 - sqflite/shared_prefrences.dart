import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefKullanimi extends StatefulWidget {
  SharedPrefKullanimi({Key? key}) : super(key: key);

  @override
  _SharedPrefKullanimiState createState() => _SharedPrefKullanimiState();
}

class _SharedPrefKullanimiState extends State<SharedPrefKullanimi> {
  String? isim;
  int? id;
  var cinsiyet;
  //SharedPreferences mySharedPreferences;
  var mySharedPreferences;

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    //SharedPreferences.getInstance().then((sf) => mySharedPreferences = sf);
    SharedPreferences.getInstance().then((sf) {
      mySharedPreferences = sf;
    });
  }

  @override
  void dispose() {
    mySharedPreferences.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (deger) {
                      isim = deger;
                    },
                    decoration: InputDecoration(
                        labelText: "İsminizi giriniz",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (deger) {
                      id = int.parse(deger!);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "ID giriniz",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RadioListTile(
                    value: true,
                    groupValue: cinsiyet,
                    onChanged: (secildi) {
                      setState(() {
                        cinsiyet = secildi;
                      });
                    },
                    title: Text("Kız"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RadioListTile(
                    value: false,
                    groupValue: cinsiyet,
                    onChanged: (secildi) {
                      setState(() {
                        cinsiyet = secildi;
                      });
                    },
                    title: Text("Erkek"),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: _ekle,
                      child: Text("Kaydet"),
                      color: Colors.green,
                    ),
                    // SizedBox(width: 25),
                    RaisedButton(
                      onPressed: _goster,
                      child: Text("Görüntüle"),
                      color: Colors.blue,
                    ),
                    // SizedBox(width: 25),
                    RaisedButton(
                      onPressed: _sil,
                      child: Text("Sil"),
                      color: Colors.red,
                    )
                  ],
                )
                //cinsiyetRow(),
                //elevatedButtonRow()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _ekle() async {
    formKey.currentState!.save(); //fomdaki (on) methodlarını tetikler
    await (mySharedPreferences as SharedPreferences).setString("myIsim", isim!);
    await (mySharedPreferences as SharedPreferences).setInt("myID", id!);
    await (mySharedPreferences as SharedPreferences)
        .setBool("myCinsiyet", cinsiyet!);
  }

  void _goster() {
    debugPrint("isim: " +
        (mySharedPreferences as SharedPreferences)
            .getString("myIsim")
            .toString());

    debugPrint("ID: " +
        (mySharedPreferences as SharedPreferences).getInt("myID").toString());

    debugPrint("Kadın Mı: " +
        (mySharedPreferences as SharedPreferences)
            .getBool("myCinsiyet")
            .toString());
  }

  void _sil() {
    (mySharedPreferences as SharedPreferences).remove("myIsim");
    (mySharedPreferences as SharedPreferences).remove("myID");
    (mySharedPreferences as SharedPreferences).remove("myCinsiyet");
  }
}
