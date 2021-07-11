import 'dart:async';
import 'dart:io';

import 'package:hello_word/model/ogrenci.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  ///CRUD İŞLEMLERİ
  // bu sınıftan herhangi bir nesne üretmeden kullanılması için static yapmak gerekir
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String _ogrenciTablo = "ogrenci";

  String _columnID = "id";
  String _columnIsim = "isim";
  String _columnAktif = "aktif";

  //db varsa onu kullanır yoksa yeni oluşturur
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal(); //db olusturur
      print("db null idi oluşturuldu");
      return _databaseHelper!;
    } else {
      print("db null değildi var olan kullanıldı");
      return _databaseHelper!;
    }
  }

  DatabaseHelper._internal();

  //sistemdeki veri tabanını getirir
  Future<Database> _getDatabase() async {
    if (_database == null) {
      print("DB nulldı oluşturulacak");
      _database = await _intializeDatabase();
      return _database!;
    } else {
      print("DB null değildi var olan kullanılacak");
      return _database!;
    }
  }

  _intializeDatabase() async {
    Directory klasor = await getApplicationDocumentsDirectory();
    String dbPath = join(klasor.path + "/ogrenci.db"); // db ismi verilir
    print("db path " + dbPath); //açılacak olan db nin pathi

    var ogrenciDB = openDatabase(dbPath, version: 1, onCreate: _dbCreate);

    return ogrenciDB;
  }

  //DB TABLO OLUŞTURMA
  Future<FutureOr<void>> _dbCreate(Database db, int version) async {
    print("create db metodu çalıştı tablo oluşturulacak");
    await db.execute(
        "CREATE TABLE $_ogrenciTablo ($_columnID INTEGER PRIMARY KEY AUTOINCREMENT, $_columnIsim TEXT, $_columnAktif INTEGER )");
  }

  //DB VERİ EKLEME
  Future<int> ogrenciEkle(Ogrenci ogrenci) async {
    var db = await _getDatabase();
    var sonuc = await db.insert(_ogrenciTablo, ogrenci.mapeDonustur(),
        nullColumnHack: "$_columnID");
    // nullColumnHack -> sutun adı verilmese de id verdirir
    print("ogrenci dbye eklendi : " + sonuc.toString());
    return sonuc;
  }

  //DB VERİ LİSTELEME
  Future<List<Map<String, dynamic>>> tumOgrenciler() async {
    var db = await _getDatabase();
    var ogrenciListesi = db.query(_ogrenciTablo, orderBy: "$_columnID DESC");
    return ogrenciListesi;
  }

  //DB VERİ GUNCELLEME
  Future<int> ogrenciGuncelle(Ogrenci ogrenci) async {
    var db = await _getDatabase();

    var sonuc = await db.update(_ogrenciTablo, ogrenci.mapeDonustur(),
        where: "$_columnID = ?", whereArgs: [ogrenci.id]);

    return sonuc;
  }

  //DB VERİ SİLME
  Future<int> ogrenciSil(int id) async {
    var db = await _getDatabase();

    var sonuc = await db
        .delete(_ogrenciTablo, where: "$_columnID = ?", whereArgs: [id]);
    // kaç tane veri sildiğini döndürür
    return sonuc;
  }

  //DB TABLO SİLME
  Future<int> tumOgrenciTablosunuSil() async {
    var db = await _getDatabase();

    var sonuc = await db.delete(_ogrenciTablo);

    return sonuc;
  }
}
