import 'package:LIFFT/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //Collections
  final CollectionReference _userCollectionReference =
      Firestore.instance.collection('users');

  Future createUser(User user) async {
    try {
      await _userCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _userCollectionReference.document(uid).get();
      return User.fromData(userData.data);
    } catch (e) {
      return e.message;
    }
  }
}
