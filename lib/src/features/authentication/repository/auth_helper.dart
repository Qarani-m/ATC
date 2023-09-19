// ignore_for_file: avoid_print

import 'package:atc/src/features/authentication/model/user_model.dart';
import 'package:atc/src/features/authentication/repository/auth_db_helper.dart';
import 'package:atc/src/features/authentication/repository/aux_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  late final Rx<User?> firebaseUser;
  static String uuid = "";

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<void> signUp(String name, String email, String phone, String password,
      String? nextPage, String arg) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await saveToFireStore(name, email, phone);
      
      Get.toNamed(nextPage!);
    } on FirebaseAuthException catch (e) {
      switch (e.code.toString()) {
        case "email-already-in-use":
          AuthAuxFunctons.showSnackBar("Sign up error", "Email already in use");
          break;
        case "weak-password":
          AuthAuxFunctons.showSnackBar("Sign up error", "Password too weak");
          break;
        default:
          AuthAuxFunctons.showSnackBar(
              "Sign up error", "An unknown error occured");
          AuthAuxFunctons.showSnackBar(
              "Quick fix", "Contact 0704847676 for a fix");
      }
    } catch (e) {
      print(e.toString());

      AuthAuxFunctons.showSnackBar("Sign up error", "An unknown error occured");
      AuthAuxFunctons.showSnackBar("Quick fix", "Contact 0704847676 for a fix");
    }
  }

  static void generateId() {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String randomNumber = Random().nextInt(1000000).toString();
    uuid = timestamp + randomNumber;
  }


  Future<void> saveToFireStore(
    String name,
    String email,
    String phone,
  ) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

    generateId();
    await prefs.setStringList('userDetails', <String>[
          name,
          email,
          phone,
          "",
          "",
          "",
          uuid
        ]);

    await _fireStore.collection('users').doc(uuid).set({
      'name': name,
      'email': email,
      "phone": phone,
      "yearOfStudy": "",
      "course": "",
      "idNumber": 0
    });

  }

  Future<void> signInUser(
      String email, String password, String nextPage, String arg) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await fetchUserDataByEmail(email);
      Get.toNamed(nextPage, parameters: {"hostelId": arg});
    } catch (e) {
      AuthAuxFunctons.showSnackBar("Sign in error", "Invalid email / password");
      print('Error signing in: $e');
    }
  }

  Future<void> fetchUserDataByEmail(String email) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users') // Replace with your collection name
          .where('email', isEqualTo: email)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        final userData = querySnapshot.docs[0].data() as Map<String, dynamic>;
        await prefs.setStringList('userDetails', <String>[
          userData['name'],
          userData['email'],
          userData['phone'],
          userData['yos'],
          userData['course'],
          userData['idNumber'].toString(),
          querySnapshot.docs[0].id
        ]);
      } else {
        print('No user found with email: $email');
      }
    } catch (e) {
      AuthAuxFunctons.showSnackBar("Sign in error", "Invalid email / password");

    }
  }

  Future<void> signOut() async {
    _auth.signOut();
  }
}
