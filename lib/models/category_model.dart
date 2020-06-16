import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String name;

  Category({this.name});

  static Category fromMap(DocumentSnapshot snapshot) {
    return Category(name: snapshot.data['name']);
  }
}
