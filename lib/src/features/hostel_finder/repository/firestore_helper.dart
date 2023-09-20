// ignore_for_file: avoid_print

import 'package:atc/src/features/hostel_finder/models/hostel_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HostelFireStoreHelper extends GetxController {
  final _fireStore = FirebaseFirestore.instance;
  // Future<List> fetchDataFromFirestore() async {
  //   var dataList = [].obs;

  //   try {
  //     QuerySnapshot querySnapshot =
  //         await _fireStore.collection('hostels').get();
  //     List<Map<String, dynamic>> data = querySnapshot.docs
  //         .map((doc) => doc.data() as Map<String, dynamic>)
  //         .toList();
  //     dataList.value = data;
  //     print(dataList[0]);
  //   } catch (e) {
  //     print('Error fetching collection data: $e');
  //   }
  //   return dataList;
  // }

Future<List<HostelModel>> fetchDataFromFirestore() async {
  List<HostelModel> hostelList = [];

  try {
    QuerySnapshot querySnapshot = await _fireStore.collection('hostels').get();
    List<Map<String, dynamic>> data = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    hostelList = data.map((map) => HostelModel.fromJson(map)).toList();
    // print(hostelList[0].name);
  } catch (e) {
    print('Error fetching collection data: $e');
  }
  return hostelList;
}










}
