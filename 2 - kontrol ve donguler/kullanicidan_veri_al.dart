import 'dart:io';

main(List<String> args) {
  print("Adiniz :");
  String? isim = stdin.readLineSync();
  print("Merhaba $isim");

  print("yaş :");
  int? yas = int.parse(stdin.readLineSync()!); // ! -> null olmayacak demek
  print("yaşınız $yas");
}
