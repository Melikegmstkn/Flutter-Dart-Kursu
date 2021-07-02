main(List<String> args) {
  int yas = 21;
  print(yas);

  yas = 25;
  print(yas);

  num yil = 2021;
  print(yil);

  double sayi = 45;
  print(sayi); //45.0

  // ignore: unused_local_variable
  var sayi2 =
      55; //sayi2'ye sadece int deger atanabilir -> sayi2 = "asdas" /hatalı

  //Degiskenlere null deger ataması
  double? s1 = null;
  print(s1);

  int hexadecimalSayi = 0xAABBCC;
  print(hexadecimalSayi); //11189196
}
