import 'package:fathom_dnd/app/core/custom_base_view_model.dart';
import 'package:fathom_dnd/app/locator/locator.dart';
import 'package:fathom_dnd/app/router/router.dart';
import 'package:fathom_dnd/app/services/api/auth_service.dart';
import 'package:fathom_dnd/app/services/app/router_service.dart';
import 'package:fathom_dnd/app/theme/app_colors.dart';
import 'package:fathom_dnd/app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../../../app/theme/app_text_theme.dart';

class LoginViewModel extends CustomBaseViewModel {
/* -------------------------------------------------------------------------- */
/*                                  Services                                  */
/* -------------------------------------------------------------------------- */
  final RouterService _routerService = locator<RouterService>();
  final AuthService _authService = locator<AuthService>();

  // TODO: remove the values in production
  TextEditingController emailController =
      TextEditingController(text: 'mukxdev@gmail.com');
  TextEditingController passController =
      TextEditingController(text: 'Muk12345');

  Future<void> init() async {}

  Future onSignInTap(BuildContext context) async {
    bool email = Utils.boolEmailValidation(emailController.text.trim());

    if (email) {
      setBusy(true);
      bool isSignedIn = await _authService
          .signIn(emailController.text, passController.text)
          .then((value) {
        if (value.hasError) {
          SnackBar _errorSnackBar = SnackBar(
            content: Text(
              value.errorMessage ?? '',
              style: AppTextTheme.textTheme.caption,
            ),
            backgroundColor: AppColors.red,
            duration: const Duration(seconds: 4),
          );
          ScaffoldMessenger.of(context).showSnackBar(_errorSnackBar);
        }

        return value.user != null;
      });

      if (isSignedIn) {
        _routerService.router.pushAndPopUntil(
          const HomeRoute(),
          predicate: (route) => false,
        );
      }

      setBusy(false);
    }
  }

  navigateToSignUp() async {
    await _routerService.authRouter?.navigate(const SignUpRoute());
  }

  forgetPassword(BuildContext context) async {
    bool isEmailSent =
        await _authService.sendPasswordReset(emailController.text.trim());

    if (isEmailSent) {
      SnackBar _snackBar = const SnackBar(
        content: Text('Password reset email sent'),
        duration: Duration(seconds: 4),
      );
      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
    } else {
      SnackBar _snackBar = SnackBar(
        content: Text(
          'Failed to send reset password email. "make sure to type the correct email"',
          style: AppTextTheme.textTheme.caption,
        ),
        backgroundColor: AppColors.red,
        duration: const Duration(seconds: 4),
      );
      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
    }
  }
}
