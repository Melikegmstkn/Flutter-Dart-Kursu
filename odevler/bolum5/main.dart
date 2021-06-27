import 'dart:math';
import 'soru1Class_cember_daire.dart';
import 'soru2.dart';

main(List<String> args) {
  /* CemberDaire c1 = CemberDaire(5);
  print("c1 alan : ${c1.alan()}");
  print("c1 cevre : ${c1.cevre()}"); */

  Ogrenci ogr1 = Ogrenci(id: 5, notu: 10);
  List<Ogrenci> tumOgrenciler = List.filled(5, Ogrenci());

  OgrenciListesiniDoldur(tumOgrenciler);
  /* print(tumOgrenciler[5].id);
  print(tumOgrenciler[5].notu); */

  for (Ogrenci ogr in tumOgrenciler) {
    print(ogr);
  }

  print("Ortalama : ${notOrtalamasi(tumOgrenciler)}");
}

void OgrenciListesiniDoldur(List<Ogrenci> liste) {
  for (int i = 0; i < liste.length; i++) {
    liste[i] = Ogrenci(id: Random().nextInt(1000), notu: Random().nextInt(100));
  }
}

double notOrtalamasi(List<Ogrenci> liste) {
  int toplam = 0;

  for (Ogrenci ogr in liste) {
    toplam += ogr.notu;
  }
  return toplam / liste.length;
}
