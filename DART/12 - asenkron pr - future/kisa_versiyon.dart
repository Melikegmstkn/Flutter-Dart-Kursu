import 'dart:io';

main(List<String> args) {
  print("Anne cocugu ekmek alamaya yollar");
  uzunSurenIslem()
      .then((String value) => print(value))
      .catchError((hata) => print(hata))
      .whenComplete(() => print("ekmek alma operasyonu bitti"));
  print("peynir zeytin hazırlanır");
  print("Kahvalltı hazır");
}

Future<String> uzunSurenIslem() {
  return Future<String>.delayed(Duration(seconds: 2), () {
    return "cocuk ekmekle eve girer";
  });
}
