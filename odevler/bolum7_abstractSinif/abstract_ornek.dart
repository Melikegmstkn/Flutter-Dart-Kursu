main(List<String> args) {
  VeriTabani db = OracleDB();

  db.userDelete();
  db.userSave();

  userGuncelle(db);
}

void userGuncelle(VeriTabani db) {
  db.userUpdate();
}

abstract class VeriTabani {
  void userSave();
  void userUpdate();
  void userDelete();
}

class OracleDB extends VeriTabani {
  @override
  void userSave() {
    print("Oracle dbden  User kaydedildi.");
  }

  @override
  void userUpdate() {
    print("Oracle dbden User güncellendi.");
  }

  @override
  void userDelete() {
    print("Oracle dbden User Silindi.");
  }
}

class FirebaseDB extends VeriTabani {
  @override
  void userSave() {
    print("Firebase dbden  User kaydedildi.");
  }

  @override
  void userUpdate() {
    print("Firebase dbden User güncellendi.");
  }

  @override
  void userDelete() {
    print("Firebase dbden User Silindi.");
  }
}


