import 'package:flutter/material.dart';
import 'package:vav_foods_user_app/Constants/appcolors.dart';
import 'package:vav_foods_user_app/Presentation/widgets/inkwell_button.dart';
import 'package:vav_foods_user_app/Presentation/widgets/mytext.dart';
import 'package:vav_foods_user_app/Presentation/widgets/paraText.dart';
import 'package:vav_foods_user_app/Presentation/widgets/textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100), // To push the content down
                  // Title "Register"
                  const HeadText(
                    text: 'Register',
                    textSize: 26,
                    textWeight: FontWeight.w600,
                  ),
                  // Subtitle
                  const ParaText(
                    text: 'Enter your details to continue',
                    textSize: 16,
                    textWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 32),
                  // Name TextFormField
                   HeadText(
                    text: 'Name',
                    textSize: 16,
                    textWeight: FontWeight.w600,
                    textColor: AppColors.secondarytext,
                  ),
                  CustomTextField(),
                  const SizedBox(height: 40),
                  // Email TextFormField
                   HeadText(
                    text: 'Email',
                    textSize: 16,
                    textWeight: FontWeight.w600,
                    textColor: AppColors.secondarytext,
                  ),
                  CustomTextField(),
                  const SizedBox(height: 40),
                  // Password TextFormField

                   HeadText(
                    text: 'Password',
                    textSize: 16,
                    textWeight: FontWeight.w600,
                    textColor: AppColors.secondarytext,
                  ),
                  CustomTextField(
                      suffixIcon: IconButton(
                          onPressed: () {setState(() {
              _obscureText = !_obscureText;
            });}, icon: Icon( _obscureText ? Icons.visibility : Icons.visibility_off,))),
                  SizedBox(height: 20),
                  // Forgot Password?
                  Align(
                      alignment: Alignment.centerLeft,
                      child: ParaText(
                        text:
                            'By continnuying you agree to our Terms of Service \nand PrivecyPolicy',
                        textSize: 14,
                        textWeight: FontWeight.w400,
                      )),
                  SizedBox(height: 80),
                  // Log In Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWellButton(text: 'Sign Up', onPressed: () {}),
                    ],
                  ),
                  SizedBox(height: 24),
                  // Sign Up link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ParaText(
                        text: 'Alredy have an account?',
                        textSize: 14,
                        textWeight: FontWeight.w600,
                        textColor: AppColors.textcolor,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: ParaText(
                          text: 'Login',
                          textSize: 14,
                          textWeight: FontWeight.w600,
                          textColor: AppColors.primarygreen,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
