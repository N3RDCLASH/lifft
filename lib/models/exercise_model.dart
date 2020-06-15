import 'package:cloud_firestore/cloud_firestore.dart';

class Exercise {
  final String id;
  final String name;
  final String description;
  final String mainCategory;

  Exercise({this.mainCategory, this.id, this.name, this.description});

  static Exercise fromMap(DocumentSnapshot snapshot) {
    return Exercise(
      id: snapshot.documentID,
      name: snapshot.data['name'],
      description: snapshot.data['description'],
      mainCategory: snapshot.data['mainCategory'],
    );
  }

  @override
  String toString() {
    return "Exercise: $id, $name,$description";
  }
}
