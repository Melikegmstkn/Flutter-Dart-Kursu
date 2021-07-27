import 'package:flutter_lovers/locator.dart';
import 'package:flutter_lovers/model/user.dart';
import 'package:flutter_lovers/services/auth_base.dart';
import 'package:flutter_lovers/services/firebase_auth_service.dart';
import 'package:flutter_lovers/services/firestore_db_service.dart';

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FireStoreDBService _dbService = locator<FireStoreDBService>();

  @override
  Future<MyUser> currentUser() async {
    return await _firebaseAuthService.currentUser();
  }

  @override
  Future<MyUser> sigInAnonymously() async {
    return await _firebaseAuthService.sigInAnonymously();
  }

  @override
  Future<bool> signOut() async {
    return await _firebaseAuthService.signOut();
  }

  @override
  Future<MyUser> signInWithGoogle() async {
    MyUser person = await _firebaseAuthService.signInWithGoogle();
    bool result = await _dbService.savePerson(person);
    if (result)
      return await _dbService.readPerson(person.userID);
    else
      return null;
  }

  @override
  Future<MyUser> signInWithFacebook() async {
    MyUser person = await _firebaseAuthService.signInWithFacebook();
    bool result = await _dbService.savePerson(person);
    if (result)
      return await _dbService.readPerson(person.userID);
    else
      return null;
  }

  @override
  Future<MyUser> createPersonWithEmail(String email, String password) async {
    MyUser person =
        await _firebaseAuthService.createPersonWithEmail(email, password);
    bool result = await _dbService.savePerson(person);
    if (result) {
      return await _dbService.readPerson(person.userID);
    } else {
      return null;
    }
  }

  @override
  Future<MyUser> signInWithEmail(String email, String password) async {
    MyUser person = await _firebaseAuthService.signInWithEmail(email, password);
    return await _dbService.readPerson(person.userID);
  }
}
