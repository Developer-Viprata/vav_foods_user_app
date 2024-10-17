import 'package:get/get.dart';
import 'package:vav_foods_user_app/Presentation/screens/auth/address.dart';
import 'package:vav_foods_user_app/Presentation/screens/auth/splash_screen.dart';

// Define your routes
class AppRoutes {
  static const String splashScreen = '/';
  static const String welcomeScreen = '/WelcomeScreen';
  static const String signupScreen = '/SignupScren';
  static const String loginScreen = '/LoginScreen';
  static const String forgotPasswordScreen = '/ForgotPasswordScreen';
  static const String homeScreen = '/HomeScreen';
  // static const String cartScreen = '/CartScreen';

  static final List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const AddressScreen()),
    // GetPage(name: loginScreen, page: () => const LoginScreen()),
    // GetPage(
    //     name: forgotPasswordScreen, page: () => const ForgotPasswordScreen()),
    // GetPage(name: homeScreen, page: () => const HomeScreen()),
  ];
}
