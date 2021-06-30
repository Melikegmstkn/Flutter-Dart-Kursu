main(List<String> args) {
  Ogrenci melike = Ogrenci(5, "Melike");
  Ogrenci nesli = Ogrenci.idsiz("Nesli");
  Ogrenci rum = Ogrenci.factoryKurucusu(-5, "Rumeysa");

  print(rum.id);
  print(rum.isim);
}

//factory kurucu -> return kullanılabilen kurucu methot
class Ogrenci {
  int id = 0;
  String isim = "";

  Ogrenci(this.id, this.isim) {
    print("varsayılan kurucu methot çalıştı");
  }

  Ogrenci.idsiz(this.isim) {
    print("isimlendirilmiş kurucu methot çalıştı");
  }

  factory Ogrenci.factoryKurucusu(int id, String isim) {
    if (id < 0)
      return Ogrenci(1, isim);
    else
      return Ogrenci(id, isim);
  }
}
