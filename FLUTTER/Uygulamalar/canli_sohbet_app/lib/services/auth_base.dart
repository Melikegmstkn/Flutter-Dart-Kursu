import 'package:flutter_lovers/model/user.dart';

abstract class AuthBase {
  Future<MyUser> currentUser();
  Future<MyUser> sigInAnonymously();
  Future<bool> signOut();
  Future<MyUser> signInWithGoogle();
  Future<MyUser> signInWithFacebook();
  Future<MyUser> signInWithEmail(String email, String password);
  Future<MyUser> createPersonWithEmail(String email, String password);
}
