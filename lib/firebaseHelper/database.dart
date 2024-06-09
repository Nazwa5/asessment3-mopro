import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Database {
  var db = FirebaseFirestore.instance;
}

class DatabaseUser extends Database {
  Future<void> addUser(String name, String email, String password) async {
    await db.collection('users').add({
      'name': name,
      'email': email,
      'password': password,
    });
  }

  Future<void> updateUser(
      String id, String name, String email, String password) async {
    await db.collection('users').doc(id).update({
      'name': name,
      'email': email,
      'password': password,
    });
  }

  Future<void> deleteUser(String id) async {
    await db.collection('users').doc(id).delete();
  }

  Future<void> readUser() async {
    var snapshot = await db.collection('user').get();
    for (var doc in snapshot.docs) {
      debugPrint(doc.data().toString());
    }
  }
}
