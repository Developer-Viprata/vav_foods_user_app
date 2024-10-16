import 'package:get/get.dart';

import '../Controllers/forgot_password_controller.dart';
import '../Controllers/login_controller.dart';
import '../Controllers/signup_controller.dart';
import '../Data/interfaces/interfaces.dart';
import '../Data/repository/firebase_auth_repo.dart';
import '../Data/services/firebase_auth_services.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Interfaces>(() => FirebaseAuthServices());
    Get.lazyPut<FirebaseAuthRepo>(
        () => FirebaseAuthRepo(interfaces: Get.find<Interfaces>()));

    Get.lazyPut<SignupController>(
        () => SignupController(firebaseAuthRepo: Get.find<FirebaseAuthRepo>()));
    Get.lazyPut<LoginController>(
        () => LoginController(firebaseAuthRepo: Get.find<FirebaseAuthRepo>()));

    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController(
        firebaseAuthRepo: Get.find<FirebaseAuthRepo>()));
  }
}
