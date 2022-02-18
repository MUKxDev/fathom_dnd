import 'package:fathom_dnd/app/theme/app_colors.dart';
import 'package:fathom_dnd/app/theme/app_text_theme.dart';
import 'package:fathom_dnd/app/utils/constants.dart';
import 'package:fathom_dnd/app/utils/ui_helpers.dart';
import 'package:fathom_dnd/app/utils/utils.dart';
import 'package:fathom_dnd/ui/widgets/dumb/dnd_textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (LoginViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        LoginViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sign In'),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 600,
                ),
                child: Column(
                  children: [
                    verticalSpaceMedium(context),
                    Image.asset(
                      Constants.fathomLogo,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                    verticalSpaceMedium(context),
                    Text(
                      'Welcome to Fathom D&D',
                      style: AppTextTheme.textTheme.titleMedium,
                    ),
                    verticalSpaceMedium(context),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          DnDTextField(
                            controller: model.emailController,
                            label: 'Email',
                            validator: (text) => Utils.emailValidation(text),
                          ),
                          verticalSpaceSmall(context),
                          DnDTextField(
                            controller: model.passController,
                            label: 'Password',
                            obscure: true,
                            onSubmit: (text) => model.onSignInTap(context),
                          ),
                          verticalSpaceSmall(context),
                          model.isBusy
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.purple,
                                  ),
                                )
                              : ElevatedButton(
                                  onPressed: () => model.onSignInTap(context),
                                  child: Text(
                                    'Sign In'.toUpperCase(),
                                  ),
                                ),
                          verticalSpaceSmall(context),
                          TextButton(
                            onPressed: () => model.navigateToSignUp(),
                            child: Text(
                              'Create a new account?',
                              style: AppTextTheme.textTheme.button,
                            ),
                          ),
                          verticalSpaceSmall(context),
                          TextButton(
                            onPressed: () => model.forgetPassword(),
                            child: Text(
                              'Forgot Password?',
                              style: AppTextTheme.textTheme.button,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
