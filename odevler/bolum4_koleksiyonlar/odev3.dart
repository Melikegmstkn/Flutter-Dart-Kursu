main(List<String> args) {
  //Map veri türü tutan liste oluşturuldu
  List<Map<String, dynamic>> sehirler = [];

  //SEHİRLERİ OLUSTURMA
  Map<String, dynamic> sehir1 = Map<String, dynamic>();
  sehir1["il_adi"] = "İstanbul";
  sehir1["ilce_sayisi"] = 25;
  sehir1["plaka_kodu"] = 34;

  Map<String, dynamic> sehir2 = <String, dynamic>{};
  sehir2["il_adi"] = "Samsun";
  sehir2["ilce_sayisi"] = 15;
  sehir2["plaka_kodu"] = 55;

  var sehir3 = <String, dynamic>{};
  sehir3["il_adi"] = "Tokat";
  sehir3["ilce_sayisi"] = 10;
  sehir3["plaka_kodu"] = 60;

  //OLUSTURULAN SEHİRLERİ LİSTEYE EKLEME
  sehirler.add(sehir1);
  sehirler.add(sehir2);
  sehirler.add(sehir3);
  sehirler.add({
    'il_adi': "Bursa",
    'ilce_sayisi': 9,
    'plaka_kodu': 16
  }); //böyle eklenen veriye erişilemez o an oluşturulup eklenir.

  for (var i = 0; i < sehirler.length; i++) {
    var thisSehir = sehirler[i];
    print("sehir adı : ${thisSehir['il_adi']} \t ilce  sayısı : ${thisSehir['ilce_sayisi']} \t palaka kodu : ${thisSehir['plaka_kodu']}");
  }
}
