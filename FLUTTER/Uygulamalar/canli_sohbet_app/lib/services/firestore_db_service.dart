import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_lovers/model/user.dart';
import 'package:flutter_lovers/services/database_base.dart';

class FireStoreDBService implements DBBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<bool> savePerson(MyUser person) async {
    if (person != null) {
      await _firestore
          .collection('users')
          .doc(person.userID)
          .set(person.toMap());
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.doc('users/${person.userID}').get();
      Map _personMap = documentSnapshot.data();
      MyUser _person = MyUser.fromMap(_personMap);
      print("Read person is objects : " + _person.toString());
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<MyUser> readPerson(String userID) async {
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(userID).get();
    Map<String, dynamic> personMap = documentSnapshot.data();
    MyUser person = MyUser.fromMap(personMap);
    print('Read person is info : ' + person.toString());
    return person;
  }
}
