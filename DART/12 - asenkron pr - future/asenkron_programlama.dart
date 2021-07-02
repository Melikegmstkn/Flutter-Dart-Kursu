import 'dart:io';

main(List<String> args) {
  print("Anne cocugu ekmek alamaya yollar");
  Future<String> sonuc = uzunSurenIslem();

  //print(sonuc); // sonuc değişkeni için 2 sn gerekli ama program beklemez bu yüzden değişken istenen değeri alamaz
  sonuc.then((String value) => print(value)).catchError((hata) {
    print(hata);
  }).whenComplete(() => print("ekmek alma operasyonu bitti")); //sonuç hazır olduğunda başarılı ise then başarısız ise catchValue içini çalıştır demek

  print("peynir zeytin hazırlanır");
  print("Kahvalltı hazır");
}

Future<String> uzunSurenIslem() {
  //sleep(Duration(seconds: 2)); //-> single thread
  Future<String> sonuc = Future.delayed(Duration(seconds: 2), () {
    return "cocuk ekmekle eve girer";
    //throw Exception("bakkalda ekmek yokmuş"); //->hata durumunda catchError çalışır
  }); //ana programı durdurmaz/bekletmez

  return sonuc;
}
