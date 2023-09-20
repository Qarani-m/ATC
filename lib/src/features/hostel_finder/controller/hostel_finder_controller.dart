// ignore_for_file: avoid_print

import 'package:atc/src/constants/colors.dart';
import 'package:atc/src/features/authentication/repository/auth_helper.dart';
import 'package:atc/src/features/hostel_finder/models/hostel_model.dart';
import 'package:atc/src/features/hostel_finder/models/review_model.dart';
import 'package:atc/src/features/hostel_finder/repository/aux_functions.dart';
import 'package:atc/src/features/hostel_finder/repository/firestore_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HostelFinderController extends GetxController {
  final _fireStore = FirebaseFirestore.instance;
  // Text editing and focus management
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchBarFocusNode = FocusNode();
  final RxBool showSearchIcon = true.obs;

  AuthHelper authHelperController = Get.put(AuthHelper());
  // Filter management
  final RxInt filterActiveIndex = 0.obs;
  final RxInt currentPageDotIndex = 0.obs;
  HostelModel hostelModel = HostelModel();

  // Box shadow for UI consistency
  List<BoxShadow> get boxShadow {
    return [
      BoxShadow(
        color: AppColors.secondaryColor.withOpacity(0.02),
        offset: const Offset(0, 4),
        blurRadius: 4.0,
      ),
      const BoxShadow(
        color: Colors.transparent,
        offset: Offset(-5, 0),
      ),
      const BoxShadow(
        color: Colors.transparent,
        offset: Offset(5, 0),
      ),
    ];
  }

  // Set the active filter index to display that small arrow thingie when presses
  void setFilterActiveIndex(int index) {
    filterActiveIndex.value = index;
  }

  // Navigate to hostel details screen with parameters
  void goToHostelDetails(String hostelId) {
    Get.toNamed("/hostelDetails", parameters: {
      "hostelId": hostelId,
    });
  }

  Future<void> goToReview(String hostelId) async {
    User? user = await authHelperController.getCurrentUser();
    if (user != null) {
      Get.toNamed(
        parameters: {"hostelId": hostelId, "hostelName": "Nacary hostel"},
        "/reviewPage",
      );
    } else {
      HostelFinderAuxFunctions.showBottomSheet(hostelId);
    }
  }

  Future<HostelModel?> fetchOneHostel(String hostelId) async {
    return fetchDocumentById("hostels", hostelId);
  }

  Future<HostelModel?> fetchDocumentById(
      String collectionName, String documentId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(documentId)
          .get();
      if (documentSnapshot.exists) {
        print(documentSnapshot);
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        hostelModel = HostelModel(
            name: data['name'],
            contactInfo: data['contactInfo'],
            priceForOne: data['priceForOne'],
            wifiStatus: data['wifiStatus'],
            description: data['description'],
            type: data['type'],
            hotShowerStatus: data["hotShowerStatus"],
            priceForTwo: data['priceForTwo'],
            reviewCount: data['reviewCount'],
            location: data['location'],
            beds: data['beds'],
            waterStatus: data['waterStatus'],
            mainImageUrl: data['mainImageUrl']);
        return hostelModel;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching document: $e');
      return null;
    }
  }

  List<ReviewModel> reviewsList = [];

  ReviewModel reviewModel = ReviewModel();
  Future<List<ReviewModel>> getAllReviews(String hostelId) async {
    reviewsList = [];

    try {
      print(hostelId);
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('reviews') // Replace with your collection name
          .where('hostelId', isEqualTo: hostelId)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          ReviewModel review = ReviewModel.fromJson(data);

          reviewsList.add(review);
        }
        print("---->here are some reviews");
      } else {
        print("---->no reviews here");

        return reviewsList;
      }
    } catch (e) {
      print(e);
    }
    return reviewsList;
  }

  List<HostelModel> hostelList = [];
  List<String> hostelIds = [];

  Future<List<HostelModel>> fetchAllHostelDataFromFirestore() async {
    try {
      hostelIds = [];
      QuerySnapshot querySnapshot =
          await _fireStore.collection('hostels').get();
      List<Map<String, dynamic>> data = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      hostelList = data.map((map) => HostelModel.fromJson(map)).toList();
      hostelIds = querySnapshot.docs.map((doc) => doc.id).toList();
      print(hostelIds[0]);
    } catch (e) {
      print('Error fetching collection data: $e');
    }
    return hostelList;
  }

  RxInt activeDetailsFilter = 0.obs;
  RxInt reviewCount = 0.obs;
  

  void changeActiveDetailsFilter(int i) {
    activeDetailsFilter.value = i;
          print(activeDetailsFilter.value);
  }

  void goBack() {
    Get.back();
  }
}
