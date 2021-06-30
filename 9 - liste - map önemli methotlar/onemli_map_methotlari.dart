main(List<String> args) {
  Map<String, dynamic> map = Map();
  var map2 = <String, dynamic>{};

  map['id'] = 5;
  map['isim'] = "melike";
  map['renk'] = 'beyaz';

  var yeniMap = Map.from({'deger': 'yeni'});
  var mapFromEntries =
      Map.fromEntries(map.entries); //mape ait verileri (K-V) gösterir
  print(mapFromEntries);

  var liste = [1, 2, 3];
  var mapFromItarable = Map.fromIterable(liste); //listeyi mape dönüştürdü
  print(mapFromItarable);

  var mapFromItarable1 = Map<String, String>.fromIterable(liste,
      key: (item) {
        return "$item";
      },
      value: (item) => "${item * 2}");
  print(mapFromItarable1);

  //Map güncelleme
  map.update('id', (value) => value * 3);
  print(map);

  //Mapte key yoksa güncelleme
  map.update('yeni', (value) => value * 3, ifAbsent: () => 100);
  print(map);

  //mape yeni key-value ekler (eğer yazılan key yoksa.. key varsa çalışmaz)
  map.putIfAbsent("soyisim", () => "gumustekin");
  print(map);
}
