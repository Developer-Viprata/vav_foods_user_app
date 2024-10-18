// ignore_for_file: unnecessary_null_comparison, annotate_overrides, avoid_print

import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../interfaces/interfaces.dart';
import '../models/user_model.dart';

class FirebaseAuthServices implements Interfaces {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Signup method implementation

  @override
  Future<void> signup(String email, String password, String fullName,
      String phoneNumber) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential != null) {
        // Add the user data to Firestore
        final UserModel userModel = UserModel(
            userId: userCredential.user!.uid,
            fullName: fullName,
            email: email,
            phoneNumber: phoneNumber,
            password: password,
            role: UserRole.Customer,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            userDeviceToken: '',
            userImg: '');
        await firebaseFirestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(userModel.toMap());
      }
    } catch (e) {
      print("Error during signup: $e");
    }
  }

  // Login method implementation
  @override
  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential != null) {
        // Fetch user data from Firestore
        DocumentSnapshot documentSnapshot = await firebaseFirestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();

        if (documentSnapshot.exists) {
          print("User data: ${documentSnapshot.data()}");
        } else {
          print("No user data found");
        }
      }
    } catch (e) {
      print("Error during login: $e");
    }
  }
  //login with google

  @override
  Future<void> loginWithGoogle() async {
    try {
      UserCredential userCredential;
      if (kIsWeb) {
        // Web-specific flow
        final GoogleAuthProvider googleProvider = GoogleAuthProvider();

        // This will trigger the Google Sign-In flow and prompt the user
        userCredential = await firebaseAuth.signInWithPopup(googleProvider);
      } else {
        // Mobile-specific flow
        final GoogleSignIn googleSignIn = GoogleSignIn();
        final GoogleSignInAccount? googleSignInAccount =
            await googleSignIn.signIn();

        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication =
              await googleSignInAccount.authentication;

          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );

          userCredential = await firebaseAuth.signInWithCredential(credential);
        } else {
          return; // User canceled the sign-in flow
        }
      }

      final User? user = userCredential.user;
      if (user != null) {
        UserModel userModel = UserModel(
          userId: user.uid,
          fullName: user.displayName ?? '',
          email: user.email ?? '',
          phoneNumber: user.phoneNumber ?? '',
          password: '',
          role: UserRole.Customer,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          userDeviceToken: '',
          userImg: user.photoURL ?? '',
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set(userModel.toMap());
      }
    } catch (e) {
      print("Error during Google sign-in: $e");
    }
  }

  // Logout method implementation
  @override
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      print("Error during logout: $e");
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("Error in sending password reset email: $e");
    }
  }
}
