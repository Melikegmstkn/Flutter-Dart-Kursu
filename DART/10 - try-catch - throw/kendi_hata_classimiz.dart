main(List<String> args) {
  try {
    Ogrenci melike = Ogrenci(-5);
    print(melike.yas);
  } on AgeException catch (e) {
    print(e.mesaj);
  } finally {
    print("program bitti");
  }
}

class AgeException implements Exception {
  String mesaj;
  AgeException({this.mesaj="Hata"});

  @override
  String toString() {
    return "hatanın toString methodu çalıştı";
  }
}

class Ogrenci {
  int yas = 0;
  Ogrenci(this.yas) {
    if (yas < 0)
      throw AgeException(mesaj: 'AgeException - Yaş negatif olamaz');
    else
      this.yas = yas;
  }
}
