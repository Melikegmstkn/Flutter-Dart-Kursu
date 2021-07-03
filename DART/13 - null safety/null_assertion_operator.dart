/**
 * Eğer nullable tipin null olmadığından eminsen, null assertion operator yani 
 * ! kullanabiliriz. Böylece dart o değişkene non-nullable olarak davranır.
 *  
 * Eğer bu düşüncenizde hatalıysanız dart run-time da hata fırlatır.
 * Böylece programımız null hatalarına açılmış olur bu yüzden yüzde yüz kodun null olmaycağından emin değilseniz ! kullanmayın.
 * 
 * Dart aynı scopeda(methotta) ise  o değişken nullable bile olsa null olup olmadığını 
 * anlayabilir. Farklı scopeda yani kapsamda ise emin olamaz.
 */

//int? nullOlabilirAmaDegil = 1; //methodun dışına alınca a değişkeni ! kullanılmazsa hata verir
main(List<String> args) {
  int? nullOlabilirAmaDegil = 1;
  List<int?> nullDegerTutanListe = [2, 3, null];

  int a = nullOlabilirAmaDegil;
  int b = nullDegerTutanListe.first!;//ilk eleman null olabilir ! olmasa hata verirdi
  int c = nullDondurebilirAmaDondurmeyecek()!.abs(); //! kullandık yani = fonksiyon null döndürebilir ama döndürmeyecek
  //abs -> mutlak deger
}

int? nullDondurebilirAmaDondurmeyecek() => 5 - 8;
