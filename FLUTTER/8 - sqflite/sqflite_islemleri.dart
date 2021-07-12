import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';

import 'utils/database_helper.dart';
import 'model/ogrenci.dart';

class SqllifeIslemleri extends StatefulWidget {
  SqllifeIslemleri({Key? key}) : super(key: key);

  @override
  _SqllifeIslemleriState createState() => _SqllifeIslemleriState();
}

class _SqllifeIslemleriState extends State<SqllifeIslemleri> {
  DatabaseHelper? _databaseHelper;
  List<Ogrenci>? tumOgrencilerListesi;
  bool aktifMi = false;
  var _formKey = GlobalKey<FormState>();
  var _textController = TextEditingController();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  int? tiklananOgrenciIndexi;
  int? tiklananOgrenciID;

  @override
  void initState() {
    super.initState();

    tumOgrencilerListesi = <Ogrenci>[];
    _databaseHelper = DatabaseHelper();
    _databaseHelper!.tumOgrenciler().then((tumOgrencileriTutanMapListesi) {
      for (Map<String, dynamic> okunanOgrenciMap
          in tumOgrencileriTutanMapListesi) {
        tumOgrencilerListesi!
            .add(Ogrenci.maptenNesneyeDonustur(okunanOgrenciMap));
      }
      print("DB den gelen ogrenci sayısı " +
          tumOgrencilerListesi!.length.toString());
    }).catchError((error) {
      print("HATA: " + error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    controller: _textController,
                    validator: (value) {
                      if (value!.length < 3) {
                        return "İsim 3 karakterden kısa olamaz";
                      } else
                        return null;
                    },
                  ),
                ),
                SwitchListTile(
                  value: aktifMi,
                  onChanged: (value) {
                    setState(() {
                      aktifMi = value;
                    });
                  },
                  title: Text("Aktif mi?"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      child: Text("Kaydet"),
                      color: Colors.green,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _ogrenciEkle(
                            Ogrenci(
                                _textController.text, aktifMi == true ? 1 : 0),
                          );
                        }
                      },
                    ),
                    RaisedButton(
                      child: Text("Güncelle"),
                      color: Colors.blue,
                      onPressed: tiklananOgrenciID == null
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                _ogrenciGuncelle(
                                  Ogrenci.withId(
                                    tiklananOgrenciID,
                                    _textController.text,
                                    aktifMi == true ? 1 : 0,
                                  ),
                                );
                              }
                            },
                    ),
                    RaisedButton(
                      child: Text("Tüm Tabloyu Sil"),
                      color: Colors.red,
                      onPressed: () {
                        _tumTabloyuTemizle();
                        tiklananOgrenciIndexi = null;
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        color: tumOgrencilerListesi![index].aktif == 1
                            ? Colors.green.shade300
                            : Colors.red.shade300,
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              _textController.text =
                                  tumOgrencilerListesi![index].isim;
                              aktifMi = tumOgrencilerListesi![index].aktif == 1
                                  ? true
                                  : false;
                              tiklananOgrenciIndexi = index;
                              tiklananOgrenciID =
                                  tumOgrencilerListesi![index].id;
                            });
                          },
                          leading: CircleAvatar(
                            child: Text(
                                tumOgrencilerListesi![index].id.toString()),
                          ),
                          title: Text(
                              tumOgrencilerListesi![index].isim.toString()),
                          subtitle: Text(tumOgrencilerListesi![index].aktif == 1
                              ? "Aktif"
                              : "Pasif"),
                          // trailing: GestureDetector(
                          //   onTap: () {
                          //     setState(() {
                          //       _ogrenciSil(
                          //           tumOgrencilerListesi![index].id, index);
                          //     });
                          //   },
                          //   child: Icon(Icons.delete, size: 30),
                          // ),
                          trailing: IconButton(
                            onPressed: () {
                              _ogrenciSil(
                                  tumOgrencilerListesi![index].id, index);
                              if (index == tiklananOgrenciIndexi) {
                                tiklananOgrenciIndexi = null;
                              }
                            },
                            icon: Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: tumOgrencilerListesi!.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container switchButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: SwitchListTile(
        value: aktifMi,
        onChanged: (value) {
          setState(() {
            aktifMi = value;
          });
        },
        title: Text("Aktif mi?"),
      ),
    );
  }

  TextFormField isimFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      controller: _textController,
      validator: (value) {
        if (value!.length < 3) {
          return "İsim 3 karakterden kısa olamaz";
        } else
          return null;
      },
    );
  }

  void _ogrenciEkle(Ogrenci ogrenci) async {
    var yeniEklenenElemanID = await _databaseHelper!.ogrenciEkle(ogrenci);
    ogrenci.id = yeniEklenenElemanID;
    if (yeniEklenenElemanID > 0) {
      setState(() {
        tumOgrencilerListesi!.insert(0, ogrenci);
      });
    }
  }

  void _tumTabloyuTemizle() async {
    int silinenElemanSayisi = await _databaseHelper!.tumOgrenciTablosunuSil();
    if (silinenElemanSayisi > 0) {
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        content: Text(silinenElemanSayisi.toString() + 'kayıt silindi'),
      ));

      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   behavior: SnackBarBehavior.floating,
      //   backgroundColor: Colors.redAccent,
      //   content: Text(silinenElemanSayisi.toString() + 'kayıt silindi\n\n'),
      //   duration: const Duration(seconds: 2),
      // ));

      setState(() {
        tumOgrencilerListesi!.clear();
      });
    }
    tiklananOgrenciID = null;
  }

  Future<void> _ogrenciSil(
      int dbdenSilmekIcinID, int listedenSilmekIcinIndex) async {
    var sonuc = await _databaseHelper!.ogrenciSil(dbdenSilmekIcinID);
    if (sonuc == 1) {
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text(
            tumOgrencilerListesi![listedenSilmekIcinIndex].id.toString() +
                "  ID'li eleman Silindi\n\n"),
        duration: const Duration(seconds: 2),
      ));
      setState(() {
        tumOgrencilerListesi!.removeAt(listedenSilmekIcinIndex);
      });
    } else {
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text("Silme İşlemi Başarısız"),
        duration: const Duration(seconds: 2),
      ));
    }

    tiklananOgrenciID = null;
  }

  /*
  Future<void> _ogrenciSil(int dbdenSilmekIcinID, int listedenSilmekIcinID) async {
    var sonuc = await _databaseHelper!.ogrenciSil(dbdenSilmekIcinID);
    if (sonuc == 1) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
        content: Text(tumOgrencilerListesi![listedenSilmekIcinID].id.toString() +
            "  ID'li eleman Silindi\n\n"),
        duration: const Duration(seconds: 2),
      ));
      setState(() {
        tumOgrencilerListesi!.removeAt(listedenSilmekIcinID);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.redAccent,
        content: Text("Silme İşlemi Başarısız"),
        duration: const Duration(seconds: 2),
      ));
    }
  }
  */

  void _ogrenciGuncelle(Ogrenci ogrenci) async {
    var sonuc = await _databaseHelper!.ogrenciGuncelle(ogrenci);
    if (sonuc == 1) {
      _scaffoldKey.currentState!.showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        content: Text("Kayıt Güncellendi"),
      ));

      setState(() {
        tumOgrencilerListesi![tiklananOgrenciIndexi!] = ogrenci;
      });
    }
  }
  /*
  void _ogrenciGuncelle(Ogrenci ogrenci) async {
    int guncellenenElemanSayisi =
        await _databaseHelper!.ogrenciGuncelle(ogrenci);
    if (guncellenenElemanSayisi == 1) {
      setState(() {
        tumOgrencilerListesi![tiklanilanElemaninIndexi!] = ogrenci;
      });
    }
  }
  */
}
