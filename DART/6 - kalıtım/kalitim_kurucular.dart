main(List<String> args) {
  Asker melike = Asker("melike", 21);
  Er burcak = Er("burcak", 20);
  burcak.selamla();
  burcak.memleketDegistir("Amasya");
}

class Asker {
  String ad = "varsayılan";
  int yas = 0;
  String memleket = "";

  Asker(this.ad, this.yas) {
    print("Asker sınıfının kurucusu çalıştı");
  }

  void selamla() {
    print("Merhaba adım $ad ve yasım $yas");
  }
}

class Er extends Asker {
  Er(String ad, int yas) : super(ad, yas) {
    print("Er sınıfının kurucusu çalıştı");
  }

  void memleketDegistir(String yeniMemleket) {
    super.memleket = yeniMemleket;
  }

  @override
  void selamla() {
    print("Er sınıfından selamlar");
  }
}

//super.degiskenAdi || super.fonkAdi ile üst sınıfımdaki değişken ve fonklara ulaşabiliriz
//super(parametreler) ile üst sınıfımdaki constractor methoda ulaşabiliriz
