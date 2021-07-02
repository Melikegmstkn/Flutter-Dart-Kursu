main(List<String> args) {
  String notDegeri = 'BA';

  switch (notDegeri) {
    case "AA":
      print("Not 90 - 100 arasındadır");
      break;

    case "BA":
      print("Not 80 - 90 arasındadır");
      break;

    case "BB":
      print("Not 70 - 80 arasındadır");
      break;

    case "CB":
      print("Not 60 - 70 arasındadır");
      break;

    case "CC":
      print("Not 50 - 60 arasındadır");
      break;

    case "FF":
      print("Not 50den düşük");
      break;

    default:
      {
        print("Hatalı değer girildi");
      }
  }

  var yas = 22.6;
  /*double değer kullanılmıyor
  switch(yas){
    case 18.8:
    print("yasınız 18");
    break;
    case 22.5:
    print("yasınız 22");
    break;
    default : {
      print("Bilinmeyen değer");
    }
  }
*/

  int sayi = 25;
  int bolum = (sayi / 10).toInt();

  switch (bolum) {
    case 3:
      print("Sayı 30'dan büyük");
      break;

    case 2:
      print("Sayi 20'den büyüktür");
      break;

    case 1:
      print("Sayı 10'dan büyük");
      break;

    case 0:
      print("Sayi 10'den küçük");
      break;
  }
}
