import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vav_foods_user_app/Constants/appcolors.dart';
import '../../Controllers/login_controller.dart';
import 'home_screen.dart';
import 'welcome_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final LoginController loginController = Get.find<LoginController>();

  // User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(() {
        if (loginController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return loginController.currentUser.value != null
              ? const HomeScreen()
              : WelcomeScreen();
        }
      }),
    );

    // user != null ? HomeScreen() : WelcomeScreen();
  }
}
