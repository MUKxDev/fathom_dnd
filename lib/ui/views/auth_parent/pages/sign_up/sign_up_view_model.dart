import 'package:fathom_dnd/app/core/custom_base_view_model.dart';
import 'package:fathom_dnd/app/locator/locator.dart';
import 'package:fathom_dnd/app/router/router.dart';
import 'package:fathom_dnd/app/services/api/auth_service.dart';
import 'package:fathom_dnd/app/services/app/router_service.dart';
import 'package:fathom_dnd/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class SignUpViewModel extends CustomBaseViewModel {
/* -------------------------------------------------------------------------- */
/*                                  Services                                  */
/* -------------------------------------------------------------------------- */
  final RouterService _routerService = locator<RouterService>();
  final AuthService _authService = locator<AuthService>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  Future<void> init() async {}

  Future onSignUpTap(BuildContext context) async {
    bool name = nameController.text.trim() != '';
    bool email = Utils.boolEmailValidation(emailController.text.trim());
    bool pass = Utils.boolPasswordValidation(passController.text.trim());
    bool conPass = Utils.boolConfirmPasswordValidation(
        confirmPassController.text.trim(), passController.text.trim());
    if (email && pass && conPass && name) {
      setBusy(true);
      bool isUserCreated = await _authService
          .signUp(
              emailController.text, passController.text, nameController.text)
          .then((value) {
        if (value.hasError) {
          SnackBar _errorSnackBar = SnackBar(
            content: Text(value.errorMessage ?? ''),
            duration: const Duration(seconds: 4),
          );
          ScaffoldMessenger.of(context).showSnackBar(_errorSnackBar);
        }

        return value.user != null;
      });

      if (isUserCreated) {
        _routerService.router.pushAndPopUntil(
          const HomeRoute(),
          predicate: (route) => false,
        );
      }

      setBusy(false);
    }
  }

  navigateToSignIn() async {
    await _routerService.authRouter?.navigate(const LoginRoute());
  }
}
