import 'package:firebase_auth/firebase_auth.dart';

import '../interfaces/interfaces.dart';

class FirebaseAuthRepo {
  final Interfaces interfaces;
  FirebaseAuthRepo({
    required this.interfaces,
  });

//add user data to the firevbase
  Future<void> signup(String email, String password, String fullName,
      String phoneNumber) async {
    return interfaces.signup(email, password, fullName, phoneNumber);
  }

  //getUserdata
  Future<void> login(String email, String password) async {
    return interfaces.login(email, password);
  }

  Future<void> loginWithGoogle() async {
    return interfaces.loginWithGoogle();
  }

  // Logout by calling the logout method from Interfaces
  Future<void> logout() async {
    return interfaces.logout();
  }

  Future<void> forgotPassword(String email) {
    return interfaces.forgotPassword(email);
  }

  Future<User?> checkCurrentUser() {
    return interfaces.checkCurrentUser();
  }
}
