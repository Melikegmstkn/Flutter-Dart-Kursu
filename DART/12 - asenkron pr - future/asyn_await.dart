main(List<String> args) async {
  print("netten kişi verisi getirilecek");
  //kisiVerisiniGetir().then((value) => print(value));
  kisiyleIlgiliIslemler();
  print("başka işlemler yapılacak");
  print("işlem bitti");
}

Future<String> kisiVerisiniGetir() {
  return Future<String>.delayed(Duration(seconds: 2), () {
    return "Kişi adı : Melike / id: 5";
  });
}

void kisiyleIlgiliIslemler() async {
  String kisi = await kisiVerisiniGetir(); //await -> sonucu bekle - ata
  print(kisi.length); //bunu yazmak için üst satır beklenmeli
}
