class Ogrenci {
  int id;
  int notu;

  Ogrenci({this.id = 1, this.notu = 1});

  @override
  String toString() {
    return "ID: $id \t | not : $notu";
  }
}

/* class Ogrenci2 {
  int _ogrNo; //ınstance veya Field variable
  String adi;
  bool erkekMi;

  Ogrenci2(this._ogrNo, this.adi, this.erkekMi) {
    print("Ogrenci sınıfından bir nesne üretiliyor ki ben tetiklendim");
  }

  void set ogrenciNoAta(int no) {
    if (no <= 0) {
      this._ogrNo = 1;
    } else {
      this._ogrNo = no;
    }
  }

/*
  String get ogrenciNoOku{
    return "Ogrenci Numarası : $ogrNo";
  }
*/
  String get ogrenciNoOku => "Ogrenci Numarası : $_ogrNo";

  void dersCalis() {}

  void uyu() {}

  void bilgileriYazdir() {
    print(
        "Ogrenci numarasi : ${this._ogrNo} adi : ${this.adi} erkek mi : ${this.erkekMi}");
  }
}
 */