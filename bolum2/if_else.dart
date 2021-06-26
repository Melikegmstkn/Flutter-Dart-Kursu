main(List<String> args) {
  int s1 = 3;
  int s2 = 5;
  int kucukSayi;

  if (s1 > s2) {
    print("$s1, $s2 sayısından büyüktür");
  } else if (s1 < s2) {
    print("$s1, $s2 sayısından küçüktür");
  } else {
    print("$s1, $s2 eşittir");
  }

  //ternary if -> tek satırda koşul Kullanımı ----> koşul ? expression1 : expression2
  kucukSayi = s1 < s2 ? s1 : s2;
  print("küçük sayi : $kucukSayi");

  String? isim = null;
  String? soyIsim = "Gumustekin";
  String? mesaj;

  mesaj = isim ?? soyIsim; // isim null değilse isim null ise soyadı yazdır
  print("Merhaba $mesaj");
}
