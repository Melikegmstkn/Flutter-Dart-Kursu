/**
 * Abstract soyut sınıf: Sınıflar arasında soyutlama yapmak için kullanılır.
 * Abstract sınıflardan nesne üretilemez , abstract sınıflarda normal ve abstract methodlar olur
 * abstract methodlar alt sınıflarca override edilmek zorundadır.
 * 
 * Bir sınıfta bir tane abstract method varsa o sınıf mutlaka abstract tanımlanmalıdır.
 * 
 * abstract sınıfından kalıtım alan classlarda abstract sınıfı fonksiyonları ovveride edilmek zorunda
 */
main(List<String> args) {
  //Sekil s1 = Sekil(); -> hata verir çünkü abstract sınıflardan nesne oluşturulmaz

  Sekil s1 = Kare(5); //kare sınıfı abstract değil nesne üretilir
  print(
      "Kare seklinin alanı : ${s1.alanHesapla()} \t cevresi : ${s1.cevreHesapla()}");

  Sekil s2 = Dikdortgen(3, 5); //kare sınıfı abstract değil nesne üretilir
  print(
      "Kare seklinin alanı : ${s2.alanHesapla()} \t cevresi : ${s2.cevreHesapla()}");
  s2.selamla();

  List<Kare> tumKareler = [];
  List<Dikdortgen> tumDikdortgenler = [];
  List<Sekil> tumSekiller = [];

  tumSekiller.add(s1);
  tumSekiller.add(s2);

  test(s1);
  test(s2);
}

void test(Sekil s) {
  s.alanHesapla();
  s.alanHesapla();
}

abstract class Sekil {
  double alanHesapla();
  double cevreHesapla();

  void selamla() {
    //bu method ovveride edilmese de olur
    print("Ben şekil sınıfıyım");
  }
}

class Kare extends Sekil {
  int kenar;

  Kare(this.kenar);

  @override
  double alanHesapla() {
    return kenar * kenar.toDouble();
  }

  @override
  double cevreHesapla() {
    return 4 * kenar.toDouble();
  }
}

class Dikdortgen extends Sekil {
  int kenar1, kenar2;

  Dikdortgen(this.kenar1, this.kenar2);

  @override
  double alanHesapla() {
    return kenar1 * kenar2.toDouble();
  }

  @override
  double cevreHesapla() {
    return kenar1 * 2 + kenar2 * 2;
  }
}
