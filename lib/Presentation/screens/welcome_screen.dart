import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vav_foods_user_app/Constants/colors.dart';
import 'package:vav_foods_user_app/Presentation/widgets/my_app_bar.dart';
import 'package:vav_foods_user_app/constants/responsive.dart';

import '../../Constants/appcolors.dart';
import '../../Routes/routes.dart';
import '../widgets/headText.dart';
import '../widgets/paraText.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: MyAppBar(
          title: "Welcome Screen",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Container(
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeadText(
                        text: 'Welcome',
                        textSize: 28,
                        textWeight: FontWeight.w600,
                        textColor: AppColors.textcolor,
                      ),
                      ParaText(
                        text: "Let's get you started.",
                        textSize: 16,
                        textColor: AppColors.secondarytext,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 50,
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
                    onPressed: () {},
                    icon: Icon(Icons.login, color: Colors.white),
                    label: HeadText(
                      text: 'Log In with Google',
                      textColor: AppColors.background,
                      textSize: 20,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColors.primarygreen, // Background color
                      padding:
                          EdgeInsets.symmetric(vertical: 28, horizontal: 80),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Log in with Email button
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your email login logic here
                      Get.toNamed(AppRoutes.loginScreen);
                    },
                    icon: Icon(Icons.email_outlined, color: Colors.white),
                    label: HeadText(
                      text: 'Log In with Email',
                      textColor: AppColors.background,
                      textSize: 20,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColors.primarygreen, // Background color
                      padding: const EdgeInsets.symmetric(
                          vertical: 28, horizontal: 80),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
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
      ),
    );
  }
}
