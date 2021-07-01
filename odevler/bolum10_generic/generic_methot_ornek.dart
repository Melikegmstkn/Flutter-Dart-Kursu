main(List<String> args) {
  double doubleOrt = ortBul(3, 5);
  double intOrt = ortBul(9, 3.2);

  print(doubleOrt);
  print(intOrt);
}

double ortBul<T extends num>(T s1, T s2) {
  //numara olan her türlü veriyi kabul eder
  return (s1 + s2) / 2;
}
