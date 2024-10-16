import 'package:get/get.dart';

import '../Data/repository/firebase_auth_repo.dart';

class ForgotPasswordController extends GetxController {
  final FirebaseAuthRepo firebaseAuthRepo;

  ForgotPasswordController({required this.firebaseAuthRepo});

  final isLoading = false.obs;

  Future<void> forgotPassword(String email) async {
    try {
      isLoading.value = true;
      await firebaseAuthRepo.forgotPassword(email);
      Get.snackbar('Success', "Send Reset link to ");
    } catch (e) {
      Get.snackbar("Error", "Failed in sending password reset email $e");
    } finally {
      isLoading.value = false;
    }
  }
}
