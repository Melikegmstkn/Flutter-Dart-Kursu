/**
 * Higher order functions : bir fonksiyonu parametre olarak alan veya geriye fonksiyon döndüren fonksiyonlardır.
 * Tabi ikisi aynı anda da yapabilir.
 * 
 */
main(List<String> args) {
  List<int> liste = [1, 2, 3];

  //foreach parametre olarak fonksiyon alan bir fonksiyondur
  liste.forEach((element) {
    print("element : $element");
  });

  print("\n~~~\n");
  liste.forEach(callBack);

  print("\n~~~\n");
  kendiForeachYapim(liste, (int deger, int index) {
    print("index : $index \t eleman: $deger");
  });
}

void kendiForeachYapim(List<int> liste, Function fonk) {
  for (int i = 0; i < liste.length; i++) {
    fonk(liste[i], i);
  }
}

void callBack(int element) {
  print("eleman : $element");
}

//HOCANIN GİTHUBINDAKİ
/*
main(List<String> args) {

    Function sayilariTopla = (s1,  s2) => print(s1 + s2);
    birMethod("Emre", sayilariTopla);

    var fonk =  birDigerMethod();
    print(fonk(9));

}

void birMethod(String isim, Function benimFonksiyonum) {
  print("Benim ismim : $isim");
  benimFonksiyonum(9,10);
}

Function birDigerMethod() {
  Function sayininKaresiniAl = (int s1) => s1 * s1;
  return sayininKaresiniAl;
}
*/

