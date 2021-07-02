main(List<String> args) {
  Set<String> isimler = Set();
  isimler.add("Melike");
  isimler.add("Melike");
  isimler.add("nesli");
  isimler.add("Melike");
  isimler.add("nesli");
  isimler.add("rumeysa");

  for (String isim in isimler) {
    print("isim : $isim");
  }

  //index yok. veriiye ulaşmak için :
  if (isimler.contains("Melike")) {}

  bool sonuc = isimler.remove("Melike");
  print("\nsonuc  $sonuc");

  //aynı olan verileri saklamazlar
  Set<int> sayilar =
      Set.from([1, 2, 1, 2, 3, 5, 3, 5, 5, 6, 7, 6, 8, 8, 9]);
  for (int s in sayilar) {
    print("sayı : $s");
  }

  //List - Set veri aktarma
  sayilar.clear();
  List<int> citfSayilar = [0, 2, 4, 6, 8, 10, 2, 4, 6, 8, 10, 2, 2, 6];
  sayilar.addAll(citfSayilar);

  print("\nAktarımdan sonra");
  for (int s in sayilar) {
    print("sayı : $s");
  }
  
}
