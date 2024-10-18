import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vav_foods_user_app/Constants/colors.dart';
import 'package:vav_foods_user_app/Constants/responsive.dart';
import 'package:vav_foods_user_app/Presentation/widgets/my_app_bar.dart';
import '../../Constants/appcolors.dart';
import '../../Controllers/login_controller.dart';
import '../../Routes/routes.dart';
import '../widgets/headText.dart';
import '../widgets/paraText.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  final LoginController loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: MyAppBar(
          title: "Welcome Screen",
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Responsive.isMobile(context) ||
                              Responsive.isMobileLarge(context)
                          ? Alignment.topLeft
                          : Alignment.center,
                      child: HeadText(
                        text: 'Welcome',
                        textSize: 28,
                        textWeight: FontWeight.w600,
                        textColor: AppColors.textcolor,
                      ),
                    ),
                    Align(
                      alignment: Responsive.isMobile(context) ||
                              Responsive.isMobileLarge(context)
                          ? Alignment.topLeft
                          : Alignment.center,
                      child: ParaText(
                        text: "Let's get you started.",
                        textSize: 16,
                        textColor: AppColors.secondarytext,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                Container(
                  child: Column(
                    children: [
                      const SizedBox(
                        width: 80,
                      ),
                      SvgPicture.asset(
                        'assets/images/Vector.svg',
                        width: 270,
                        height: 287,
                      ),
                    ],
                  ), // Replace with your image path
                ),

                const SizedBox(height: 40),
                //google button
                ElevatedButton.icon(
                  onPressed: () async {
                    await loginController.loginWithGoogle();
                    Get.toNamed(AppRoutes.homeScreen);
                  },
                  icon: const Icon(Icons.g_mobiledata, color: Colors.white),
                  label: HeadText(
                    text: 'Log In with Google',
                    textColor: AppColors.background,
                    textSize: 14,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primarygreen, // Background color
                    padding: const EdgeInsets.symmetric(
                        vertical: 28, horizontal: 50),
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 16),
                // Log in with Email button
                ElevatedButton.icon(
                  onPressed: () {
                    // Add your email login logic here
                    Get.toNamed(AppRoutes.loginScreen);
                  },
                  icon: const Icon(Icons.email_outlined, color: Colors.white),
                  label: HeadText(
                    text: 'Log In with Email',
                    textColor: AppColors.background,
                    textSize: 14,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primarygreen, // Background color
                    padding: const EdgeInsets.symmetric(
                        vertical: 28, horizontal: 50),
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 20),

                // Register link
                GestureDetector(
                  onTap: () {
                    // Add register navigation logic here
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ParaText(
                        text: "Don't have an account? ",
                        textSize: 16,
                        textColor: AppColors.textcolor,
                        // decoration: TextDecoration.underline,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.signupScreen);
                        },
                        child: ParaText(
                          text: "Register",
                          textSize: 16,
                          textColor: AppColors.primarygreen,
                          textWeight: FontWeight.w600,
                          // decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
