/**
 * Bazı değişkenler veya propertyler non-nullable olmalı ama ilk deger ataması 
 * hemen gerçekleşmeyecektir. Bu durumlarda late anahtar kelimesi kullanılır. 
 * 
 * LATE_degisken; demek ->
 * 1- bu değişkene deger atama
 * 2- değeri sonradan atayacaksın
 * 3- ENDİŞELENME! Değişkeni sen okumadan önce initialize edeceğim
 * 
 */

class Yemek {
  late final String tanim;
  late final int fiyat;
  Yemek(int fiyat) {
    this.fiyat = fiyat;
  }
  void setTanim(String tanim) {
    this.tanim = tanim;
  }
}

main(List<String> args) {
  final yemegim = Yemek(10);

  yemegim.setTanim("kuru fasulye");

  print(yemegim.tanim);
}
