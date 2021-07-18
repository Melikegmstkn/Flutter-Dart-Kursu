import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class FirestoreIslemleri extends StatefulWidget {
  @override
  _FirestoreIslemleriState createState() => _FirestoreIslemleriState();
}

class _FirestoreIslemleriState extends State<FirestoreIslemleri> {
  PickedFile? _secilenResim;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firestore Islemleri"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Veri Ekle"),
              color: Colors.green,
              onPressed: _veriEkle,
            ),
            RaisedButton(
              child: Text("Transaction Ekle"),
              color: Colors.blue,
              onPressed: _transactionEkle,
            ),
            RaisedButton(
              child: Text("Veri Sil"),
              color: Colors.red,
              onPressed: _veriSil,
            ),
            RaisedButton(
              child: Text("tümünü sil"),
              color: Colors.green,
              onPressed: _tumunuSil,
            ),
            RaisedButton(
              child: Text("Veri Oku"),
              color: Colors.pink,
              onPressed: _veriOku,
            ),
            RaisedButton(
              child: Text("Veri Sorgula"),
              color: Colors.brown,
              onPressed: _veriSorgula,
            ),
            /*
            RaisedButton(
              child: Text("Galeriden Storagea Resim"),
              color: Colors.orange,
              //onPressed: _galeriResimUpload,
            ),

            RaisedButton(
              child: Text("Kameradan Storagea Resim"),
              color: Colors.purple,
              //onPressed: _kameraResimUpload,
            ),
            */
            Expanded(
              child: _secilenResim == null
                  ? Text("Resim YOK")
                  : Image.file(File(_secilenResim!.path)),
            )
          ],
        ),
      ),
    );
  }

  void _veriEkle() {
    Map<String, dynamic> melikeEkle = Map();
    melikeEkle['ad'] = "melike Güm";
    melikeEkle['lisansMezunu'] = true;
    melikeEkle['lisansMezunu2'] = true;
    melikeEkle['lisansMezunu23'] = true;
    melikeEkle['okul'] = "ondokuzmayıs";
    melikeEkle['para'] = 900;

    _firestore
        .collection("users")
        .doc("melike_gmstkn")
        .set(
            melikeEkle,
            SetOptions(
                merge: true)) //merge var olanın üzerine yazma yeni ekle demek
        .then((v) => debugPrint("melike eklendi"));

    _firestore
        .collection("users")
        .doc("hasan_yilmaz")
        .set({'ad': 'Hasan', 'cinsiyet': 'erkek', 'para': 300}).whenComplete(
            () => debugPrint("hasan eklendi"));

    _firestore.doc("/users/ayse").set({'ad': 'ayse'});

    _firestore.collection("users").add({'ad': 'can', 'yas': 35});

    String yeniKullaniciID = _firestore.collection("users").doc().id;
    debugPrint("yeni doc id: $yeniKullaniciID");
    _firestore.doc("users/$yeniKullaniciID").set({
      'ad': 'Nesli',
      'yas': 30,
      'userID': '$yeniKullaniciID'
    }).whenComplete(() => debugPrint("nesli eklendi"));

    // _firestore.doc("users/melike_gmstkn").update({
    //   'okul': 'ege üniversitesi',
    //   'yas': 60,
    //   'eklenme': FieldValue.serverTimestamp(),
    //   'begeniSayisi': FieldValue.increment(10)
    // }).then((v) {
    //   debugPrint("melike güncellendi");
    // });
  }

  //çift taraflı güncelleme gibi
  void _transactionEkle() {
    final DocumentReference emreRef = _firestore.doc("users/melike_gmstkn");

    debugPrint("doc id:" + emreRef.id);

    _firestore.runTransaction((Transaction transaction) async {
      DocumentSnapshot melikeData = await emreRef.get();

      debugPrint("doc id:" + melikeData.id);

      if (melikeData.exists) {
        var melikeninParasi = melikeData['para'];

        if (melikeninParasi > 100) {
          transaction.update(emreRef, {'para': (melikeninParasi - 100)});
          transaction.update(_firestore.doc("users/hasan_yilmaz"),
              {'para': FieldValue.increment(100)});
        } else {
          debugPrint("yetersiz bakiye");
        }
      } else {
        debugPrint("emre dökümanı yok");
      }
    });
  }

  void _veriSil() {
    //Döküman silme
    _firestore.doc("users/ayse").delete().then((aa) {
      debugPrint("ayse silindi");
    }).catchError((e) => debugPrint("Silerken hata cıktı" + e.toString()));

    _firestore
        .doc("users/hasan_yilmaz")
        .update({'cinsiyet': FieldValue.delete()}).then((aa) {
      debugPrint("cinsiyet silindi");
    }).catchError((e) => debugPrint("Silerken hata cıktı" + e.toString()));
  }

  void _tumunuSil() {
    _firestore.collection('users').get().then((snapshot) {
      for (DocumentSnapshot veri in snapshot.docs) {
        veri.reference.delete();
        var ad = veri['ad'];
        debugPrint("$ad silindi");
      }
      debugPrint("tüm kullanıcılar silindi");
    });
  }

  Future _veriOku() async {
    //tek bir dökümanın okunması
    DocumentSnapshot documentSnapshot =
        await _firestore.doc("users/melike_gmstkn").get();
    debugPrint("Döküman id:" + documentSnapshot.id);
    debugPrint("Döküman var mı:" + documentSnapshot.exists.toString());
    debugPrint("Döküman string: " + documentSnapshot.toString());
    debugPrint("bekleyen yazma var mı:" +
        documentSnapshot.metadata.hasPendingWrites.toString());
    debugPrint("cacheden mi geldi:" +
        documentSnapshot.metadata.isFromCache.toString());
    debugPrint("cacheden mi geldi:" + documentSnapshot.data().toString());
    debugPrint("cacheden mi geldi:" + documentSnapshot['ad']);
    debugPrint("cacheden mi geldi:" + documentSnapshot['para'].toString());

    Map melikeGum = (documentSnapshot.data() as Map);

    melikeGum.forEach((key, deger) {
      debugPrint("key : $key deger : $deger");
    });

    //tum koleksiyonun okunması
    _firestore.collection("users").get().then((querySnapshots) {
      debugPrint("User koleksiyonundaki eleman sayısı:" +
          querySnapshots.docs.length.toString());

      for (int i = 0; i < querySnapshots.docs.length; i++) {
        debugPrint(querySnapshots.docs[i].data().toString());
      }

      //anlık değişikliklerin dinlenmesi
      DocumentReference ref =
          _firestore.collection("users").doc("melike_gmstkn");
      ref.snapshots().listen((degisenVeri) {
        debugPrint("anlık :" + degisenVeri.data().toString());
      });

      _firestore.collection("users").snapshots().listen((snap) {
        debugPrint(snap.docs.length.toString());
      });
    });
  }

  void _veriSorgula() async {
    var dokumanlar = await _firestore
        .collection("users")
        .where("email", isEqualTo: 'ayse@ayse.com')
        .get();
    for (var dokuman in dokumanlar.docs) {
      debugPrint(dokuman.data().toString());
    }

    var limitliGetir = await _firestore.collection("users").limit(3).get();
    for (var dokuman in limitliGetir.docs) {
      debugPrint("Limitli getirenler" + dokuman.data().toString());
    }

    var diziSorgula = await _firestore
        .collection("users")
        .where("dizi", arrayContains: 'breaking bad')
        .get();
    for (var dokuman in diziSorgula.docs) {
      debugPrint("Dizi şartı ile getirenler" + dokuman.data.toString());
    }

    var stringSorgula = await _firestore
        .collection("users")
        .orderBy("email")
        .startAt(['melike']).endAt(['melike' + '\uf8ff']).get();
    for (var dokuman in stringSorgula.docs) {
      debugPrint("String sorgula ile getirenler" + dokuman.data.toString());
    }

    _firestore.collection("users").doc("melike_gmstkn").get().then((docSnap) {
      debugPrint("melike verileri" + docSnap.data().toString());

      _firestore
          .collection("users")
          .orderBy('begeni')
          .endAt([docSnap.data()!['begeni']])
          .get()
          .then((querySnap) {
            if (querySnap.docs.length > 0) {
              for (var bb in querySnap.docs) {
                debugPrint(
                    "m begenisinden fazla olan user:" + bb.data().toString());
              }
            }
          });
    });
  }

  /*
  void _galeriResimUpload() async {
    var _picker = ImagePicker();
    var resim = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _secilenResim = resim!;
    });

    StorageReference ref = FirebaseStorage.instance
        .ref()
        .child("user")
        .child("emre")
        .child("profil.png");
    StorageUploadTask uploadTask = ref.putFile(File(_secilenResim!.path));

    var url = await (await uploadTask.onComplete).ref.getDownloadURL();
    debugPrint("upload edilen resmin urlsi : " + url);
  }


  void _kameraResimUpload() async {
    var resim = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _secilenResim = resim!;
    });

    StorageReference ref = FirebaseStorage.instance
        .ref()
        .child("user")
        .child("hasan")
        .child("profil.png");
    StorageUploadTask uploadTask = ref.putFile(File(_secilenResim!.path));

    var url = await (await uploadTask.onComplete).ref.getDownloadURL();
    debugPrint("upload edilen resmin urlsi : " + url);
  }
  */

}
