import 'dart:math';

main(List<String> args) {
  List<int> liste1 = List.filled(5, 0);
  var liste2 = List<int>.filled(5, 0);
  List<int> sonListe = <int>[]; //<int> -> listenin tuttuğu veri türünü belirtir olması daha iyi ama olmasa da olur

  for (var i = 0; i < 5; i++) {
    liste1[i] = Random().nextInt(50);
    liste2[i] = Random().nextInt(50);
  }

  sonListe = [...liste1, ...liste2];

  Set<int> kareListe = Set();
  kareListe.addAll(sonListe);

  print("SON LİSTE");
  for (int sayi in sonListe) {
    print("sayı : ${sayi}");
  }

  print("\nSET");
  for (int sayi in kareListe) {
    print("sayı : ${sayi * sayi}");
  }
}
