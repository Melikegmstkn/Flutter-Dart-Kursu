/**
 * methodlarımıza geçtiğimiz parametrelerin isteğe bağlı olmasını yani verilse de olur verilmese de olur gibi durumlarda
 * süslü ve köşeli parantez kullanırız.
 * Eğer köşeli parantez [] kullanırsak bu ilgili parametrelerin methoda gönderilmesi zorunluluğunu ortadan kaldırır.
 * Eğer süslü parantez {} kullanırsak burda da parametreler isteğe bağlıdır ama bu parametreleri belirtirken sıralama önemini
 * kaybeder ve de parametreleri geçerken isimlerini vermek zorunda kalırız.
 * 
 * Ayrıca method tanımlarında parametrelere = diyerek varsayılan değerler atayabiliriz. Bu değerler sayesinde eğer kullanıcı
 * method parametrelerini atamamışsa bu varsayılan değerler kullanılır.
 */
main(List<String> args) {
  //int toplam = sayilariTopla(3, 5);
  //int toplam2 = sayilariTopla(3);
  int toplam3 = sayilariTopla(s1: 5, s2: 4, s3: 8);
  print("toplam  : $toplam3");
}

//required paramerter
/*
int sayilariTopla(int s1, int s2, int s3) {
  return s1 + s2 + s3;
}
*/

//optional paramerter
/* 
int sayilariTopla(int s1, [int s2 = 0, int s3 = 0]) {
  return s1 + s2;
}
 */

//optional named
int sayilariTopla({int s1 = 0, int s2 = 0, int s3 = 0}) {
  return s1 + s2 + s3;
}
