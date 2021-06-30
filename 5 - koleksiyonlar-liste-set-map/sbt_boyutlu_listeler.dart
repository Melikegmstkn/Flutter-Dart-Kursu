main(List<String> args) {
  //int
  List<int> sayilar = List.filled(5, 0);
  sayilar[0] = 3;
  sayilar[1] = 6;
  sayilar[2] = 7;
  sayilar[4] = 122;

  for (int i = 0; i < sayilar.length; i++) {
    print("$i indexindeki sayi: ${sayilar[i]}");
  }

  print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
  for (int okunanSayi in sayilar) {
    print("Okunan numara : $okunanSayi");
  }

  print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
  sayilar.forEach((sayi) => print(sayi));

  //string
  List<String> isimler = List.filled(3, "");
  isimler[0] = "melike";
  isimler[1] = "nesli";
  isimler[2] = "rumeysa";

  print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
  for (String okunanIsim in isimler) {
    print("Okunan isim : $okunanIsim");
  }

  //karisik
  List karisik = List.filled(5, 0); //List<dynamic> karisik = List<dynamic>.filler(5,0)
  karisik[0] = "Melike";
  karisik[1] = 5;
  karisik[2] = false;

  print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
  for (var x in karisik) {
    print(x);
  }
}
