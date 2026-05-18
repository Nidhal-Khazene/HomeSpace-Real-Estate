import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/features/auth/presentation/views/widgets/login_or_sign_up_password.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import 'custom_social_media_button.dart';

class LoginOrSignUpView extends StatelessWidget {
  const LoginOrSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 70),
          Text('Login or Signup', style: AppStyles.medium32),
          const SizedBox(height: 33),
          const CustomTextField(textContent: "Email Address"),
          const SizedBox(height: 12),
          CustomButton(
            onTap: () {
              Navigator.pushNamed(context, LoginOrSignUpPassword.routeName);
            },
            textContent: "Continue",
            backgroundColor: ColorsData.kPrimaryColor,
          ),
          const SizedBox(height: 95),
          const CustomSocialMediaButton(
            socialIcon: Assets.assetsImagesIconsGoogle,
            textContent: "Continue with Google",
          ),
          const SizedBox(height: 12),
          const CustomSocialMediaButton(
            socialIcon: Assets.assetsImagesIconsApple,
            textContent: "Continue with Apple",
          ),
          const SizedBox(height: 12),
          const CustomSocialMediaButton(
            socialIcon: Assets.assetsImagesIconsFacebook,
            textContent: "Continue with Facebook",
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
