main(List<String> args) {
  const Student melike = Student(5, "Melike");
  final Student melike2 = const Student(5, "Melike");
  var melike3 = const Student(5, "Melike");
  melike3 = const Student(5, "Melike");

  if (melike == melike2)
    print("eşit");
  else
    print("Eşit değil");
}

class Student {
  final int id;
  final String isim;

  const Student(this.id, this.isim);
}
