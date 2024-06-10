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
      String url,
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
          'views': 0,
          'mapUrl': url,
          'rating': rating,
          'totalReview': totalReview,
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
      String url,
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
          'mapUrl': url,
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

  Future<List> getPopularDestination() async {
    try {
      var snapshot = await db
          .collection('destination')
          .orderBy('views', descending: true)
          .limit(5)
          .get();
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

  Future<void> addView(String id) async {
    try {
      var data = await db.collection('destination').doc(id).get();
      var views = data.data()?['views'] + 1;
      var update = db.collection('destination').doc(id).update({
        'views': views,
      });

      update.then((value) {});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List> search(String search) async {
    try {
      var snapshot = await db
          .collection('destination')
          .where('name', isEqualTo: search)
          .get();
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

  Future<void> addActivities(String id, String name, ifSucces, ifFailed) async {
    try {
      List newData;
      var data = db.collection('destination').doc(id).get();

      data
          .then((value) => {
                newData = value.data()?['activities'] ?? [],
                newData.add({'name': name}),
                db.collection('destination').doc(id).update({
                  'activities': newData,
                })
              })
          .then((value) => {ifSucces()});
    } catch (e) {
      debugPrint(e.toString());
      ifFailed();
    }
  }

  Future<void> addSouvenirs(String id, String name, ifSucces, ifFailed) async {
    try {
      List newData;
      var data = db.collection('destination').doc(id).get();

      data
          .then((value) => {
                newData = value.data()?['souvenirs'] ?? [],
                newData.add({'name': name}),
                db.collection('destination').doc(id).update({
                  'souvenirs': newData,
                })
              })
          .then((value) => {ifSucces()});
    } catch (e) {
      debugPrint(e.toString());
      ifFailed();
    }
  }
}
