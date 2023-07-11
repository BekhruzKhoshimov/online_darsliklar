import 'package:cloud_firestore/cloud_firestore.dart' hide Query;

import '../models/post_model.dart';

class DataService {
  static final _firestore = FirebaseFirestore.instance;
  static String folderAdmin = "admin";

  static Future<List<Book>> getBook() async {
    List<Book> p = [];
    var docs = await _firestore.collection("Maktab Darsliklari").get();
    for (var a in docs.docs) {
      p.add(Book.fromJson(a.data()));
    }
    return p;
  }

  static Future<List<Book>> getOfCategory(String categoryName) async {
    List<Book> p = [];
    var docs = await _firestore
        .collection("Books")
        .where("category", isEqualTo: categoryName)
        .get();
    for (var a in docs.docs) {
      print("NAME ${a.data()["name"]}");
      p.add(Book.fromJson(a.data()));
    }
    return p;
  }
}

