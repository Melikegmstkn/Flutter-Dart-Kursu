main(List<String> args) {
  Araba honda = Araba(2019, "honda", true);
  honda.modelYili = 2021;
  honda.bilgileriGoster();

  var bmw = Araba(2021, "BMW", true);
  bmw.bilgileriGoster();

  var reno = Araba(2020, "reno", true);
  reno.bilgileriGoster(); //bilgiler null olur

  var citroen = Araba.markasizKurucuMethot(false, 2019);
  Araba suzuki = Araba.modelYiliOlmayanKurucuMethot(true, "suzuki");

  suzuki.bilgileriGoster();
  suzuki.yasHesapla();
}

class Araba {
  int? modelYili;
  String? marka;
  bool? otomatikMi;

  /*  Araba(int yil, String marka, bool otomatikMi) {
    print("Kurucu method tetiklendi");
    this.modelYili = modelYili;
    this.marka = marka;
    this.otomatikMi = otomatikMi;
  } */ // --->

  Araba(this.modelYili, this.marka, this.otomatikMi) {
    print("Kurucu method tetiklendi");
  }

  Araba.markasizKurucuMethot(this.otomatikMi, this.modelYili);

  Araba.modelYiliOlmayanKurucuMethot(bool otomatikMi, String marka) {
    this.otomatikMi = otomatikMi;
    this.marka = marka;
  }

  void bilgileriGoster() {
    print(
        "Arabanın model yılı: $modelYili, markası : $marka, otomatik mi : $otomatikMi");
  }

  void yasHesapla() {
    if (modelYili != null)
      print("Arabanın yaşı: ${2021 - modelYili!}");
    else
      print("Model yılı olmadığından yaş hesaplanamadı");
  }
}
