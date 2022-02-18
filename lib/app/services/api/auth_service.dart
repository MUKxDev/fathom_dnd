import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

@lazySingleton
class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseAuthenticationService stackedAuth =
      FirebaseAuthenticationService();

  Future<FirebaseAuthenticationResult> signUp(
      String email, String password, String name) async {
    return await stackedAuth
        .createAccountWithEmail(
      email: email.trim(),
      password: password.trim(),
    )
        .then((value) async {
      if (!value.hasError) {
        await value.user?.updateDisplayName(name.trim());
        return value;
      } else {
        if (value.user != null) {
          await value.user?.delete();
          return value;
        }
      }
      return value;
    });
  }

  Future<FirebaseAuthenticationResult> signIn(
      String email, String password) async {
    return await stackedAuth
        .loginWithEmail(
      email: email.trim(),
      password: password.trim(),
    )
        .then((value) async {
      if (!value.hasError) {
        return value;
      } else {
        if (value.user != null) {
          await value.user?.delete();
          return value;
        }
      }
      return value;
    });
  }

  Future<bool> sendPasswordReset(String email) async {
    return await stackedAuth.sendResetPasswordLink(email.trim());
  }
}
