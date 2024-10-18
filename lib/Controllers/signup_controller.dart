// ignore_for_file: avoid_print

import 'package:get/get.dart';
import '../Data/repository/firebase_auth_repo.dart';

class SignupController extends GetxController {
  final FirebaseAuthRepo firebaseAuthRepo;
  var isLoading = false.obs;
  var toggleIcon = false.obs;

  SignupController({required this.firebaseAuthRepo});

  //signup
  Future<void> signup(
    String email,
    String fullName,
    String phoneNumber,
    String password,
  ) async {
    try {
      isLoading.value = true;

      await firebaseAuthRepo.signup(email, password, fullName, phoneNumber);
      Get.snackbar('Success', "user signed up successfully");
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign up');
      print("Error in the signup controller $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      isLoading.value = true;
      await firebaseAuthRepo.logout();
      Get.snackbar('Success', "signed out successfully");
    } catch (e) {
      Get.snackbar('Error', 'Failed to log out');
      print("Error while sign out $e");
    } finally {
      isLoading.value = false;
    }
  }
}
