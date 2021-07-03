main(List<String> args) {
  try {
    print(karakterSayisiniBul(null));
  } catch (e) {
    print(e);
  }
}

int karakterSayisiniBul(String? metin) {
  if (metin == null) {
    //return 0; //metin nullsa 0 dönder
    throw Exception("metin null olamaz"); // null ise hata fırlat
  }
  return metin.length;
}
