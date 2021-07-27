import 'package:flutter_lovers/model/user.dart';

abstract class DBBase {
  Future<bool> savePerson(MyUser person);
  Future<MyUser> readPerson(String userID);
}
