class Model {
  String modelAdi;
  int fiyat;
  bool benzinli;

  Model.fromJsonMap(Map<String, dynamic> map)
      : modelAdi = map["modelAdi"],
        fiyat = map["fiyat"],
        benzinli = map["benzinli"];
}
