/**
 * Closure özel bir fonksiyondur, closure ile bir üst kapsamdaki değişkenlerin değerlerini değiştirebiliriz.
 */

main(List<String> args) {
  var dondurulenFonksiyon = topla(3);
  var sonuc = dondurulenFonksiyon(4);

  print(sonuc);
}

Function topla(int eleman) {
  return (int sayi) => eleman * sayi;
}

//HOCADAN
/*
main(List<String> args) {
  String isim = "Emre";

  Function ismimiGoster = () {
    isim = "Emre Altunbilek";
    print(isim);
  };

  ismimiGoster();

  Function konus = () {
    String selam = "Merhaba";

    Function soyle = () {
      selam = "Selamün Aleyküm";
      print(selam);
    };

    return soyle;
  };

  var fonksiyonuAl = konus();

  fonksiyonuAl();
}
*/