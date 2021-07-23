import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'kategori_islemleri.dart';
import 'models/kategori.dart';
import 'models/notlar.dart';
import 'not_detay.dart';
import 'utils/database_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Not Sepeti',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Raleway',
          primarySwatch: Colors.purple,
          accentColor: Colors.orange),
      home: NotListesi(),
    );
  }
}

class NotListesi extends StatelessWidget {
  DatabaseHelper? databaseHelper = DatabaseHelper();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      floatingActionButton: fabButtons(context),
      body: Notlar(),
    );
  }

  Column fabButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: "kategoriEkle",
          backgroundColor: Colors.orange,
          onPressed: () {
            kategoriEkleDialog(context);
          },
          child: Icon(Icons.add_circle),
          mini: true,
          tooltip: "Kategori Ekle",
        ),
        SizedBox(height: 7),
        FloatingActionButton(
          heroTag: "notDetay",
          onPressed: () {
            _notDetaySayfasi(context);
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }

  void kategoriEkleDialog(BuildContext context) {
    String? yeniKategoriAdi;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return SimpleDialog(
          titleTextStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
          ),
          titlePadding: EdgeInsets.all(4),
          title: Text("Kategori Ekle"),
          children: [
            Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Kategori adı giriniz",
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(),
                  ),
                  validator: (girilenKategoriAdi) {
                    if (girilenKategoriAdi!.length < 2) {
                      return "Kategori adı en az 2 karakter olmalıdır.";
                    }
                  },
                  onSaved: (value) {
                    yeniKategoriAdi = value!;
                  },
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      databaseHelper!
                          .kategoriEkle(Kategori(yeniKategoriAdi))
                          .then(
                        (gelenKategoriId) {
                          if (gelenKategoriId > 0) {
                            Navigator.pop(context);
                            print("Kayıt ekleme Başarılı $gelenKategoriId");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.blue,
                              content: Text(gelenKategoriId.toString() +
                                  "ID'li kayıt oluşturuldu\n"),
                              duration: const Duration(seconds: 2),
                            ));
                          }
                        },
                      );
                    }
                  },
                  child: Text("Ekle"),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Kapat"),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text("Not Sepeti"),
      actions: [
        PopupMenuButton(itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.category),
                title: Text("Kategoriler"),
                onTap: () {
                  Navigator.pop(context);

                  _kategoriIslemleri(context);
                },
              ),
            ),
          ];
        })
      ],
    );
  }

  void _notDetaySayfasi(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NotDetay(),
      ),
    );
  }

  void _kategoriIslemleri(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Kategoriler()));
  }
}

class Notlar extends StatefulWidget {
  @override
  _NotlarState createState() => _NotlarState();
}

class _NotlarState extends State<Notlar> {
  List<Not>? tumNotlar;
  DatabaseHelper? databaseHelper;

