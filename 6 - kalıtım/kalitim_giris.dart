main(List<String> args) {
  User parent = User();
  NormalUser normal = NormalUser();
  SadeceOkuyabilenNormalUser sadeceOkuyanUser = SadeceOkuyabilenNormalUser();
  AdminUser admin = AdminUser();

  parent.girisYap();
  normal.girisYap();
  sadeceOkuyanUser.girisYap();
  admin.girisYap();

  sadeceOkuyanUser.adiniSoyle();

  normal.davetEt();
  sadeceOkuyanUser.davetEt();

  //UPCASTİNG (YUKARI CEVRİM)

  User user1 = User();
  var user2 = NormalUser();
  SadeceOkuyabilenNormalUser user3 = SadeceOkuyabilenNormalUser();
  AdminUser user4 = AdminUser();

  User user5 = AdminUser(); //upcasting (yukarı cevrim)
  User user6 = SadeceOkuyabilenNormalUser(); //upcasting

  List<User> tumUserler = [];
  tumUserler.add(user1);
  tumUserler.add(user2);
  tumUserler.add(user3);

  test(user1);
  test(user2);
  test(user3);
  test(user4);
  test(user5);
  test(user6);
}

//POLİMORFİZM (COK BİCİMLİLİK) -> tek veri türü var (user) ama gelen kullanıcı verisine göre farklı türlere gidiyor
void test(User kullanici) {
  kullanici.girisYap(); //polimorfizm (cok biçimlilik)
}

class User {
  String email = "";
  String password = "";

  void girisYap() {
    print("Parent user giris yaptı");
  }
}

class NormalUser extends User {
  void davetEt() {
    print("Normal user arkadaşlarını davet etti");
  }

  //method ezme
  @override
  void girisYap() {
    print("Normal user giris yaptı");
  }
}

class SadeceOkuyabilenNormalUser extends NormalUser {
  void adiniSoyle() {
    print("ben sadece okuyabilirim");
  }

  @override
  void girisYap() {
    print("Sadece okuyabilen user giris yaptı");
  }

  @override
  void davetEt() {
    print("Sadece okuyabilen user arkadaşlarını davet etti");
  }
}

class AdminUser extends User {
  void toplamUserSayisi() {
    print("Toplam user sayisi 20");
  }

  @override
  void girisYap() {
    print("Admin user giris yaptı");
  }
}
