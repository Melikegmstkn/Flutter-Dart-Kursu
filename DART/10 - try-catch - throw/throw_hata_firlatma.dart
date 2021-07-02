//kendi hata mesajını oluşturma
import 'dart:math';

main(List<String> args) {
  try {
    double sayi = kareKokunuAl(int.parse("k"));
    print(sayi);
  } on FormatException catch (e) {
    //formatExceptşon hatası varsa yakala
    print(e.message);
  } catch (e) {
    //başka hata varsa
    print(e);
  }
}

double kareKokunuAl(int sayi) {
  if (sayi < 0) {
    throw FormatException("Sayı negatif olamaz");
  } else
    return sqrt(sayi);
}
