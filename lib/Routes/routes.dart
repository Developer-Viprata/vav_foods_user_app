import 'package:get/get.dart';
import '../Presentation/screens/forgot_password_screen.dart';
import '../Presentation/screens/home_screen.dart';
import '../Presentation/screens/login_screen.dart';
import '../Presentation/screens/main_screen.dart';
import '../Presentation/screens/signup_screen.dart';
import '../Presentation/screens/welcome_screen.dart';

// Define your routes
class AppRoutes {
  static const String splashScreen = '/';
  static const String welcomeScreen = '/WelcomeScreen';

  static const String signupScreen = '/SignupScren';
  static const String loginScreen = '/LoginScreen';
  static const String forgotPasswordScreen = '/ForgotPasswordScreen';
  static const String mainScreen = '/MainScreen';
  static const String homeScreen = '/HomeScreen';
  // static const String cartScreen = '/CartScreen';

  static final List<GetPage> routes = [
    GetPage(name: welcomeScreen, page: () => WelcomeScreen()),
    GetPage(name: splashScreen, page: () => const SignupScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(
        name: forgotPasswordScreen, page: () => const ForgotPasswordScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: mainScreen, page: () => MainScreen()),
  ];
}
