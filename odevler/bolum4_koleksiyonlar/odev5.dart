import 'dart:io';

main(List<String> args) {
  var liste = <int>[];

  int sayi = 0;

  do {
    print("Sayı giriniz, çıkış için -1 giriniz :");
    sayi = int.parse(stdin.readLineSync()!);
    if (sayi != -1) liste.add(sayi);
  } while (sayi != -1);

  print("Girilen sayıların adedi   : ${liste.length}");
  print("Girilen sayıların toplamı : ${sayilarToplami(liste)}");
  print(
      "Girilen sayıların ortalaması : ${sayilarOrtalama(liste, sayilarToplami(liste))}");
}

double sayilarOrtalama(List<int> liste, int toplam) {
  return toplam / liste.length;
}

int sayilarToplami(List<int> liste) {
  int toplam = 0;
  for (int sayi in liste) toplam += sayi;

  return toplam;
}
