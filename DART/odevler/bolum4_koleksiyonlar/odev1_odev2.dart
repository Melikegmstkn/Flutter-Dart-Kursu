main(List<String> args) {
  //SORU 1
/*   
  List<String> sehirler = List.filled(4, "");
  sehirler[0] = "İstanbul";
  sehirler[1] = "Tokat";
  sehirler[2] = "Samsun";
  sehirler[3] = "İzmir";

  for (String sehir in sehirler) {
    print(sehir);
  }
*/

  //SORU 2

  Map<String, dynamic> bilgisayar = Map();
  bilgisayar["cekirdek sayısı"] = 16;
  bilgisayar["ram miktari"] = 8;
  bilgisayar["ssd var mı"] = true;

  for (var veri in bilgisayar.entries) {
    print("Key: ${veri.key} \t| Deger : ${veri.value}");
  }
}
