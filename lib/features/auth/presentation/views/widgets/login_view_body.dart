import 'package:flutter/material.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/features/auth/presentation/views/widgets/login_or_sign_up_view.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: LoginOrSignUpView(),
    );
  }
}
