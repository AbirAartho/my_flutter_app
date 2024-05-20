import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection("notes");

  Future<void> addNote(String node) {
    return notes.add({'note': node, 'timestamp': Timestamp.now()});
  }

  Stream<QuerySnapshot> getNotes() {
    final noteStrem = notes.orderBy('timestamp', descending: true).snapshots();
    return noteStrem;
  }

  Future<void> updateNode(String docId, String newNode) {
    return notes
        .doc(docId)
        .update({'note': newNode, 'timestamp': Timestamp.now()});
  }

  Future<void> deleteNode(String docId) {
    return notes.doc(docId).delete();
  }
}
