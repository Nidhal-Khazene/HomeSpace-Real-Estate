import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_button.dart';
import 'package:home_space/core/widgets/custom_text_field.dart';
import 'package:home_space/features/auth/presentation/views/finish_sign_up_view.dart';
import 'package:home_space/features/auth/presentation/views/login_view.dart';
import 'package:home_space/features/auth/presentation/views/widgets/reset_password_view.dart';

import '../../../../../core/widgets/custom_go_back_button.dart';

class LoginOrSignUpPassword extends StatelessWidget {
  const LoginOrSignUpPassword({super.key});

  static const routeName = "LoginOrSignUpPassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPrimaryScreenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomGoBackButton(
                onTap: () {
                  Navigator.popAndPushNamed(context, LoginView.routeName);
                },
              ),
              const SizedBox(height: 14),
              Text("Password", style: AppStyles.medium32),
              const SizedBox(height: 32),
              const CustomTextField(textContent: "Password"),
              const SizedBox(height: 12),
              CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, FinishSignUpView.routeName);
                },
                textContent: "Continue",
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ResetPasswordView.routeName);
                },
                child: Text(
                  "Forgot Password ? Reset",
                  style: AppStyles.regular16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
