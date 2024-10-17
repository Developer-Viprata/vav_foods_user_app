// ignore_for_file: avoid_print

import 'package:get/get.dart';
import '../Data/repository/firebase_auth_repo.dart';

class LoginController extends GetxController {
  final FirebaseAuthRepo firebaseAuthRepo;
  LoginController({required this.firebaseAuthRepo});

  final isLoading = false.obs;

  //login
  Future<void> login(
    String email,
    String password,
  ) async {
    try {
      isLoading.value = true;
      await firebaseAuthRepo.login(email, password);
      Get.snackbar('Success', "user signed up successfully");
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign up');
      print("Error in the signup controller $e");
    } finally {
      isLoading.value = false;
    }
  }

  //sign in with google
}
