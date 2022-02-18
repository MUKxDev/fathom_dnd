import 'package:fathom_dnd/app/theme/app_colors.dart';
import 'package:fathom_dnd/app/theme/app_text_theme.dart';
import 'package:fathom_dnd/app/theme/app_theme.dart';
import 'package:fathom_dnd/app/utils/ui_helpers.dart';
import 'package:fathom_dnd/app/utils/utils.dart';
import 'package:fathom_dnd/ui/widgets/dumb/dnd_textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../app/utils/constants.dart';
import './sign_up_view_model.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      onModelReady: (SignUpViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        SignUpViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sign Up'),
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
                            controller: model.nameController,
                            label: 'Name',
                            validator: (text) =>
                                (text == null || text.trim() == '')
                                    ? 'Name should not be empty'
                                    : null,
                          ),
                          verticalSpaceSmall(context),
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
                            validator: (text) => Utils.passwordValidation(text),
                          ),
                          verticalSpaceSmall(context),
                          DnDTextField(
                            controller: model.confirmPassController,
                            label: 'Confirm Password',
                            obscure: true,
                            validator: (text) =>
                                Utils.confirmPasswordValidation(
                              text,
                              model.passController.text.trim(),
                            ),
                          ),
                          verticalSpaceSmall(context),
                          model.isBusy
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.purple,
                                  ),
                                )
                              : ElevatedButton(
                                  onPressed: () => model.onSignUpTap(context),
                                  child: Text(
                                    'Sign Up'.toUpperCase(),
                                  ),
                                ),
                          verticalSpaceSmall(context),
                          TextButton(
                            onPressed: () => model.navigateToSignIn(),
                            child: Text(
                              'Already have an account?',
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
