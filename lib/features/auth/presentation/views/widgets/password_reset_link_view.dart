import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_space/constants.dart';
import 'package:home_space/core/utils/assets.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:home_space/core/widgets/custom_button.dart';
import 'package:home_space/features/auth/presentation/views/login_view.dart';

class PasswordResetLinkView extends StatelessWidget {
  const PasswordResetLinkView({super.key});

  static const String routeName = "PasswordResetLinkView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.assetsImagesIconsSuccessButton),
              const SizedBox(height: 24),
              Center(
                child: SizedBox(
                  width: 289,
                  child: Text(
                    "We sent a Password Reset link to your email",
                    textAlign: TextAlign.center,
                    style: AppStyles.medium24,
                  ),
                ),
              ),
              const SizedBox(height: 91),
              CustomButton(
                onTap: () {
                  Navigator.pushReplacementNamed(context, LoginView.routeName);
                },
                textContent: "Return To Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
