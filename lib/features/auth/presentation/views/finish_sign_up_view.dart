import 'package:flutter/material.dart';
import 'package:home_space/features/auth/presentation/views/widgets/finish_sign_up_view_body.dart';

class FinishSignUpView extends StatelessWidget {
  const FinishSignUpView({super.key});

  static const routeName = "finishSignUp";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: FinishSignUpViewBody()));
  }
}
