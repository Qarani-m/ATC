import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class SubmitReview {
  static String uuid = "";

  static void generateId() {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String randomNumber = Random().nextInt(1000000).toString();
    uuid = timestamp + randomNumber;
  }

  static Future<void> submitReview(double starRating, String writtenReview,
      String userId, String hostelId) async {
    generateId();
    final firestore = FirebaseFirestore.instance;
    CollectionReference reviewCollection = firestore.collection('reviews');
    Map<String, dynamic> review = {
      'starRating': starRating.toString(),
      'writtenReview': writtenReview,
      "userId": userId,
      "hostelId": hostelId,
      "reviewId": uuid,
      "date":
          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year.toString().substring(2)}'
    };
    reviewCollection.add(review).then((value) {
      print("Data added with ID: ${value.id}");
    }).catchError((error) {
      print("Error adding data: $error");
    });
  }
}
