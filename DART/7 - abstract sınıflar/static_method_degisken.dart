/*
Sınıflarımızda nesne üretmeden bazı değişkenlere ve methodlara erişmek isteyebiliriz. burada karsımıza static kavramı cıkar.
Static kullanarak nesne değil sınıf değişkenleri ve methodları olusturabilirz.
Bir sınıfta tanımlanan method ve değişkenlere erişirken mutlaka nesne üretmemiz gerekirdi. Ama biz bunları static olarak tanımlarsak
artık nesne üretmeden bu değerlere erişebilir ve kullanabiliriz. Artık onlar nesnelerin değil sınıfın method ve değişkenleridir.
ayrıca statik degiskenler kullanılana kadar deger almazlar, bellekte yer ayrılmaz
statik methodların içinde this anahtar kelimesi kullanılmaz.
 */

main(List<String> args) {
  Matematik m1 = Matematik(50, 20);
  m1.topla();
  m1.cikar();

  Matematik m2 = Matematik(30, 10);
  m2.topla();
  m2.cikar();

  //class degiskeni olduğundan PI degerine nese oluşturmadan ulaşabiliyoruz
  Matematik.PI;
  Matematik.sinifAdiniSoyle();

  print("M1 İslem sayısı = ${m1.islemSayisi}");
  print("M2 İslem sayısı = ${m2.islemSayisi}");
  print("Toplam islem sayısı = ${Matematik.toplamIslemSayisi}");
}

class Matematik {
  //instance veriable
  int sayi1 = 0;
  int sayi2 = 0;
  int islemSayisi = 0; //nesneye bagli islem sayısı
  static int toplamIslemSayisi = 0; //sınıfa baglı islem sayısı

  //class veriable (sinif degiskeni)
  static double PI = 3.14;

  //class fonku
  static void sinifAdiniSoyle() {
    //topla(); -> HATA -> instance veriablelere statik alan içinden ulaşılamaz
    print("Ben matematik sınıfıyım");
  }

  Matematik(this.sayi1, this.sayi2);

  void topla() {
    islemSayisi++;
    toplamIslemSayisi++;
    print("Toplam = ${sayi1 + sayi2}");
  }

  void cikar() {
    islemSayisi++;
    toplamIslemSayisi++;
    print("Fark = ${sayi1 - sayi2}");
  }
}


//HOCANIN GİTHUBI
/* 
main(List<String> args) {

  var emre=Ogrenci();
  emre.ad="emre";
  Ogrenci.ogrSayisi ++;
  Ogrenci.ogrenciSayisiniYazdir();
  print("${emre.ad} ogrencisi olusturuldu  ve okul kodu : ${Ogrenci.okulKodu}");

  var hasan=Ogrenci();
  hasan.ad="hasan";
  Ogrenci.ogrSayisi++;
  Ogrenci.ogrenciSayisiniYazdir();
  print("${hasan.ad} ogrencisi olusturuldu  ve okul kodu : ${Ogrenci.okulKodu}");
  
}

class Ogrenci{

  String ad;

  static const int okulKodu = 1452;

  static int ogrSayisi = 0;

  static void ogrenciSayisiniYazdir(){
    print("Toplam ogrenci sayisi : $ogrSayisi");
   // adiniSoyle();//static olmayan method ve değişkenlere statik alan içerisinden erişilemez
   // print("Adı yazdır $ad");//static olmayan method ve değişkenlere statik alan içerisinden erişilemez
  }

  void adiniSoyle(){
    ogrenciSayisiniYazdir();//statik olmayan alanlar static method ve degiskenlere erişebilir.
    print("Benim adım $ad");
  }

}
*/