/**
 * Dart, null deger alamayan ama null alacakmış gibi belirtilen nullable tiplere, 
 * non-nullable  gibi davranır. Buna type promation denir.
 * 
 * Dart değişkenin nerede tanımlandığını nerede okunduğunu sürekli analiz eder.
 * Değişken null deger alacak sekilde olusturulmuş olabilir ama okunmadan 
 * önce null dışında bir deger atanırsa dart bunu tespit edebilir. 
 * 
 */

main(List<String> args) {
  String? mesaj;

  if (DateTime.now().hour < 12) {
    mesaj = "Günaydın";
  } else {
    mesaj = "İyi geceler";
  }

  print(mesaj);
  print(mesaj.length);
  

  Object metin="metin";
  if (metin is String) { // Base classtan türetilmiş classa terfi türü
    print(metin.length);
  }
}

