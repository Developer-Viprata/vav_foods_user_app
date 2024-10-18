import 'package:flutter/material.dart';
import 'package:vav_foods_user_app/Presentation/widgets/my_app_bar.dart';

import '../../Constants/appcolors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyAppBar(title: 'HomeScreen'),
    );
  }
}
