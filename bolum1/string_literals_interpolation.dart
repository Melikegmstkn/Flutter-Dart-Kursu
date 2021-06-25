main(List<String> args) {
  //literal -> degisken tanımlamadan atanan degerler
  //Interpolation -> string ifade içinde baska bir string ifadeyi $ifade olarak kullabiliriz. Böylece + kullanmak gerekmez.

  String isim = "Melike";
  String soyAd = "Gumustekin";
  var kurs = "Dart\'ın kullanımı";
  String kursTanimi = "Dart'ı ve Flutter'i öğrenmek";

  print(isim + " " + soyAd);
  print("$isim $soyAd");
  print("$soyAd karakter sayisi = " + soyAd.length.toString());
  print("$soyAd karakter sayisi = ${soyAd.length}");

  int sayi1= 50;
  double sayi2 = 52.65;
  print("birinci sayi : " + sayi1.toString() + " ikinci sayi :" + sayi2.toString());
  print(" birinci sayi $sayi1 ikinci sayi: $sayi2");

  double en = 10;
  double boy = 12;
  print("Eni $en boyu $boy olan dikdörtgenin alanı : ${en*boy}");
  print("Eni ${en.toInt()} boyu ${boy.toInt()} olan dikdörtgenin alanı : ${en*boy}");
  print("Eni $en boyu $boy olan dikdörtgenin alanı : ${(en*boy).toInt()}");
  
}
