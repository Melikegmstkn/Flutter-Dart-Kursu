import 'dart:math';

/**
 * Classları oluşturuken tanımlanan değişkenler için de null safety 
 * özellikleri geçerlidir
 * 
 * Bu propertylerin getter ve setter metotları doğrudan beya dolaylı yoldan vardır 
 * bundan dolayı da bu değişkenler aynı scope içinde farklı degerler üretebilirler. 
 * Bu yapılara her erişim yaptığımızda farklı sonuçlar alabiliriz. 
 * 
 * Çözüm : ilgili veriyi bir değişkende saklayıp getter üzerinden değil
 * değişken üzerinden kontrolleri yapmak. 
 */

main(List<String> args) {
  RastgeleMetinUret uretici = RastgeleMetinUret();
  String? uretilenDeger = uretici.degerUret();
  //her seferinde farklı deger döndürme ihtimaline karşı 
  //uretilen değeri değişkende tutuyoruz

  if (uretilenDeger == null) {
    print("Null deger getirildi");
  } else {
    metniYazdir(uretilenDeger);
  }
}

class RastgeleMetinUret {
  String? degerUret() {
    if (Random().nextBool())
      return "string ifade";
    else
      return null;
  }
}

void metniYazdir(String ifade) {
  print(ifade);
}
