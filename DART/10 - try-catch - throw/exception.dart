main(List<String> args) {
  try {
    int sayi = 100 ~/ 0; //~ -> virgülden sonrasını almaz
  } catch (e) {
    print("Hata çıktı ${e}");
  } finally {
    print("İşlem bitti");
  }

  print("TRY-CATCH BİTTİ");

  //Çıkacak olan hata biliniyorsa
  try {
    int sayi = 100 ~/ int.parse("m");
  } on IntegerDivisionByZeroException {
    print("Bolen sıfır olamaz");
  } on FormatException catch (e) {
    print(e.message);
    print(e.source);
  } catch (e) {
    print("Hata çıktı");
  } finally {
    print("İşlem bitti");
  }
}
