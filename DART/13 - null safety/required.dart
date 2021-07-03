/**
 * İsimlendirilmiş parametreler varsayılan olarak opsiyoneldir. 
 * Bu yüzden kullanıcı atamazsa null değer alırlar bu kabul edilemez. 
 * Bu yüzden parametrelerin tiplerini tanımlarken String?, int? gibi 
 * nullable tiplerle belirtilir.
 * 
 * Bu sorun tüm parametrelere varsayılan degerler atayarak da çözülebilir
 * 
 * Ya da REQUİRED kullanarak bu parametrelerin mutlaka girilmesi sağlanabilir
 */

main(List<String> args) {
  final toplam1 = ucSayiTopla(s1: 3, s2: 4, s3: 5);
  final toplam2 = ucSayiTopla(s1: 1, s2: 2, s3: 5);
} //required olduğu için üçüncü sayıyı göndermezsek hata verir

int ucSayiTopla({required int s1, required int s2, required int s3}) {
  return s1 + s2 + s3;
}
