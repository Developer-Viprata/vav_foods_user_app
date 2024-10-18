// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../Data/repository/firebase_auth_repo.dart';

class LoginController extends GetxController {
  final FirebaseAuthRepo firebaseAuthRepo;
  LoginController({required this.firebaseAuthRepo});

  final isLoading = false.obs;
  final Rx<User?> currentUser = Rx<User?>(null);

  //login
  Future<void> login(
    String email,
    String password,
  ) async {
    try {
      isLoading.value = true;
      await firebaseAuthRepo.login(email, password);
      Get.snackbar('Success', "User Login Successfully");
    } catch (e) {
      Get.snackbar('Error', 'Failed to login');
      print("Error in the signup controller $e");
    } finally {
      isLoading.value = false;
    }
  }

  //sign in with google

  Future<void> loginWithGoogle() async {
    try {
      isLoading.value = true;

      await firebaseAuthRepo.loginWithGoogle();
      Get.snackbar('Success', "Login with Google Account Successfully");
    } catch (e) {
      Get.snackbar('Error', 'Failed to login with google');
      print("Error login in with google - $e");
    } finally {
      isLoading.value = false;
    }
  }

  //log out
  Future<void> logout() async {
    try {
      isLoading.value = true;

      await firebaseAuthRepo.logout();
      Get.snackbar('Success', "Log out Successfully");
    } catch (e) {
      Get.snackbar('Error', 'Failed to logout');

      print("Error while logout - $e");
    } finally {
      isLoading.value = false;
    }
  }

  //current user login
  Future<void> checkCurrentUser() async {
    try {
      isLoading.value = true;
      await firebaseAuthRepo.checkCurrentUser();
    } catch (e) {
      print("Error while fetching current user - $e");
    }
  }
}
