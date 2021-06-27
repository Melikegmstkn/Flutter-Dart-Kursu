class Musteri {
  int? _musteriNo;

  //Musteri(this._musteriNo);
  Musteri(int musteriNo) {
    _musteriNoKontrol(musteriNo);
  }

  void _musteriNoKontrol(int no) {
    if (no > 300)
      _musteriNo = no;
    else
      return;
  }

  void set musteriNoAta(int no) {
    if (no > 300)
      _musteriNo = no;
    else
      return;
  }

  String get musteriNoSoyle {
    return "Musteri no : $_musteriNo";
  }

  void bilgileriYazdir() {
    print("Musteri oluşturuldu musteri no : $_musteriNo");
  }
}
