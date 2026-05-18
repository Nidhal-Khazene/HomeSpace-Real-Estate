import 'package:flutter/material.dart';
import 'package:home_space/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = "LoginView";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: LoginViewBody()));
  }
}
