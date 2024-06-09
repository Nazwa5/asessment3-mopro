import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Database {
  var db = FirebaseFirestore.instance;
}

class DatabaseUser extends Database {
  Future<void> register(
      String username, String password, ifSuccess, ifFail) async {
    try {
      var data = await db.collection('user').doc(username).get();
      if (data.exists) {
        ifFail();
        return;
      } else {
        var register = db.collection('user').doc(username).set({
          'username': username,
          'password': password,
        });

        register.then((value) {
          ifSuccess();
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> login(String username, String password) async {
    try {
      var snapshot = await db.collection('user').doc(username).get();
      if (snapshot.data()?['password'] == password) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }
}
