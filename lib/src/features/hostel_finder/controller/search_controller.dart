// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchBarController extends GetxController {
  TextEditingController searchEditingController = TextEditingController();
  void goToSearchPage() {
    Get.toNamed("/searchPage");
  }

  List<String>? existingSearches = <String>[];
  RxBool showRecentResults = true.obs;
  RxList<String> hostelNames = <String>[].obs;
  RxList<String> hostelIds= <String>[].obs;

  Future<void> queryFirestore(String val) async {
    showRecentResults.value = false;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    final CollectionReference collection = firestore.collection('hostels');

     String searchTerm = val;
    val.length >0?searchTerm = val:searchTerm="lslslslslslslslslslslslslsdlsdsdfw4rsd";

    QuerySnapshot querySnapshot = await collection
        .where('name', isGreaterThanOrEqualTo: searchTerm)
        .where('name', isLessThanOrEqualTo: '$searchTerm\uf8ff')
        .get();

    List<String> names = [];
    List<String> ids = [];

   querySnapshot.docs.forEach((DocumentSnapshot doc) {
  final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  final String? name = data['name']; // Access the 'name' field
  if (name != null) {
    final String documentId = doc.id; // Extract the document ID
    print("Document ID: $documentId");
    print("Name: $name"); // Print the name
    names.add(name);
    ids.add(documentId);
  }
});


    hostelNames.assignAll(names); // Replace the data in the RxList with names
    hostelIds.assignAll(ids);
    print(hostelNames); // Print the list of names
  }

  Future<void> fetchResult(String hostelId) async {
    Get.toNamed("/hostelDetails", parameters: {"hostelId":hostelId});
  }
}
