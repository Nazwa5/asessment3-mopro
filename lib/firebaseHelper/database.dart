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

  Future<bool> loginAsAdmin(String username, String password) async {
    try {
      var snapshot = await db.collection('admin').doc(username).get();
      if (snapshot.data()?['password'] == password) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }
}

class DatabaseDestination extends Database {
  Future<void> createDestination(
      String name,
      String location,
      String description,
      String rating,
      String totalReview,
      ifSuccess,
      ifFail) async {
    try {
      var data = await db.collection('destination').doc(name).get();
      if (data.exists) {
        ifFail();
        return;
      } else {
        var id = DateTime.now().microsecondsSinceEpoch.toString();
        var create = db.collection('destination').doc(id).set({
          'id': id,
          'name': name,
          'location': location,
          'description': description,
        });

        create.then((value) {
          ifSuccess();
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List> getDestination() async {
    try {
      var snapshot = await db.collection('destination').get();
      List data = [];
      snapshot.docs.forEach((element) {
        data.add(element.data());
      });
      return data;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<Map<String, dynamic>?> getDestinationDetail(String name) async {
    try {
      var snapshot = await db.collection('destination').doc(name).get();
      return snapshot.data();
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }

  Future<void> updateDestination(
      String id,
      String name,
      String location,
      String description,
      String rating,
      String totalReview,
      ifSuccess,
      ifFail) async {
    try {
      var data = await db.collection('destination').doc(id).get();
      if (!data.exists) {
        ifFail();
        return;
      } else {
        var update = db.collection('destination').doc(id).update({
          'name': name,
          'location': location,
          'description': description,
          'rating': rating,
          'totalReview': totalReview,
        });

        update.then((value) {
          ifSuccess();
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteDestination(String name, ifSuccess) async {
    try {
      var delete = db.collection('destination').doc(name).delete();

      delete.then((value) {
        ifSuccess();
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
