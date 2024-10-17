import 'package:flutter/material.dart';
import 'package:vav_foods_user_app/Constants/appcolors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primarygreen, // The dark green background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Vector.png', 
              width: 256,
              height: 85,
            ),
            
            
                      ],
        ),
      ),
    );
  }
}