  @override
  void initState() {
    super.initState();
    // tumNotlar = List<Not>();
    tumNotlar = [];
    databaseHelper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyleBaslik = Theme.of(context).textTheme.body1!.copyWith(
        fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'Raleway');

    return FutureBuilder(
      future: databaseHelper!.notListesiniGetir(),
      builder: (context, AsyncSnapshot<List<Not>> snapShot) {
        if (snapShot.connectionState == ConnectionState.done) {
          tumNotlar = snapShot.data;
          sleep(Duration(milliseconds: 500));
          return ListView.builder(
              itemCount: tumNotlar!.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  leading: _oncelikIconuAta(tumNotlar![index].notOncelik!),
                  title: Text(
                    tumNotlar![index].notBaslik!,
                    style: textStyleBaslik,
                  ),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Kategori",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  tumNotlar![index].kategoriBaslik!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Theme.of(context).accentColor),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Oluşturulma Tarihi",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  databaseHelper!.dateFormat(DateTime.parse(
                                      tumNotlar![index].notTarih!)),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Theme.of(context).accentColor),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "İçerik",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 14),
                                child: Text(
                                  tumNotlar![index].notIcerik!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.blueGrey),
                                ),
                              ),
                            ],
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              OutlineButton(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                  onPressed: () =>
                                      _notSil(tumNotlar![index].notID!),
                                  child: Text(
                                    "SİL",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  )),
                              OutlineButton(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor),
                                  onPressed: () {
                                    _detaySayfasinaGit(
                                        context, tumNotlar![index]);
                                  },
                                  child: Text(
                                    "GÜNCELLE",
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
        } else {
          return Center(child: Text("Yükleniyor..."));
        }
      },
    );
  }

  _detaySayfasinaGit(BuildContext context, Not not) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NotDetay(
                  baslik: "Notu Düzenle",
                  duzenlenecekNot: not,
                )));
  }

  _oncelikIconuAta(int notOncelik) {
    switch (notOncelik) {
      case 0:
        return CircleAvatar(
            radius: 26,
            child: Text(
              "AZ",
              style: TextStyle(
                  color: Colors.deepOrange.shade200,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.blueGrey.shade200);
        break;
      case 1:
        return CircleAvatar(
            radius: 26,
            child: Text(
              "ORTA",
              style: TextStyle(
                  color: Colors.deepOrange.shade400,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.blueGrey.shade200);
      case 2:
        return CircleAvatar(
            radius: 26,
            child: Text(
              "ACIL",
              style: TextStyle(
                  color: Colors.deepOrange.shade700,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.blueGrey.shade200);
        break;
    }
  }

  _notSil(int notID) {
    databaseHelper!.notSil(notID).then((silinenID) {
      if (silinenID != 0) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Not Silindi")));

        setState(() {});
      }
    });
  }
}

/*
class NotListesi extends StatelessWidget {
  DatabaseHelper databaseHelper = DatabaseHelper();
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Kategori>? tumKategoriler = List<Kategori>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Not Sepeti",
          style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.w700),
        ),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: ListTile(
                    leading: Icon(
                      Icons.import_contacts,
                      color: Colors.orange,
                    ),
                    title: Text(
                      "Kategoriler",
                      style: TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.w700),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _kategorilerSayfasinaGit(context);
                    },
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              kategoriEkleDialog(context);
            },
            heroTag: "KategoriEkle",
            tooltip: "Kategori Ekle",
            child: Icon(
              Icons.import_contacts,
              color: Colors.white,
            ),
            mini: true,
          ),
          FloatingActionButton(
            tooltip: "Not Ekle",
            heroTag: "NotEkle",
            onPressed: () => tumKategoriler!.length != 0
                ? _detaySayfasinaGit(context)
                : _scaffoldKey.currentState!.showSnackBar(
                    SnackBar(
                      content: Text("Kategori Boş!!! Önce Kategori Ekleyiniz."),
                      duration: Duration(seconds: 2),
                    ),
                  ),
            child: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: Notlar(),
    );
  }

  void kategoriEkleDialog(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    String? yeniKategoriAdi;

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              "Kategori Ekle",
              style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w700,
                  color: Colors.blueGrey),
            ),
            children: <Widget>[
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (yeniDeger) {
                      yeniKategoriAdi = yeniDeger!;
                    },
                    decoration: InputDecoration(
                      labelText: "Kategori Adı",
                      border: OutlineInputBorder(),
                    ),
                    validator: (girilenKategoriAdi) {
                      if (girilenKategoriAdi!.length < 3) {
                        return "En az 3 karakter giriniz";
                      }
                    },
                  ),
                ),
              ),
              ButtonBar(
                children: <Widget>[
                  OutlineButton(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.orangeAccent,
                    child: Text(
                      "Vazgeç",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  OutlineButton(
                    borderSide:
                        BorderSide(color: Theme.of(context).accentColor),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        databaseHelper
                            .kategoriEkle(Kategori(yeniKategoriAdi))
                            .then((kategoriID) {
                          if (kategoriID > 0) {
                            _scaffoldKey.currentState!.showSnackBar(
                              SnackBar(
                                content: Text("Kategori Eklendi"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        });
                      }
                    },
                    color: Colors.redAccent,
                    child: Text(
                      "Kaydet",
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }

  _detaySayfasinaGit(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NotDetay(
                  baslik: "Yeni Not",
                )));
  }

  void _kategorilerSayfasinaGit(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Kategoriler()));
  }
}
*/
