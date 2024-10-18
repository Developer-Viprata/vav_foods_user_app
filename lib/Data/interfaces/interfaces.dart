//abstrat classes

abstract class Interfaces {
  Future<void> signup(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  );

  Future<void> login(String email, String password);

  Future<void> loginWithGoogle();
  Future<void> logout();

  Future<void> forgotPassword(String email);
}
