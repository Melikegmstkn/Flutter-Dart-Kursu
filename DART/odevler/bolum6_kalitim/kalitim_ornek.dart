main(List<String> args) {
  Kisi melike = Kisi("Melike", 21);
  melike.kendiniTanit();

  Calisan nesli = Calisan("Nesli", 19, 5000);
  nesli.kendiniTanit();
}

class Kisi {
  String isim;
  int yas;

  Kisi(this.isim, this.yas);

  void kendiniTanit() {
    print("Benim adım $isim ve yasım $yas");
  }
}

class Calisan extends Kisi {
  int maas;
  Calisan(String name, int age, this.maas) : super(name, age);
  
  @override
  void kendiniTanit() {
    super.kendiniTanit();
    print("Maaşım da $maas");
  }
}
