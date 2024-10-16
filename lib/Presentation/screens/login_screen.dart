import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/colors.dart';
import '../../Constants/responsive.dart';
import '../../Controllers/login_controller.dart';
import '../../Routes/routes.dart';
import '../widgets/my_text.dart';
import '../widgets/my_textFormField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userEmail = TextEditingController();
  final TextEditingController userPassword = TextEditingController();
  final LoginController loginController = Get.find<LoginController>();
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
                      text: 'Login',
                      fontWeight: FontWeight.w600,
                      color: black,
                      fontSize: 20,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    MyText(
                      text: 'Enter your credentials to continue',
                      fontWeight: FontWeight.w400,
                      color: grey,
                      fontSize: 14,
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    //email
                    MyText(
                      text: 'Email',
                      fontWeight: FontWeight.w400,
                      color: grey,
                    ),

                    CustomTextFormField(
                      height: 40,
                      controller: userEmail,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //password
                    MyText(
                      fontWeight: FontWeight.w400,
                      text: 'Password',
                      color: grey,
                    ),

                    CustomTextFormField(
                      height: 40,
                      controller: userPassword,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        //forgot password screen
                        Get.toNamed(AppRoutes.forgotPasswordScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MyText(
                            text: 'Forgot password?',
                            color: black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          )
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
                          () => loginController.isLoading.value
                              ? const CupertinoActivityIndicator()
                              : MaterialButton(
                                  height: 70,
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
                                        userPassword.text != '') {
                                      await loginController.login(
                                          userEmail.text, userPassword.text);
                                      // Get.to(() => const HomeScreen());
                                      Get.toNamed(AppRoutes.homeScreen);
                                    } else {
                                      print('Something went wrong');
                                    }
                                  },
                                  child: MyText(
                                    text: 'Login',
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
                          text: "Don't have an account? ",
                          color: grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        //Login In
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.signupScreen);
                          },
                          child: MyText(
                            text: 'Signup',
                            color: greencolor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
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
