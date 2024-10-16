// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/colors.dart';
import '../../Constants/responsive.dart';
import '../../Controllers/signup_controller.dart';
import '../../Routes/routes.dart';
import '../widgets/my_text.dart';
import '../widgets/my_textFormField.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupController signupController = Get.find<SignupController>();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userFullName = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController userPhoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Responsive.isDesktop(context) ||
                        Responsive.isDesktopLarge(context)
                    ? MediaQuery.of(context).size.width * .4
                    : Responsive.isTablet(context)
                        ? MediaQuery.of(context).size.width * .7
                        : Responsive.isMobile(context)
                            ? MediaQuery.of(context).size.width * 1
                            : MediaQuery.of(context).size.width * .9,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //sign up text
                    MyText(
                      text: 'Sign Up',
                      color: black,
                      fontSize: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyText(
                      text: 'Enter your credentials to continue',
                      color: grey,
                      fontSize: 14,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //full name
                    MyText(text: 'User Name'),
                    CustomTextFormField(
                      height: 40,
                      controller: userFullName,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //email
                    MyText(text: 'Email'),
                    CustomTextFormField(
                      height: 40,
                      controller: userEmail,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //password
                    MyText(text: 'Password'),
                    CustomTextFormField(
                      height: 40,
                      controller: userPassword,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    RichText(
                      text: const TextSpan(
                        text: 'By Continuing you agree to our ', // Default text
                        style: TextStyle(
                          color: grey,
                          fontSize: 14,
                        ), // Default style
                        children: [
                          TextSpan(
                            text: 'Terms of Service', // First clickable text
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                            ), // Make it green
                          ),
                          TextSpan(
                            text: ' and ', // Default text
                            style: TextStyle(
                              color: grey,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy', // Second clickable text
                            style:
                                TextStyle(color: Colors.green), // Make it green
                          ),
                          TextSpan(
                            text: '.', // Default text
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => signupController.isLoading.value
                              ? const CupertinoActivityIndicator()
                              : MaterialButton(
                                  height: 70,
                                  /* minWidth:
                                      MediaQuery.of(context).size.width * .85, */
                                  minWidth: Responsive.isDesktop(context) ||
                                          Responsive.isDesktopLarge(context)
                                      ? MediaQuery.of(context).size.width * .35
                                      : Responsive.isTablet(context)
                                          ? MediaQuery.of(context).size.width *
                                              .52
                                          : Responsive.isMobile(context)
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .85
                                              : MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .7,
                                  color: greencolor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  onPressed: () async {
                                    if (userEmail.text != '' &&
                                        userFullName.text != '' &&
                                        userPassword != '' &&
                                        userPhoneNumber != '') {
                                      await signupController.signup(
                                        userEmail.text.trim(),
                                        userFullName.text.trim(),
                                        userPhoneNumber.text.trim(),
                                        userPassword.text.trim(),
                                      );
                                      // Get.to(() => const HomeScreen());
                                      Get.toNamed(AppRoutes.homeScreen);
                                    } else {
                                      print('Something went wrong');
                                    }
                                  },
                                  child: MyText(
                                    text: 'Sign up',
                                    color: white,
                                    fontSize: 14,
                                  ),
                                ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          text: 'Already have an account? ',
                          color: grey,
                          fontSize: 14,
                        ),
                        //Login In
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.loginScreen);
                          },
                          child: MyText(
                            text: 'Login',
                            color: greencolor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
