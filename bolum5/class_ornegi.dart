main(List<String> args) {
  Ogrenci melike = Ogrenci();
  melike.ogrNo = 25;
  melike.ogrAd = "Melike Gümüştekin";
  melike.aktifMi = true;

  Ogrenci nesli = Ogrenci();
  var rumeysa = Ogrenci(); //Ogrenci veri türü gibi düşünülebilir
  dynamic oznur = Ogrenci();
}

class Ogrenci {
  int? ogrNo;
  String ogrAd = "";
  bool aktifMi = true;

  void dercCalis() {
    print("Öğrenci ders çalışıyor");
  }
}
