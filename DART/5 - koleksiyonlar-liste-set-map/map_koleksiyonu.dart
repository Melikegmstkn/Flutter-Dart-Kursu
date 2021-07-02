main(List<String> args) {
  Map<String, int> sehirTelKodlari = {
    "Ankara": 0312,
    "Bursa": 0224,
    "Izmir": 0232
  };

  print("Ankaranın alan kodu ${sehirTelKodlari["Ankara"]}");

  Map<String, dynamic> kisiler = Map();
  kisiler["ad"] = "Melike";
  kisiler["yas"] = 21;
  kisiler["erkekMi"] = false;

  
  print(kisiler["yas"]);
  //Keyleri yazdırma
  for (String key in kisiler.keys) {
    print("Key değeri : $key");
  }

  //degerleri yazdırma
  print("********************");
  for (Object deger in kisiler.values) {
    print("Key değeri : $deger");
  }

  kisiler.update("yas", (value) => 25);

  kisiler.forEach((anahtar, deger) => print("key: $anahtar value: $deger"));
  print("********************");

  if (kisiler.containsKey('yas')) {
    print(("bulunan yas degeri ${kisiler['yas']}"));
  }

}
