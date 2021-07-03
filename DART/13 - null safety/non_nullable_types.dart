main(List<String> args) {
  int? nullOlabilirAmaDegil = 1;

  int? a; //? null olabilir demek
  a = null;

  print("a'nın değeri = $a");
  //print(a + 2); // Hata -> a null olabilirdi nullsa toplayamaz ???
}
