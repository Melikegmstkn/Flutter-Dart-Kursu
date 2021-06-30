/**
 * instance degiskenler sadece final olarak tanımlanır const ile tanımlanmaz.
 * const ile tanımlanması için static const olmalı.
 */

//  İNMUTABLE (DEGİZMEZ)
main(List<String> args) {
  var str = "Melike";
  str =
      "Gumustekin"; // artık str 'Gumustekin' i gösterir. 'Melike' çöp toplayıcı tarafından silinir

  final String str2 = "Melike"; //Veri türü belirtilmese de olur
  //str2 = "Gumustekin";  HATA çünkü final

  const String str3 = "Melike";
  //str3 = "Gumustekin";  HATA çünkü const

  //FİNAL - CONST FARKI
  const sayi = 5;
  final sayi2 = 10;

  final trh = DateTime.now();
  //const trh2 = DateTime.now(); -> HATA çünkü const veriler çalışma anından önce belli olmalı

  //FİNAL
  final liste = [1, 2, 3];
  final liste2 = [1, 2, 3];

  //liste ve liste2 bellek adreslerini tutar. Bu yüzden liste != liste2
  if (liste == liste2) {
    print("Eşit");
  } else {
    print("Eşit değil");
  }

  liste.add(4);
  liste2.add(5);
  //liste = [6, 7]; -> FİNAL olarak tanımlanmasaydı bu çalışırdı ve listenin gösterdiği adres değişirdi. İLk adresteki veriler çöp olurdu

  //CONST
  const list = [1, 2, 3];//bu listelerde aynı veriler olduğundan aynı adresi
  const list2 = [1, 2, 3];// gösterirler. *Bellek için avantajlı*
  const list3 = [1, 2, 3];//(canonicalized denir buna)

  //liste ve liste2 bellek adreslerini tutar. Bu yüzden liste != liste2
  if (list == list2) {
    print("Eşit");
  } else {
    print("Eşit değil");
  }

  /*
  list.add(4); //Çalıştırıldığında bu satırlar hata verir çünkü
  list2.add(5); // const hiç bir şekilde değiştirilemez program boyunca sabittir
  */
}
