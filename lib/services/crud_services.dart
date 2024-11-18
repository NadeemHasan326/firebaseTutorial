import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class CrudServices {
  // Insert new data
  Future<void> insertDataToFirebase({Map<String, dynamic>? data}) async {
    try {
      const uuid = Uuid();
      await FirebaseFirestore.instance
          .collection("Employee")
          .doc(uuid.v1())
          .set(data!);
      log("Data added to firebase sucessfully");
    } catch (e) {
      log("Error while inserting data in firebase through crud services: $e");
    }
  }

  // get all data from firebase
  Future<Stream<QuerySnapshot>> getAllDataFromFirebase() async {
    final userDetails =
         FirebaseFirestore.instance.collection("Employee").snapshots();
    return userDetails;
  }
}
