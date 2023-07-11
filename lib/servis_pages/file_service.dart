// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/post_model.dart';


Stream<List<Book>> readBooks(sinf) => FirebaseFirestore.instance
    .collection("Kitoblar")
    .doc("$sinf")
    .collection("1212")
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Book.fromJson(doc.data())).toList());

Stream<List<Book>> readAudio(sinf) => FirebaseFirestore.instance
    .collection("Kitoblar")
    .doc("$sinf")
    .collection("1212")
    .snapshots()
    .map((snapshot) =>
    snapshot.docs.map((doc) => Book.fromJson(doc.data())).toList());

Stream<List<Book>> readBooksSinf(sinf,tili) => FirebaseFirestore.instance
    .collection("Kitoblar")
    .doc(tili)
    .collection("$sinf")
    .snapshots()
    .map((snapshot) =>
    snapshot.docs.map((doc) => Book.fromJson(doc.data())).toList());

Future createBook({required String name, sinf,imgDownload,pdfDownload}) async {
  await FirebaseFirestore.instance.collection("Kitoblar").doc("$sinf").collection("1212").doc(name).set({
    "book_name" : name,
    "img_url" : imgDownload,
    "pdf_url" : pdfDownload,
  });
}

Future createAudioSinf({required String name, sinf,imgDownload,pdfDownload,apbar}) async {
  await FirebaseFirestore.instance.collection("Kitoblar").doc("$sinf").collection("$apbar").doc("$apbar").collection("1212").doc(name).set({
    "book_name" : name,
    "img_url" : imgDownload,
    "pdf_url" : pdfDownload,
  });
}

Future createAudio({required String name, sinf,imgDownload,pdfDownload,apbar}) async {
  await FirebaseFirestore.instance.collection("Kitoblar").doc("$sinf").collection("$apbar").doc(name).set({
    "book_name" : name,
    "img_url" : imgDownload,
    "pdf_url" : pdfDownload,
  });
}

Future createBooksinf({required String name, sinf,imgDownload,pdfDownload,tili}) async {
  await FirebaseFirestore.instance.collection("Kitoblar").doc(tili).collection("$sinf").doc(name).set({
    "book_name" : name,
    "img_url" : imgDownload,
    "pdf_url" : pdfDownload,
  });
}

Future deleteBooksinf({required String name, sinf,tili}) async {
  await FirebaseFirestore.instance.collection("Kitobla").doc(tili).collection("$sinf").doc(name).delete();
}

Future deleteBook({required String name, sinf}) async {
  await FirebaseFirestore.instance.collection("Kitobla").doc("$sinf").collection("1212").doc(name).delete();
}
