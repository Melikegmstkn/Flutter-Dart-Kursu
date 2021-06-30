main(List<String> args) {
  List<int> sayilar = [];
  sayilar.add(5);
  sayilar.add(15);
  sayilar.add(15);
  sayilar.add(45);
  sayilar.add(12);
  sayilar.add(85);
  sayilar.add(74);
  sayilar.add(99);

  print("numara : ${sayilar[sayilar.length - 1]}");
  print("Listedeki eleman sayisi ${sayilar.length}");

  for (int s in sayilar) {
    print("sayi : $s");
  }
  print("************************************ ");
  sayilar.remove(15); //15 silinir
  for (int s in sayilar) {
    print("sayi : $s");
  }
  print("Cleardan sonra Listedeki eleman sayisi ${sayilar.length}");

  print("************************************ ");

  sayilar.removeAt(6);
  for (int s in sayilar) {
    print("sayi : $s");
  }

  List<String> sehirler = ["ankara", "izmir", "bursa"];
  sehirler.add("van");
  sehirler.add("malatya");
  sehirler.add("yozgat");

  print("************************************ ");
  for (String sehir in sehirler) {
    print("Sehir : $sehir");
  }
}
