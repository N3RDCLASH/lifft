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
}
