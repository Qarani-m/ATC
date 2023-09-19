import 'package:cloud_firestore/cloud_firestore.dart';

class SubmitReview {

  static Future<void> submitReview(double starRating, String writtenReview,
      String userId, String hostelId) async {
  final firestore = FirebaseFirestore.instance;
    CollectionReference reviewCollection = firestore.collection('reviews');
    Map<String, dynamic> review = {
      'starRating': starRating.toString(),
      'writtenReview': writtenReview,
      "userId": userId,
      "hostelId": hostelId,
      "date":'${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year.toString().substring(2)}'
    };
    reviewCollection.add(review).then((value) {

      print("Data added with ID: ${value.id}");
    }).catchError((error) {
      print("Error adding data: $error");
    });
  }
}
