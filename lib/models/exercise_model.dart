import 'package:cloud_firestore/cloud_firestore.dart';

class Exercise {
  final String name;
  final String description;

  Exercise({this.name, this.description});

  static Exercise fromMap(DocumentSnapshot snapshot) {
    return Exercise(
      name: snapshot.data['name'],
      description: snapshot.data['description'],
    );
  }
}
