// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/responsive.dart';
import '../../Constants/colors.dart';
import '../../Controllers/forgot_password_controller.dart';
import '../../Routes/routes.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text.dart';
import '../widgets/my_textFormField.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final ForgotPasswordController forgotPasswordController =
      Get.find<ForgotPasswordController>();
  final TextEditingController forgotEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: MyAppBar(
        title: 'Forgot Password Screen',
      ),
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: 'Enter Email',
                  ),
                  CustomTextFormField(
                    height: 40,
                    controller: forgotEmailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    text: 'Send to Mail',
                    onPressed: () async {
                      if (forgotEmailController.text.isNotEmpty) {
                        await forgotPasswordController.forgotPassword(
                          forgotEmailController.text.trim(),
                        );

                        Get.toNamed(AppRoutes.loginScreen);
                      } else {
                        print("Can't able to send");
                      }
                    },
                    minWidth: MediaQuery.of(context).size.width * 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
