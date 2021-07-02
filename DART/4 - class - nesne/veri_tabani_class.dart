import 'dart:math';

class VeriTabaniIslemleri {
  String _kullaniciAdi = "Melike"; // _ -> private olmasını sağlar
  String _sifre = "123456";

  bool baglan() {
    if (_internetVarMi()) {
      if (_kullaniciAdi == "Melike" && _sifre == "123456")
        return true;
      else
        return false;
    } else
      return false;
  }

  VeriTabaniIslemleri(){}
  VeriTabaniIslemleri.loginWithNameAndPassword(
      String kullaniciAdi, String sifre) {}

  bool _internetVarMi() {
    if (Random().nextBool())
      return true;
    else
      return false;
  }
}
