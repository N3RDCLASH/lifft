import 'package:cloud_firestore/cloud_firestore.dart';

class Bodypart {
  final String name;

  Bodypart({this.name});

  static Bodypart fromMap(DocumentSnapshot snapshot) {
    return Bodypart(
      name: snapshot.data['name'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Bodypart: $name";
  }
}
