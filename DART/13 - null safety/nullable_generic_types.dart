/**
 * Generic tipleri belirtirken de nullable ve non-nullable geçerlidir.
 * Önemli olan nereye ? koyacağımız.
 * 
 * Liste null olabilir diyorsak  -> List<String>?
 * Listede bazı elemanlar null olabilir diyorsak -> List<String?>
 */

main(List<String> args) {
  List<String> stringListe = ["rumeysa", "melike", "nesli"];
  List<String>? nullOlabilecekStringList; //Liste null olabilir
  List<String?> nullOlabilecekStringleriTutanList = [
    //Listede bazı elemanlar null olabilir
    "melike",
    null,
    "gümüştekin"
  ];

  print("string listesi : $stringListe");
  print("null olabilecek string liste $nullOlabilecekStringList");
  print(
      "null olabilecek stringleri tutan liste $nullOlabilecekStringleriTutanList");
}
