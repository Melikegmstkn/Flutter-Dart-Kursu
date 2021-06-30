main(List<String> args) {
  Person ibrahim = Person(1, "İbrahim");
  Person rumeysa = Ogrenci(3, "Rumeysa", 45);
  Ogrenci melike = Ogrenci(4, "Melike", 25);
  var nesli = Ogrenci(5, "Neslihan", 10);
  var oznur = Person(2, "Öznur");

  List<Person> tumOgrenciler = [ibrahim, oznur, rumeysa, melike, nesli];

  tumOgrenciler.sort((prsn1, prsn2) {
    if (prsn1.id < prsn2.id)
      return -1;
    else if (prsn1.id > prsn2.id)
      return 1;
    else
      return 0;
  });
  print(tumOgrenciler);

  var liste = List<Ogrenci>.filled(5, Ogrenci(0, "", 0));
  var listeFrom = List<Ogrenci>.from(tumOgrenciler.whereType<Ogrenci>());
  var listeOf = List<Ogrenci>.of(tumOgrenciler.whereType<Ogrenci>());
  var listeGenerate = List<int>.generate(5, (index) => index + 2);
  var ogrenciListeGenerate =
      List<Ogrenci>.generate(5, (index) => Ogrenci(index, "$index", index * 2));

  /*
  print(listeFrom);
  print(listeFrom);
  print(listeGenerate);
  print(ogrenciListeGenerate);
  */
  var degistirilemezListe = List.unmodifiable([0, 1, 2]);
  //degistirilemezListe.add(5); //çalışırken hata verir

  tumOgrenciler.add(melike);
  tumOgrenciler.addAll([rumeysa, nesli]); //liste kullanarak çok veri ekledik
  //print(tumOgrenciler);

  bool sonuc = tumOgrenciler.any(
      (Person element) => element.id < 2); //id'si 2'den küçük eleman var mı ?
  //print(sonuc);

  //ASMAP
  Map<int, Person> yeniMap = tumOgrenciler.asMap(); //listeyi mape dönüştürdü
  /*
  print(yeniMap);
  print(yeniMap[0]);
  print(yeniMap[0]!.isim);
  print(tumOgrenciler.contains(oznur)); //listede oznur var mı
  */

  bool sonucEvery = tumOgrenciler.every((element) =>
      element.isim.length > 3); //tüm isimlerin uzunluğu 3ten büyük mü
  //print(sonucEvery);

  var bul = tumOgrenciler.firstWhere(
      (element) => element.id == 1); //ilk bulduğu 1 id li veriyi getirir
  //print(bul);

  var mapList = tumOgrenciler
      .map((Person e) => "Map ${e.isim}\n")
      .toList(); //mapi listeye cevirir
  print(mapList);

  var mapSet = tumOgrenciler
      .map((Person e) => "Map ${e.isim}\n")
      .toSet(); //mapi sete cevirir
  print(mapSet);
}

class Person {
  int id = 0;
  String isim = "";

  Person(this.id, this.isim);

  @override
  String toString() {
    return "id: $id ve isim: $isim\n";
  }
}

class Ogrenci extends Person {
  int alinanDersSayisi = 0;

  Ogrenci(id, isim, alinanDersSayisi) : super(id, isim);

  @override
  String toString() {
    return "id: $id ve isim: $isim ve alınan der sayısı: $alinanDersSayisi\n";
  }
}

//HOCADAN
/*
import 'dart:math';
void main(List<String> args) {
  // List<int> ogrenciNumaralari=List.generate(30, (index) => rastgeleOgrenciNoOlustur() );
  List<int> ogrenciNumaralari =
      List.generate(30, (index) => rastgeleOgrenciNoOlustur());
  /* List<Ogrenci> tumOgrenciler= ogrenciNumaralari.map((ogrNo) {
     return Ogrenci("Ogrenci $ogrNo Adı", ogrNo);
   }).toList();
   */
  List<Ogrenci> tumOgrenciler = ogrenciNumaralari
      .map((ogrNo) => Ogrenci("Ogrenci $ogrNo Adı", ogrNo))
      .toList();

  tumOgrenciler
      .forEach((oankiOgrenci) => print("Ogrenci adı : ${oankiOgrenci}"));

}

int rastgeleOgrenciNoOlustur() {
  int olusturuluanSayi = Random().nextInt(60);

  if (olusturuluanSayi != 0) {
    return olusturuluanSayi;
  } else {
    int yeniSayi = rastgeleOgrenciNoOlustur();
    return yeniSayi;
  }
}

class Ogrenci {
  String ad;
  int no;

  Ogrenci(this.ad, this.no);

  @override
  String toString() {
    // TODO: implement toString
    return "$ad ve numarası $no";
  }
}
*/
