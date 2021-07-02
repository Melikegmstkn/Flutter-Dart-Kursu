main(List<String> args) {
  var listem = <String>[]; //[] -> liste

  var myMap = {}; //parantez içi boşsa MAP olur
  var myMap2 = {"yas": 21}; //Key : value map
  var myMap3 = <String, dynamic>{
    "yas": 21
  }; //Key -> String & value -> dynamic degerler alan map

  var mySet = {"Melike", 21}; //parantez içi doluysa SET olur
  var mySet2 = <String>{"Melike"}; // yalnızca String veri türü alan Set

  var tekSayilar = [1, 3, 5];
  var ciftSayilar = [2, 4, 6];

  var sonListe = [];
  sonListe.addAll(tekSayilar); //sonListe'ye tekSayilar listesi eklendi
  sonListe.addAll(ciftSayilar); // sonListe'ye ciftSayilar listesi eklendi
  //bunlar yerine -->
  var sonListe2 = [
    ...tekSayilar,
    ...ciftSayilar
  ]; //bunu MAP ve SET için de yapabiliriz

  var map1 = {'ad': "Melike"};
  var map2 = {'yas': 21};
  var sonMap = {...map1, ...map2};

  var set1 = {1};
  var set2 = {"melike"};
  var set3 = {1};
  var set4 = {"Tokat"};
  var set5 = {"melike"};
  var sonSet = {
    ...set1,
    ...set2,
    ...set3,
    ...set4,
    ...set5
  }; //se1-set3 ve set2-set5 aynı !
  print(sonSet);
}
