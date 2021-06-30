import 'musteri_class.dart';
import 'veri_tabani_class.dart';

main(List<String> args) {
  VeriTabaniIslemleri db = VeriTabaniIslemleri();
  VeriTabaniIslemleri db2 =
      VeriTabaniIslemleri.loginWithNameAndPassword("Melike", "159");
  bool sonuc = db.baglan();
  if (sonuc)
    print("bağlandım");
  else
    print("Bağlanamadım");

  Musteri m1 = Musteri(123);
  
}

/* // Private degiskenlere aynı dosya içinden ulasılabilir bunu önlemek için farklı dosyada yazmamız gerekir
class VeriTabaniIslemleri {
  String _kullaniciAdi = "Melike"; // _ -> private olmasını sağlar
  String _sifre = "123456";

  bool baglan() {
    if (kullaniciAdi == "Melike" && sifre == "123456")
      return true;
    else
      return false;
  }
}
*/

/* main(List<String> args) {
  var emre = Ogrenci(52, "emre", true);

  print(emre.adi);
  emre.ogrenciNoAta = 20;

  emre.bilgileriYazdir();
  print(emre.ogrenciNoOku);


  
}

class Ogrenci {
  int _ogrNo; //ınstance veya Field variable
  String adi;
  bool erkekMi;

  Ogrenci(this._ogrNo, this.adi, this.erkekMi) {
    print("Ogrenci sınıfından bir nesne üretiliyor ki ben tetiklendim");
  }

  void set ogrenciNoAta(int no) {
    if (no <= 0) {
      this._ogrNo = 1;
    } else {
      this._ogrNo = no;
    }
  }

/*
  String get ogrenciNoOku{
    return "Ogrenci Numarası : $ogrNo";
  }
*/
   String get ogrenciNoOku => "Ogrenci Numarası : $_ogrNo";

   
  
  
  void dersCalis() {}

  void uyu() {}

  void bilgileriYazdir() {
    print(
        "Ogrenci numarasi : ${this._ogrNo} adi : ${this.adi} erkek mi : ${this.erkekMi}");
  }
} */
