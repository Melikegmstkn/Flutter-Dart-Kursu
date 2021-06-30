main(List<String> args) {
  List<int> sayilar = [11, 1, 9, 3, 15, 7, 5, 13];

  print(sayilar.length); //eleman sayisi
  print(sayilar.first); //ilk eleman
  print(sayilar.last); //son eleman
  print(sayilar.isEmpty); //liste boşsa true değilse false dönderir
  print("boş mu : " + sayilar.isEmpty.toString());
  print(sayilar);
  print(sayilar.reversed); //tersten yazdirir

  sayilar.remove(3); //3 ' ü siler
  print(sayilar);

  sayilar.removeAt(3); //3. elemanı siler
  print(sayilar);

  //sayilar.clear(); // listeyi temizler

  if (sayilar.contains(9)) {
    print("Listede 9 var");
  } else {
    print("Listede 9 yok");
  }

  print(sayilar.elementAt(2)); //listedeki ikinci eleman  (0dan baslayarak)
  print(sayilar.indexOf(5)); //11 sayisinin indexi
  sayilar.shuffle(); // elemanların yerlerini rastgele değistirir
  print(sayilar);
}
