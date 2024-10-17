import 'package:flutter/material.dart';
import 'package:vav_foods_user_app/Constants/appcolors.dart';
import 'package:vav_foods_user_app/Presentation/widgets/inkwell_button.dart';
import 'package:vav_foods_user_app/Presentation/widgets/mytext.dart';
import 'package:vav_foods_user_app/Presentation/widgets/paraText.dart';
import 'package:vav_foods_user_app/Presentation/widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100), // To push the content down
                  // Title "Login"
                  const HeadText(
                    text: 'Login',
                    textSize: 26,
                    textWeight: FontWeight.w600,
                  ),
                  // Subtitle
                  const ParaText(
                    text: 'Enter your email and password',
                    textSize: 16,
                    textWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 32),
                  // Email TextFormField
                   HeadText(
                    text: 'Email',
                    textSize: 16,
                    textWeight: FontWeight.w600,
                    textColor:AppColors.secondarytext,
                  ),
                  CustomTextField(),
                  const SizedBox(height: 50),
                  // Password TextFormField
                   HeadText(
                    text: 'Password',
                    textSize: 16,
                    textWeight: FontWeight.w600,
                    textColor: AppColors.secondarytext,
                  ),
                  CustomTextField(suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility_off))),
                  SizedBox(height: 12),
                  // Forgot Password?
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: ParaText(
                          text: 'Forgot Password?',
                          textSize: 14,
                          textWeight: FontWeight.w400,
                          textColor: AppColors.textcolor,
                        )),
                  ),
                  SizedBox(height: 24),
                  // Log In Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWellButton(text: 'Login', onPressed: () {}),
                    ],
                  ),
                  SizedBox(height: 24),
                  // Sign Up link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ParaText(
                        text: "Don't have an account?",
                        textSize: 16,
                        textWeight: FontWeight.w600,
                        textColor: AppColors.textcolor,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: ParaText(
                              text: 'Register',
                              textSize: 16,
                              textWeight: FontWeight.w600,
                              textColor: AppColors.textcolor)),
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
